Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EF8C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 15:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C04C2051A
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 15:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=n7space.com header.i=@n7space.com header.b="ElClxTr/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgA3Pg3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 10:36:29 -0500
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:22351
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726948AbgA3Pg3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 10:36:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhotx3wmq6ypaslPF32efuzzynh8UYhfh+XB2fzUw7dFXF5eHEkVjdY+mEZkeL1uLolrQ9VMp1cnLtnqA+dbYxXlcO5nyoRqnb4Ubi3//YCwKkhEIE6GIKwgRVpqwYEsMt1pghFLgDWeHtG0Z2ms6gN7ePA+WE7oskZ+8AKkQ+OWuGHFNXvPvmCsefNIgZflCB3ooEomwcFcpZ/elQPLKLqPBjbb+B5vUDd8tB6SF1UoEuYvuRvcQWvWgOXdnObwep3jaPJ054M+ewArAVnbHm7bBhk8pSGPJ3HgXRkZz359VQlpuy3KTRcIbSrYVcgLMjLeM5gygtu6EZi1vFeN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jktkoij8NDa+Avoo8z2LJAHwuQ8W9yYnG+n3azfiACE=;
 b=Ttqa1e/qnHhL5JJKVKbaowgs/I5rXTarmkEu1IPIY0V2X4qtAqJA8C83Z4E7MIp/8wvZPJt9t8+PlpHqtLeldNpXaoWvDAaddmPfbd90y25OMaXQq7XKMrV1h5UxOfe9ZdrlktwOKWlJO2wWOv5M7rpH9XaGDngzRCuW8cHALsg2AFQea0bU/QJCcXBFadtFqtPTwvGhZ0EMoSoJVtur/s7N+VwqABEawIKee5cedI782yipg7DvpajJMUg3EjIbaHKmr6sb/Ffk61HpyHDCG1oMGRBjRYJ3oIVVMuUzOlwZq3VG2z0QDr7Bt8WbbPd3KGgIh7GjLpO7tGnRUunYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=n7space.com; dmarc=pass action=none header.from=n7space.com;
 dkim=pass header.d=n7space.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n7space.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jktkoij8NDa+Avoo8z2LJAHwuQ8W9yYnG+n3azfiACE=;
 b=ElClxTr/FC5B8QhPB1ynlcx2wo4a5DKgil7Fu3gSijYdAusTeoMV0AJJufWuF8eru685wHJ3AH80W33funJbKENyF6MqgVhjHgqHDonFqjfAikvPTz3YINApwHfPphZFxMCGUkpZhwVIUwg+F5jtXm1qy30rT14HYxq/XY2KfAk=
