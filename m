Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C80C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 12:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF12F207FD
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 12:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="rV9YVbIy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfLIMAV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 07:00:21 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:60896 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfLIMAV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 07:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4YwiwvH475Z3NuX8CMnfHl5RhAhrmqF/AqKk4N2sZNY=; b=rV9YVbIy2lBBpoSQEO/WXxedh
        S3WYAwXJzII1a20UL5DOZ0zgWt2aBJkCYP9VncMPDgdTQT16NLCck22X28dNyeTFyZtV+mCkFiXHP
        9tWi4d/aSO9fZdVQQtyJNeqwNJnfGXceh5ZHoURc/Q0cd5EDtm1iZRTuJ7GWEUVTf1ec1raWlUyoB
        DlAHxV97htRgELZKaqMsPw1gwbOgKhBtWOL76JxUuTCU5jp3CG+QidEQVmYTjzwpf8z/wqq7TNrhO
        3jlB/kxexhX78wvuOKWNi0DYYmKmvkbkbtsT1TLWsLJw5KFgc/Q9UPbFgNmqdcwAc7ciCI6iXwGoS
        RljTTj7EA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50584)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ieHi2-0002na-W3; Mon, 09 Dec 2019 12:00:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ieHhy-0003c3-Ol; Mon, 09 Dec 2019 12:00:10 +0000
Date:   Mon, 9 Dec 2019 12:00:10 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Li Yang <leoyang.li@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>
Subject: [PATCH 0/2] Add support for Solidrun CEX7 platforms
Message-ID: <20191209120010.GG25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

This series adds support for the Solidrun Clearfog CX and Honeycomb
platforms that various developers have access to.

 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 123 +++++++++++++++++++++
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |  15 +++
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |  57 ++++++++++
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |  15 +++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  20 ++++
 6 files changed, 232 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
