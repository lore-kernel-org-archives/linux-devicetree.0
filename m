Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDF2C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 21:12:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12AF321741
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 21:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="EM3+GpOB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="ZV4WN0uT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgBGVMv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 16:12:51 -0500
Received: from cable.insite.cz ([84.242.75.189]:56877 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbgBGVMv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Feb 2020 16:12:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id D29A2A1A40B05;
        Fri,  7 Feb 2020 22:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581109966; bh=vjLjZRimaLLdXirEYigexl5ECe4JAQKBxtDHAHr0fkA=;
        h=From:Subject:To:Date:From;
        b=EM3+GpOBcRrrMKJJbXiJt8IVWUvAiBlP8bptXOGVKEfmcpVYbgThkCAKNDryo3QFx
         prx5MEXezvSbsrjqiqIeEGmhJDVFfWwEUMrbkBqHdKrPBBn6oTkrQ8xKiHZuRtwnTd
         zMw6zQ7RD9KKz0RNHiiH08yGyNIUFOlnfyZp/xhw=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4OWGe8gPi5rn; Fri,  7 Feb 2020 22:12:41 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 656E4A1A40B08;
        Fri,  7 Feb 2020 22:12:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581109961; bh=vjLjZRimaLLdXirEYigexl5ECe4JAQKBxtDHAHr0fkA=;
        h=From:Subject:To:Date:From;
        b=ZV4WN0uTlKZ3FOmRERUXyVtK5rWH45ea/8XfajTHqwoM5MFOWHQaQ5+5cXbTunXgn
         K4+pfL3kHfdoTSeOI2OqbXYHpY0U5RXAY1e7tG3sWR77oRuzRnJUNuAX3tF8jpZ7Tx
         Byf5kL4eVaEid9g+bRVAGfT5mg0BuKCdpqh+IQsk=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Message-ID: <22beb919-a3c6-33c0-8d3f-070061a6c853@ivitera.com>
Date:   Fri, 7 Feb 2020 22:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The previous version of the dwc2 overlay set the RX FIFO size to
256 4-byte words. This is not enough for 1024 bytes of the largest
isochronous high speed packet allowed, because it doesn't take into
account extra space needed by dwc2.

Below is a detailed calculation which arises from dwc2 documentation:

* RAM for SETUP Packets: 4 * n + 6 locations in Scatter/Gather DMA mode
and 5 * n+8 locations in Slave and Buffer DMA mode must be reserved in
the RxFIFO to receive up to n SETUP packets on control endpoints, where n
is the number of control endpoints the device controller supports.

bcm283x: 5*n+8. The Broadcom core has 1 control EP (n=1), so 13 locations

* One location for Global OUT NAK

bcm283x: 1 location

* Status information is written to the FIFO along with each received
packet. Therefore, a minimum space of (Largest Packet Size / 4) + 1 must
be allotted to receive packets. If a high-bandwidth endpoint is enabled,
or multiple isochronous endpoints are enabled, then at least two (Largest
Packet Size / 4) + 1 spaces must be allotted to receive back-to-back
packets. Typically, two (Largest Packet Size / 4) + 1 spaces are
recommended so that when the previous packet is being transferred to AHB,
the USB can receive the subsequent packet. If AHB latency is high, you
must allocate enough space to receive multiple packets. This is critical
to prevent dropping of any isochronous packets.

bcm283x: (1024/4) +1 = 257 locations. For MC >1: 2 * 257 = 514 locations

* Along with last packet of each endpoint, transfer complete status
information is also pushed in to the FIFO.

bcm283x: The core should have 5 IN and 5 OUT EP's.
1 location for each EP - 10 locations.

It's for the case when all EPs are simultaneously completing transfers.

* An additional location for EPDisable status for each endpoint is
also required.

bcm283x: 1 location for each EP - 10 EP's - 10 locations
It's for case if EP simultaneously disabled.

* Typically, two locations for each OUT endpoint is recommended.

bcm283x: 5*2 = 10 locations

Total: 13 + 1 + 257 + 10 +10 + 10 = 301 locations

Safer is 301 + 257 (for MC>1) = 558 locations.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi        | 2 +-
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
index e2fd961..20322de 100644
--- a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
+++ b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 &usb {
 	dr_mode = "otg";
-	g-rx-fifo-size = <256>;
+	g-rx-fifo-size = <558>;
 	g-np-tx-fifo-size = <32>;
 	/*
 	 * According to dwc2 the sum of all device EP
diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
index 0ff0e9e..1409d1b 100644
--- a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
+++ b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 &usb {
 	dr_mode = "peripheral";
-	g-rx-fifo-size = <256>;
+	g-rx-fifo-size = <558>;
 	g-np-tx-fifo-size = <32>;
 	g-tx-fifo-size = <256 256 512 512 512 768 768>;
 };
-- 
1.9.1


