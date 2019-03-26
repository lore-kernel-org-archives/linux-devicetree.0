Return-Path: <SRS0=u60/=R5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50056.outbound.protection.outlook.com ([40.107.5.56]:51362
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726266AbfCZTXc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Mar 2019 15:23:32 -0400
From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 0/2] arm64: dts: add fsl-dpaa2-console node
Date: Tue, 26 Mar 2019 19:23:29 +0000
Message-ID: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch set adds the fsl-dpaa2-console device tree node for DPAA2 based
platforms and adds its corresponding documentation.

Ioana Ciornei (2):
  arm64: dts: add fsl-dpaa2-console node for DPAA2 platforms
  Documentation: DT: Add entry for DPAA2 console

 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt | 11 ++++++++=
+++
 MAINTAINERS                                                  |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi               |  5 +++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi               |  5 +++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi               |  5 +++++
 5 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-consol=
e.txt

--=20
1.9.1
