Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAF4C43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 22:58:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5921E20706
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 22:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfLEW6C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 17:58:02 -0500
Received: from hall.aurel32.net ([195.154.113.88]:42106 "EHLO hall.aurel32.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfLEW6C (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Dec 2019 17:58:02 -0500
X-Greylist: delayed 1666 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Dec 2019 17:58:01 EST
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
        by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <aurelien@aurel32.net>)
        id 1iczdF-0004M3-RF; Thu, 05 Dec 2019 23:29:57 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
        (envelope-from <aurelien@aurel32.net>)
        id 1iczdE-00114c-0g; Thu, 05 Dec 2019 23:29:56 +0100
Date:   Thu, 5 Dec 2019 23:29:56 +0100
From:   Aurelien Jarno <aurelien@aurel32.net>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] USB support on stm32mp157 boards
Message-ID: <20191205222956.GA240447@aurel32.net>
Mail-Followup-To: Amelie Delaunay <amelie.delaunay@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191121161152.25541-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121161152.25541-1-amelie.delaunay@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-11-21 17:11, Amelie Delaunay wrote:
> This patchset adds support for USB (Host and OTG) on stm32mp157a-dk1.
> USB OTG HS is forced in Peripheral mode.
> This patchset also fixes USB on stm32mp157c-ev1: USB PHYS supplies were missing
> (CONFIG_REGULATOR_STM32_PWR) and usbotg_hs node requires phy-names property to
> get the phy.
> 
> Amelie Delaunay (5):
>   ARM: multi_v7_defconfig: enable STM32 PWR regulator
>   ARM: dts: stm32: enable USBPHYC on stm32mp157a-dk1
>   ARM: dts: stm32: enable USB Host (USBH) EHCI controller on
>     stm32mp157a-dk1
>   ARM: dts: stm32: enable USB OTG HS on stm32mp157a-dk1
>   ARM: dts: stm32: add phy-names to usbotg_hs on stm32mp157c-ev1
> 
>  arch/arm/boot/dts/stm32mp157a-dk1.dts | 28 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/stm32mp157c-ev1.dts |  1 +
>  arch/arm/configs/multi_v7_defconfig   |  1 +
>  3 files changed, 30 insertions(+)

I tested the series on a stm32mp157c-dk2.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
