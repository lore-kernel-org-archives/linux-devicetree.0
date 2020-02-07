Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923E4C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 16:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64819214AF
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 16:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="TNOWV1V8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="TNOWV1V8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgBGQhn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 11:37:43 -0500
Received: from cable.insite.cz ([84.242.75.189]:57185 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726897AbgBGQhn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Feb 2020 11:37:43 -0500
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Feb 2020 11:37:42 EST
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id BADA7A1A40B08;
        Fri,  7 Feb 2020 17:30:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581093035; bh=qsVc9li1fSz4GnDlcZZEioA7hvf54QxlFumBuo2gVok=;
        h=From:Subject:To:Date:From;
        b=TNOWV1V8XUrr3TaoR45yVPEYe6775YJzz/0eVv41q82odStcVDbsCbFGAq4d5YvD6
         0VZwojaFPkOYex/5VLROOr2CEzC9OZHUxk2QLWP6ePTvz3yYfvD8nKmhBKmJyHDWqN
         WZg51uCKz66s2BESOmiSOnl46IvnYCuRLvIIalMk=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wl7j5AY9GYVC; Fri,  7 Feb 2020 17:30:35 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 89C01A1A40B05;
        Fri,  7 Feb 2020 17:30:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581093035; bh=qsVc9li1fSz4GnDlcZZEioA7hvf54QxlFumBuo2gVok=;
        h=From:Subject:To:Date:From;
        b=TNOWV1V8XUrr3TaoR45yVPEYe6775YJzz/0eVv41q82odStcVDbsCbFGAq4d5YvD6
         0VZwojaFPkOYex/5VLROOr2CEzC9OZHUxk2QLWP6ePTvz3yYfvD8nKmhBKmJyHDWqN
         WZg51uCKz66s2BESOmiSOnl46IvnYCuRLvIIalMk=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH] overlays: dwc2: Increase RX FIFO size
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Message-ID: <43db1d9c-6fa2-88bd-11df-6ae2f48a4ac9@ivitera.com>
Date:   Fri, 7 Feb 2020 17:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The previous version of the dwc2 overlay set the RX FIFO size to
256 4-byte words. This sounds large enough for a 1024 byte packet (the
largest isochronous high speed packet allowed), but it doesn't take
into account some extra space needed by the hardware.

Minas Harutyunyan at Synopsys (the source of the DWC OTG design)
came up with a more correct value, 301, but since there is spare packet
RAM this can be increased to 558 to allow two packets per frame.

See: https://github.com/raspberrypi/linux/issues/3447

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

