-- TCL(TRANSACTION CONTROLL LANGUAGE)
-- TRANSACTION : 논리적 최소 작업 단위
-- commit / rollback
-- commit : dml에 의해 변경된 테이블 상태를 완전히 반영
-- rollback : 이전 commit 상태로 테이블 상태를 되돌림
-- ddl이 자동 commit이기 때문에, dml을 작성하고 ddl을 이어서 작성하면, 앞의 dml이 commit된다.


