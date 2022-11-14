export {};

declare global {
    namespace NodeJS {
        interface ProcessEnv {
            DB_PORT: number;
            DB_USER: string | number;
            ENV: 'test' | 'dev' | 'prod';
        }
    }
}