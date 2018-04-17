Return-Path: <SRS0=pf7g=HG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:51268 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbeDQJTI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Apr 2018 05:19:08 -0400
Date: Tue, 17 Apr 2018 10:18:55 +0100
From: Russell King <rmk@armlinux.org.uk>
Subject: Re: [RFC 00/13] ARM: dts: DT overlay support infra + some data
Message-ID: <20180417091855.GA20335@flint.armlinux.org.uk>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com, wmills@ti.com, tony@atomide.com, trini@konsulko.com
List-ID: <devicetree@vger.kernel.org>

Hi,

Please copy me at linux@armlinux.org.uk not rmk@armlinux.org.uk - this
entire series has ended up in my spam folder.

On Tue, Apr 17, 2018 at 12:10:02PM +0300, Tero Kristo wrote:
> Hi,
> 
> This series is an attempt to start discussion on the DT overlay build time
> support. Basically, one can build DT overlays directly from kernel tree,
> and also build FIT images that contain the kernel + devicetree blobs
> required for specific configuration that can be booted directly with
> u-boot. No runtime support for overlay switching is touched by this
> series.
>
> The main controversy with this series is most likely where the DT overlay
> files should be stored at. Should they still reside with the kernel
> tree or someplace else? Also, the FIT image support is probably
> controversial, should it be part of the kernel build system like shown
> here, or should it be separate? The zImage dependency is pretty annoying
> so maybe it should be done somewhere else.

Please, no, do not add any further build targets for special boot loader
formats.  We already deprecate the "uImage" format when building multi-
platform kernels.

The problem is that we either need to pass in parameters like the load
address and dtb path to include in the image, or we need to add to the
kernel build system the load addresses for every platform, and generate
hundreds of images eating up lots of disk space, and adding to the
kernel build time.

When we switched to dtb and multi-platform support, we decided that it
was much better that such bootloader specific stuff be external to the
kernel tree.

-- 
Russell King