Received: from AM0PR03MB3651.eurprd03.prod.outlook.com (52.134.80.160) by
 AM0PR03MB4610.eurprd03.prod.outlook.com (20.177.40.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Thu, 30 Jan 2020 15:36:25 +0000
Received: from AM0PR03MB3651.eurprd03.prod.outlook.com
 ([fe80::f0ed:9987:f93f:76d3]) by AM0PR03MB3651.eurprd03.prod.outlook.com
 ([fe80::f0ed:9987:f93f:76d3%7]) with mapi id 15.20.2686.025; Thu, 30 Jan 2020
 15:36:24 +0000
Received: from arm-deb9.n7space.com (85.232.243.86) by AM0PR0402CA0031.eurprd04.prod.outlook.com (2603:10a6:208:15::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via Frontend Transport; Thu, 30 Jan 2020 15:36:24 +0000
From:   =?iso-8859-2?Q?Wojciech_=AFmuda?= <wzmuda@n7space.com>
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "nava.manne@xilinx.com" <nava.manne@xilinx.com>,
        "antoine.tenart@bootlin.com" <antoine.tenart@bootlin.com>,
        "t-kristo@ti.com" <t-kristo@ti.com>,
        "rajan.vaja@xilinx.com" <rajan.vaja@xilinx.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        Krzysztof Pilch <kpilch@n7space.com>,
        Michal Mosdorf <mmosdorf@n7space.com>,
        =?iso-8859-2?Q?Micha=B3_Kurowski?= <mkurowski@n7space.com>,
        =?iso-8859-2?Q?Wojciech_=AFmuda?= <wzmuda@n7space.com>
Subject: [PATCH 0/1] Xilinx Zynq Ultrascale+ MPSoc CoreSight DT nodes
Thread-Topic: [PATCH 0/1] Xilinx Zynq Ultrascale+ MPSoc CoreSight DT nodes
Thread-Index: AQHV14MHfOvnV7RdIEuRZSCDICwobA==
Date:   Thu, 30 Jan 2020 15:36:24 +0000
Message-ID: <20200130153613.20365-1-wzmuda@n7space.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0031.eurprd04.prod.outlook.com
 (2603:10a6:208:15::44) To AM0PR03MB3651.eurprd03.prod.outlook.com
 (2603:10a6:208:42::32)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=wzmuda@n7space.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.11.0
x-originating-ip: [85.232.243.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c4b053c-6a38-4f3b-8888-08d7a59a2a1f
x-ms-traffictypediagnostic: AM0PR03MB4610:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB46108663ECF46378BDAD322798040@AM0PR03MB4610.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39830400003)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(316002)(1076003)(54906003)(2906002)(110136005)(7416002)(4326008)(508600001)(2616005)(6486002)(956004)(86362001)(66476007)(71200400001)(16526019)(7696005)(52116002)(8676002)(26005)(5660300002)(81166006)(81156014)(186003)(36756003)(8936002)(66946007)(66556008)(66446008)(64756008)(107886003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR03MB4610;H:AM0PR03MB3651.eurprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: n7space.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V7fgdo+UuPI6KqZK8BgrcLVdiHWHGm6y9z0JR4UwTmFWM1QNZmmty5HFrdhHGXIHKea5zxMnnHGRC3G5UmXTejInkoG4lJo1TWb1imeCrbuEo4D9rqC2T3/R3UkZ303/femqE8M/xJ7YSOHRliFTNEjI9JnVJLwm1X++Y6Kqm/m9IqCCebVEoyKDWx/Ub1e0xJP2CPlh7SJWGBw5TdsaDllfnIYFkawmLgawaBB7qk8jp45eA83FFcfYwOcoDvw1knYrAIE182D7CVnYdybNuEDZDSrmrP13UrIQ8ATTiJEyZb7ddCnx9VcnWicQaHu9+l69528NWH13yarbUuvzNQ6Y25AaPs7nw+UUKBr2WzNhN8gz81hcv67JmlCwz3Qglc95JFUwtLlaJMluai+lsO2aB5l5Saj16TurTHZekufmy8kOO9jwS8Y92JAbJvRn
x-ms-exchange-antispam-messagedata: 8o8vv7wdnsN/kC6cLFazzW0a+dRGfnXS3o+xEdJNp3fMZG3O6t5vebC29WhdrWDaXbW2cz/rF+FVjygwJlFf4bXYrZS8EQUcUEd2/lkxSPX68gG85QaCL1GNvuINdzXocNybR8hN6qynDEboU9GVPw==
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: n7space.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4b053c-6a38-4f3b-8888-08d7a59a2a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 15:36:24.8089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5938c8fc-39b0-401e-a174-4e3ffe97d69d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5uB256hSheN8cQHScdiUXzzLgP0KgWito26qWg17xngG99SkQx6o7b96DF2F4zIvnOCb/GCW/pIZyDdJbVObQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4610
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Wojciech Zmuda <wzmuda@n7space.com>

This patch adds CoreSight nodes to Zynq US+ device tree. I tested in on
recent v5.5 tree, on Xilinx ZCU104 development board.

Tracing with perf:
   root@zynq:~# perf record -e cs_etm/timestamp,cycacc,@tmc_etr0/u true
   Couldn't synthesize bpf events.
   [ perf record: Woken up 1 times to write data ]
   [ perf record: Captured and wrote 0.073 MB perf.data ]

   root@zynq:~# perf report --dump | grep "CoreSight ETM Trace data" -A10
   . ... CoreSight ETM Trace data: size 74112 bytes
           Idx:0; ID:14;   I_ASYNC : Alignment Synchronisation.
           Idx:12; ID:14;  I_TRACE_INFO : Trace Info.; INFO=3D0x1 { CC.1 };=
 CC_THRESHOLD=3D0x100
           Idx:19; ID:14;  I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.; Ad=
dr=3D0xFFFF800010839BF8;
           Idx:28; ID:14;  I_TRACE_ON : Trace On.
           Idx:29; ID:14;  I_ADDR_CTXT_L_64IS0 : Address & Context, Long, 6=
4 bit, IS0.; Addr=3D0x0000FFFF83F37080; Ctxt: AArch64,EL0, NS; CID=3D0x0000=
0281;
           Idx:44; ID:14;  I_ATOM_F1 : Atom format 1.; E
           Idx:45; ID:14;  I_CCNT_F1 : Cycle Count format 1.; Count=3D0x0
           Idx:46; ID:14;  I_TIMESTAMP : Timestamp.; Updated val =3D 0x29aa=
0b739ec; CC=3D0x1
           Idx:58; ID:14;  I_EXCEPT : Exception.;  Data Fault; Ret Addr Fol=
lows;
           Idx:60; ID:14;  I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.; Ad=
dr=3D0x0000FFFF83F37964;

Please note that to get non-zero timestamps on this platform, the timestamp
generator module needs to be explicitly enabled, e.g. from U-Boot, by writi=
ng
'1' to 0xfe900000.

Debug components:
   root@zynq:~# echo 1 > /sys/kernel/debug/coresight_cpu_debug/enable
   root@zynq:~# echo c > /proc/sysrq-trigger
   [   57.5093] ARM external debug module:
   [   57.513099] coresight-cpu-deb fec10000.debug0: CPU[0]:
   [   57.518407] coresight-cpu-debug fec10000.debug0:  EDPRSR:  00000001 (=
Power:On DLK:Unlock
                                                                           =
                   [   57.526583] coresight-cpu-debug fec10000.debug0:  EDP=
CSR: ocal_cpu_stop+0x2c/0x38
   [   57.534236] coresight-cpu-debug fec10000.debug0:  EDCIDSR: 00000000
   [   57.540494] coresit-cpu-debug fec10000.debug0:  EDVIDSR: 90000000 (St=
ate:Non-sece Mode:EL1/0 Width:64bits VMID:0)
   [   57.551095] coresight-cpu-debug fed10000.debug1: CPU[1]:
   [   57.556406] coresig-cpu-debug fed10000.debug1:  EDPRSR:  00000001 (Po=
wer:On DLK:Uock)
   [   57.564584] coresight-cpu-debug fed10000.debug1:  EDPCSR:  local_cpu_=
stop+0x2c/0x38
   [   57.572237] coresightpu-debug fed10000.debug1:  EDCIDSR: 00000000
   [   57.578494] cesight-cpu-debug fed10000.debug1:  EDVIDSR: 90000000 (St=
ate:Non-secure Mode:EL1/0 Width:64bits VMID:0)
   [   57.589096]oresight-cpu-debug fee10000.debug2: CPU[2]:
   [   57.594408] cosight-cpu-debug fee10000.debug2:  EDPRSR:  00000001 (Po=
wer:On DLK:Unlock)
   [   57.602587] coresight-cpu-debug fee10000ebug2:  EDPCSR:  debug_notifi=
er_call+0x2b8/0x3b0
   [   57.61084 coresight-cpu-debug fee10000.debug2:  EDCIDSR: 00000170
   [   57.617103] coresight-cpu-debug fee10000.debug2:  EDVIDSR90000000 (St=
ate:Non-secure Mode:EL1/0 Width:64bits VMID:0)
   [ 57.627705] coresight-cpu-debug fef10000.debug3: CPU[3]:
   [   57.633016] coresight-cpu-debug fef10000.debug3:  EDPRSR: 0000001 (Po=
wer:On DLK:Unlock)
   [   57.641193] coresight-cpu-deg fef10000.debug3:  EDPCSR:  local_cpu_st=
op+0x2c/0x38
   [   57.648846] coresight-cpu-debug fef10000.debug3:  EDCIDSR: 000000
   [   57.655104] coresight-cpu-debug fef10000.debug3:  EDDSR: 90000000 (St=
ate:Non-secure Mode:EL1/0 Width:64bits VMID:0)
   [   57.665708] Rebooting in 60 seconds..

Wojciech Zmuda (1):
  arm64: zynqmp: Add CoreSight components

 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi | 272 +++++++++++++++++++=
++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi           |   2 +
 2 files changed, 274 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi

--=20
2.11.0

