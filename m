Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12DFC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 15:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A940C2083E
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 15:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=n7space.com header.i=@n7space.com header.b="Rw6/+2+h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgA3Pge (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 10:36:34 -0500
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:22351
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727191AbgA3Pge (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 10:36:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkF/NvLrADUZeXFzfO+GKDz5+i/S/yp2/jghbiAIUi4tRXDlDC+8WRu+c7zvwIIj08ibuK6/DLY03pTBNMwsk1lTEixNXqAhAG+20ODdM28uvJIOKnoUrS6GKDxinVolCf/35bJOKgZR5asi7tuP1WwoE1QLx9buZMTTIDXdJmKbOOM8ngJ2ToTIjRNg5p4fEH6EqPF3jK5rX2TMB8qc42hI6ljARhNRnL/BYjpVZUREg4tNFmY8eVWWd36VseN9KJCqelAFmL4/t1cZ2f89Oudn+6i5Trneu5KiNRDEgG9DzUOEqBCa4yspe2HRmZHSN+t+HPmVWW6RGZJp3GpGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ypikQ1bnwzbz5mWnotWBAqRB0S+lYzRFoEQhEZwnGw=;
 b=QNc7OtLI8M9oAU4ZUoq3CLhYudomBMrz2xJ3Be/m8CdXMOM9uyJCTdzPM5Sr04R0vTfpcnUi6kcYLXoSwVE6W07cBS9aTeFOdBn+yfLwMHVccuzzU5F8pGKVKBJMUUviB2dLUpSxiK94CPh11VGgrf17rHBjHcP5Ij0jQ/zTu9EVD/79oQNEtHFDkRAZdJhJA3iKawps/sTC2OuXz5ZtBDseGfkqfe951W20ocAV/J4l9V1Ue4EiQB6dzASDFSnvgo242KCIucVYFd+udNAK65MpbNZQWwm7DkuOAKW/PFnYtmfsG5blF6Iy/2u+1GRxEYzVkKpLlej+bvKqlMC4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=n7space.com; dmarc=pass action=none header.from=n7space.com;
 dkim=pass header.d=n7space.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n7space.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ypikQ1bnwzbz5mWnotWBAqRB0S+lYzRFoEQhEZwnGw=;
 b=Rw6/+2+hcXfnjdt26yrWk0XNJLtnOuj03Wb71DArKCqJCSavDFQrv/Ly2kPYY8PUDad+DxkyXXqAuP++L8Xj/Qyn099QjKlAszDVUXYJcwwRuMG+u0HnuQ8nDyuPXgARYhuU7AHPA8fbNM35Gm/5uPKEA0pMSaWp3r61FaspB3I=
Received: from AM0PR03MB3651.eurprd03.prod.outlook.com (52.134.80.160) by
 AM0PR03MB4610.eurprd03.prod.outlook.com (20.177.40.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Thu, 30 Jan 2020 15:36:27 +0000
Received: from AM0PR03MB3651.eurprd03.prod.outlook.com
 ([fe80::f0ed:9987:f93f:76d3]) by AM0PR03MB3651.eurprd03.prod.outlook.com
 ([fe80::f0ed:9987:f93f:76d3%7]) with mapi id 15.20.2686.025; Thu, 30 Jan 2020
 15:36:27 +0000
Received: from arm-deb9.n7space.com (85.232.243.86) by AM0PR0402CA0031.eurprd04.prod.outlook.com (2603:10a6:208:15::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via Frontend Transport; Thu, 30 Jan 2020 15:36:26 +0000
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
Subject: [PATCH 1/1] arm64: zynqmp: Add CoreSight components
Thread-Topic: [PATCH 1/1] arm64: zynqmp: Add CoreSight components
Thread-Index: AQHV14MJZb3vn0JX0kKRRyn8jGwhwg==
Date:   Thu, 30 Jan 2020 15:36:27 +0000
Message-ID: <20200130153613.20365-2-wzmuda@n7space.com>
References: <20200130153613.20365-1-wzmuda@n7space.com>
In-Reply-To: <20200130153613.20365-1-wzmuda@n7space.com>
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
x-ms-office365-filtering-correlation-id: e582a2f8-fbb1-4f66-b025-08d7a59a2b84
x-ms-traffictypediagnostic: AM0PR03MB4610:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4610AACDF78F5CBAB6C074EC98040@AM0PR03MB4610.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39830400003)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(316002)(1076003)(54906003)(2906002)(110136005)(7416002)(4326008)(508600001)(2616005)(6486002)(956004)(86362001)(66476007)(71200400001)(16526019)(7696005)(52116002)(8676002)(26005)(5660300002)(81166006)(81156014)(186003)(36756003)(8936002)(66946007)(66556008)(66446008)(64756008)(107886003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR03MB4610;H:AM0PR03MB3651.eurprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: n7space.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kaRguywCKJtvqFiv6aYNfes0LNKEdCr5c+IpjIiS7p2I0MG8TzDMlCDR/ZMLcPTtd2+1CLMccijmbQg3eltSmvS1JD/WQF6rZnQ/AGhWP6Qo01IYOeyUlE3XI1HH6QWdce1egCE1yJn6W1z9Ym3YsfYaMmYH8fekHRv9kuIJFtp0AwPId5O0cQ029G70YHz2gAJVPOktuR+54r1zryH1CW2IEzEZR6SyXTWJgqMJelHkTZH3IWABqFe0hEkRPFk4oJ1T2E75YTGSth/7dECrpcFNtbL51D3EPW13b88HbCmiJ/uWLy6rCxLuW8KJRPcepllJlmiV36LOJN6bbFKPstGmhNchqHxt9jLHM4C5wgfloSPY16yT0XWYzCu7tcs6xhcyP61GBJk8aD5KATEPf+SizBeJ4+iBIpYmEjzuX+uPCGlNTRg7mN1Jloe4de3c
x-ms-exchange-antispam-messagedata: +UHIRO6krTjF798KN0t5akhQNvQoiiKtWuU18NRzp8Han2FSYXmI2WUXPzKlwOykFoyIhC4XN0/1IPoHC38cjPj3uopgcEpRERA77mEBf9FvLBOH7wGjoegBEybMMyWBQwlK5FBQtEJ8Qk1iLlojyA==
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: n7space.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e582a2f8-fbb1-4f66-b025-08d7a59a2b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 15:36:27.1446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5938c8fc-39b0-401e-a174-4e3ffe97d69d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oboDXoRioocURD1BZUw9oA/Tj21L8lmhMkFKuUdXP5NPbXxlfeuoMvr48LOLlDcvQ9PJAIpdXsBnXG0ShVVHdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4610
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Wojciech Zmuda <wzmuda@n7space.com>

Add nodes for the following CoreSight components:
 - ETMs for A53 cores
 - debug components for A53 cores
 - funnel gathering outputs from A53 ETMs and SoC-wide funnels
 - the only replicator
 - all TMCs: 4k ETF, 8k ETF and ETR
 - TPIU

Signed-off-by: Wojciech Zmuda <wzmuda@n7space.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi | 272 +++++++++++++++++++=
++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi           |   2 +
 2 files changed, 274 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi b/arch/arm64/=
boot/dts/xilinx/zynqmp-coresight.dtsi
new file mode 100644
index 000000000000..8b7579ad89cc
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * dtsi for Xilinx Ultrascale+ MPSoC CoreSight components
+ *
+ * Copyright (C) 2019-2020 N7 Space Sp. z o.o.
+ *
+ * Author: Wojciech Zmuda <wzmuda@n7space.com>
+ *
+ */
+/ {
+	etm0@fec40000 {
+		compatible =3D "arm,coresight-etm4x", "arm,primecell";
+		reg =3D <0 0xfec40000 0 0x1000>;
+		cpu =3D <&cpu0>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		out-ports {
+			port {
+				etm0_out_port: endpoint {
+					remote-endpoint =3D <&funnel1_in_port0>;
+				};
+			};
+		};
+	};
+
+	etm1@fed40000 {
+		compatible =3D "arm,coresight-etm4x", "arm,primecell";
+		reg =3D <0 0xfed40000 0 0x1000>;
+		cpu =3D <&cpu1>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		out-ports {
+			port {
+				etm1_out_port: endpoint {
+					remote-endpoint =3D <&funnel1_in_port1>;
+				};
+			};
+		};
+	};
+
+	etm2@fee40000 {
+		compatible =3D "arm,coresight-etm4x", "arm,primecell";
+		reg =3D <0 0xfee40000 0 0x1000>;
+		cpu =3D <&cpu2>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		out-ports {
+			port {
+				etm2_out_port: endpoint {
+					remote-endpoint =3D <&funnel1_in_port2>;
+				};
+			};
+		};
+	};
+
+	etm3@fef40000 {
+		compatible =3D "arm,coresight-etm4x", "arm,primecell";
+		reg =3D <0 0xfef40000 0 0x1000>;
+		cpu =3D <&cpu3>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		out-ports {
+			port {
+				etm3_out_port: endpoint {
+					remote-endpoint =3D <&funnel1_in_port3>;
+				};
+			};
+		};
+	};
+
+	debug0@fec10000 {
+		compatible =3D "arm,coresight-cpu-debug", "arm,primecell";
+		reg =3D <0 0xfec10000 0 0x1000>;
+		cpu =3D <&cpu0>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+	};
+
+	debug1@fed10000 {
+		compatible =3D "arm,coresight-cpu-debug", "arm,primecell";
+		reg =3D <0 0xfed10000 0 0x1000>;
+		cpu =3D <&cpu1>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+	};
+
+	debug2@fee10000 {
+		compatible =3D "arm,coresight-cpu-debug", "arm,primecell";
+		reg =3D <0 0xfee10000 0 0x1000>;
+		cpu =3D <&cpu2>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+	};
+
+	debug3@fee10000 {
+		compatible =3D "arm,coresight-cpu-debug", "arm,primecell";
+		reg =3D <0 0xfef10000 0 0x1000>;
+		cpu =3D <&cpu3>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+	};
+
+	funnel1@fe920000 {
+		compatible =3D "arm,coresight-dynamic-funnel", "arm,primecell";
+		reg =3D <0 0xfe920000 0 0x1000>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		in-ports {
+			#address-cells =3D <0x1>;
+			#size-cells =3D <0x0>;
+			port@0 {
+				reg =3D <0x0>;
+				funnel1_in_port0: endpoint {
+					remote-endpoint =3D <&etm0_out_port>;
+				};
+			};
+			port@1 {
+				reg =3D <0x1>;
+				funnel1_in_port1: endpoint {
+					remote-endpoint =3D <&etm1_out_port>;
+				};
+			};
+			port@2 {
+				reg =3D <0x2>;
+				funnel1_in_port2: endpoint {
+					remote-endpoint =3D <&etm2_out_port>;
+				};
+			};
+			port@3 {
+				reg =3D <0x3>;
+				funnel1_in_port3: endpoint {
+					remote-endpoint =3D <&etm3_out_port>;
+				};
+			};
+		};
+		out-ports {
+			port {
+				funnel1_out_port0: endpoint {
+					remote-endpoint =3D <&etf1_in_port>;
+				};
+			};
+		};
+	};
+
+	funnel2@fe930000 {
+		compatible =3D "arm,coresight-dynamic-funnel", "arm,primecell";
+		reg =3D <0 0xfe930000 0 0x1000>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		in-ports {
+			#address-cells =3D <0x1>;
+			#size-cells =3D <0x0>;
+			port@2 {
+				reg =3D <0x2>;
+				funnel2_in_port2: endpoint {
+					remote-endpoint =3D <&etf1_out_port>;
+				};
+			};
+			// Funnel2 has another input port connected to
+			// funnel0's output. Funnel0 gathers Cortex-R5 ETMs.
+		};
+		out-ports {
+			port {
+				funnel2_out_port0: endpoint {
+					remote-endpoint =3D <&etf2_in_port>;
+				};
+			};
+		};
+	};
+
+	etf1@fe940000 {
+		compatible =3D "arm,coresight-tmc", "arm,primecell";
+		reg =3D <0 0xfe940000 0 0x1000>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		in-ports {
+			port {
+				etf1_in_port: endpoint {
+					remote-endpoint =3D <&funnel1_out_port0>;
+				};
+			};
+		};
+		out-ports {
+			port {
+				etf1_out_port: endpoint {
+					remote-endpoint =3D <&funnel2_in_port2>;
+				};
+			};
+		};
+	};
+
+	etf2@fe950000 {
+		compatible =3D "arm,coresight-tmc", "arm,primecell";
+		reg =3D <0 0xfe950000 0 0x1000>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		in-ports {
+			port {
+				etf2_in_port: endpoint {
+					remote-endpoint =3D <&funnel2_out_port0>;
+				};
+			};
+		};
+		out-ports {
+			port {
+				etf2_out_port: endpoint {
+					remote-endpoint =3D
+						<&replicator_in_port0>;
+				};
+			};
+		};
+	};
+
+	replicator {
+		compatible =3D "arm,coresight-static-replicator";
+		in-ports {
+			port {
+				replicator_in_port0: endpoint {
+					remote-endpoint =3D <&etf2_out_port>;
+				};
+			};
+		};
+		out-ports {
+			#address-cells =3D <0x1>;
+			#size-cells =3D <0x0>;
+			port@0 {
+				reg =3D <0x0>;
+				replicator_out_port0: endpoint {
+					remote-endpoint =3D <&etr_in_port>;
+				};
+			};
+			port@1 {
+				reg =3D <0x1>;
+				replicator_out_port1: endpoint {
+					remote-endpoint =3D <&tpiu_in_port>;
+				};
+			};
+		};
+	};
+
+	etr@fe970000 {
+		compatible =3D "arm,coresight-tmc", "arm,primecell";
+		reg =3D <0 0xfe970000 0 0x1000>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		in-ports {
+			port {
+				etr_in_port: endpoint {
+					remote-endpoint =3D
+						<&replicator_out_port0>;
+				};
+			};
+		};
+	};
+
+	tpiu@fe980000  {
+		compatible =3D "arm,coresight-tpiu", "arm,primecell";
+		reg =3D <0 0xfe980000 0 0x1000>;
+		clocks =3D <&clk100>;
+		clock-names =3D "apb_pclk";
+		in-ports {
+			port {
+				tpiu_in_port: endpoint {
+					remote-endpoint =3D
+						<&replicator_out_port1>;
+				};
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/x=
ilinx/zynqmp.dtsi
index 3c731e73903a..ca0a6b9f4445 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -12,6 +12,8 @@
  * the License, or (at your option) any later version.
  */
=20
+#include "zynqmp-coresight.dtsi"
+
 / {
 	compatible =3D "xlnx,zynqmp";
 	#address-cells =3D <2>;
--=20
2.11.0

