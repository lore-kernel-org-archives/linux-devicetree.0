Return-Path: <SRS0=pf7g=HG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:36958 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751863AbeDQOtQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Apr 2018 10:49:16 -0400
Date: Tue, 17 Apr 2018 07:49:13 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC 12/13] ARM: dts: ti: add dra71-evm FIT description file
Message-ID: <20180417144913.GD5669@atomide.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-13-git-send-email-t-kristo@ti.com>
 <20180417092924.GB20335@flint.armlinux.org.uk>
 <ad5ef67d-d566-0034-a7cd-09a549cbd6d7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5ef67d-d566-0034-a7cd-09a549cbd6d7@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Russell King <rmk@armlinux.org.uk>, devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com, wmills@ti.com, trini@konsulko.com
List-ID: <devicetree@vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [180417 09:36]:
> In typical setup, you can boot a large number of different configs via:
> 
> bootm 0x82000000#dra71-evm#nand#lcd-auo-g101evn01.0
> 
> ... assuming the configs were named like that, and assuming they would be
> compatible with each other. The am57xx-evm example provided is better, as
> you can chain the different cameras to the available evm configs.

Why not just do it in the bootloader to put together the dtb?

Then for external devices, you could just pass info on the
kernel cmdline with lcd=foo camera=bar if they cannot be
detected over I2C.

Regards,

Tony
