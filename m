Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE17BC43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 11:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAD88206F8
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 11:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388125AbgDBLes (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 07:34:48 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:58395 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388121AbgDBLes (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 07:34:48 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id ecb4236b;
        Thu, 2 Apr 2020 13:34:46 +0200 (CEST)
Date:   Thu, 2 Apr 2020 13:34:46 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Michal Simek <michal.simek@xilinx.com>
CC:     michal.simek@xilinx.com, robh@kernel.org,
        devicetree@vger.kernel.org, u-boot@lists.denx.de,
        trini@konsulko.com, loic.poulain@linaro.org
In-reply-to: <ff4d0123-ca41-630e-322f-5251ee1e308e@xilinx.com> (message from
        Michal Simek on Thu, 2 Apr 2020 08:05:36 +0200)
Subject: Re: u-boot DT configuration node
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <016159802e74c8a2@bloch.sibelius.xs4all.nl> <ff4d0123-ca41-630e-322f-5251ee1e308e@xilinx.com>
Message-ID: <01615b4c8ab806fd@bloch.sibelius.xs4all.nl>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> From: Michal Simek <michal.simek@xilinx.com>
> Date: Thu, 2 Apr 2020 08:05:36 +0200
> 
> On 01. 04. 20 20:09, Mark Kettenis wrote:
> >> From: Michal Simek <michal.simek@xilinx.com>
> >> Date: Wed, 1 Apr 2020 11:23:13 +0200
> >>
> >> Hi Rob and others,
> >>
> >> for couple of years already u-boot is using config node in root DT for
> >> u-boot configuration.
> >>
> >> Here is one example in u-boot source code.
> >> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
> >>
> >> And here is dt binding description
> >> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
> >>
> >> I was checking dt binding specification and there no such a thing
> >> described there. It means I expect this is more adhoc u-boot solution.
> >> We have reached the point where could be beneficial to put some u-boot
> >> specific configurations to DT.
> >>
> >> Actually I have done similar thing some time ago too by using chosen
> >> node and add xilinx specific property there to point to eeprom.
> >> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39
> >>
> >> I think it is a time to discuss it and do it properly.
> >>
> >> First of all my question is where we could list SW prefixes to make sure
> >> that they are listed and everybody is aware about it. We have
> >> vendor-prefixes and we should have a way to record also prefixes for sw
> >> projects. U-Boot is using u-boot. Xen has file in the kernel with using
> >> xen prefix. At least these two should be listed.
> > 
> > OpenBSD is using "openbsd," as a prefix.  I've always thought it would
> > be good to have it listed in the list of vendor prefixes there.  In an
> > open source world it shouldn't matter whether an entity sells
> > something or not.  And in fact "inux," is already there.  And so is
> > "qemu,".
> 
> Good we have more.
> 
> 
> > 
> >> Next my question is what is the recommended way to pass sw specific
> >> parameters via DT? I think using chosen node is more appropriate then
> >> adhoc config node. Or is there a better way how this should be done?
> > 
> > On OpenBSD we do indeed use the the chosen node to pass information
> > between the bootloader and the kernel.
> 
> Can you please point me to any example or description what you are
> adding there?

Here is an example of what the chosen node looks like:

    Node 0x2220
            name: 'chosen'
            openbsd,uefi-mmap-desc-ver: 00000001
            openbsd,uefi-mmap-desc-size: 00000030
            openbsd,uefi-mmap-size: 00000540
            openbsd,uefi-mmap-start: 00000081.fbe37df8
            openbsd,uefi-system-table: 00000081.ff910018
            openbsd,bootduid: 1b33bbab.1613122f
            bootargs: 'sd0a:/bsd'
            stdout-path: '/smb/serial@e1010000'

The openbsd,uefi-* proprties are effectively the same those already
documented for linux and xen.  The openbsd,bootduid contains the
unique idea of the boot disk such that the kernel can find it and use
it as its root disk.  There is also an openbsd,bootmac property to
support netbooting, and openbsd,sr-bootuuid and openbsd,sr-bootkey
properties to support booting from software raid with full disk
encryption.  The actual key is zeroed out as soon as possible by the
kernel.

This all is pretty much a private interface between the boot loader
and the kernel though.

For booting on arm64 systems that use ACPI instead of a device tree,
the bootloader creates its own minimal device tree that contains a few
specific nodes that use compatible properties wuth an "openbsd,"
prefix.  But once again that is a private interface between bootloader
and kernel.

Cheers,

Mark
