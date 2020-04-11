Return-Path: <SRS0=gZHh=53=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FBAC2BA19
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 04:43:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 036E22083E
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 04:43:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWA6GeEt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgDKEnU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Apr 2020 00:43:20 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34137 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgDKEnU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 11 Apr 2020 00:43:20 -0400
Received: by mail-oi1-f194.google.com with SMTP id 7so2236699oij.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2020 21:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3buNu1Vs7BZCQ2S/CovnA7EY28XLtyw2rS5bzsjFIR4=;
        b=pWA6GeEtYBWUHFg1Y1h0yOD+ceicWneqnWem0PvwXmT8KZTPiEX9x8RyzntBs3Mvz0
         cydUcY+zUAVuxEuQ/QGiq/XSUocldvLcL64EoFPlfrNJDAnUHuQMMJTfFXUNi29IRlup
         xaet9BarDTGuC9uFWez8OfzBbZ9l9dBn8l/71OOydJo5FL7DZ8MPVkMwRZIy/yf0/mw2
         Ht8p/ECQx98EDZ4BEptLQQC4EWIe0ElGHQCmMdaTCd1y7B+yaZ6AZzv5LWBxtALr6H6E
         MtiarWZBre5boT79itLL4MNbH1aUeIMbvd3PbRynlE+omGLLnnGVduG6IZX2BPxxB0K+
         1Hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3buNu1Vs7BZCQ2S/CovnA7EY28XLtyw2rS5bzsjFIR4=;
        b=L2bt1T65mWElJhfMIMhuXYG4F6HrfGVNqKsdACrMXZIO8ceg7W6vvo9uxVhsksR2zi
         MfPCFnNdSoHWaCbsF6b0SATXXT2NlJhxoYAGkqVuyOEV31wEM/UMrYU6OGIqrWCT+Av+
         YsvOMAv5DDtArC7Pdt4XV7PGwjhooToJ0qI/Rv71DEj1PunWbyt70ZOK/UbTgLLUYMNj
         zpB/s1fjClPHsPx/0B7kDRzQs74E1zXQurgWhjLnL9jqeYHZHNmeehhHz1sSWZezu6Rd
         rTRguMelAD1J7N4oTC7lr+bYhTHov2DylpGUcOb6QDdqtfvTpl+uK8T+KyqnHD7vlc6N
         o/yg==
X-Gm-Message-State: AGi0PuYl3IrGzOUXGOCPtntuGlkmERBJRS4fpezR/mie9gQmphlNX59h
        ijZwi7KtMzaVWkK2GFlBwCY+4cF0s9jPhKOfzYA=
X-Google-Smtp-Source: APiQypIvBikBibD4iLwh0jSKspleJs0R+eLujrej0Aw/PhNBkrXIulnaslwSs6tNy5BoTIXB7TJqiR72co9G1Eca508=
X-Received: by 2002:a05:6808:288:: with SMTP id z8mr5357680oic.149.1586580200164;
 Fri, 10 Apr 2020 21:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200410091836.13068-1-sergio.paracuellos@gmail.com> <875ze6vg64.fsf@notabene.neil.brown.name>
In-Reply-To: <875ze6vg64.fsf@notabene.neil.brown.name>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 11 Apr 2020 06:43:09 +0200
Message-ID: <CAMhs-H84P+n4KY04Bbu7LzHqcERzfbuSDTmjpCpvCs+G3S32Eg@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: mt7621-pci-phy: dt: bindings: convert
 bindings file from txt to yaml
To:     NeilBrown <neil@brown.name>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        driverdev-devel@linuxdriverproject.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Neil,

On Sat, Apr 11, 2020 at 5:45 AM NeilBrown <neil@brown.name> wrote:
>
>
> Hi Sergio,
>  thanks for your continuing work on mt7621-pci.
>  I've looked through you patches and while things seem to make sense I
>  don't have the expertise to review them properly.
>
>  I've just a build a kernel based on v5.6.3 with the patches listed
>  below applied from your various emails over the last couple of months.
>
>  I have confirm that PCI works and in particular I don't get the
>  cold-boot hangs that are common without these patches.  So that is an
>  excellent result.

Yes, it seems it is not hanging anymore and that is always a good thing :-).
For me the pci phy driver is ready to be mainlined if the two phys
approach is correct.
and for the pci controller part I need to review how interrupts are
being mapped and
then convert bindings into a yaml file and get feedback about what to
do with the clock stuff.
According to this thread and because there is not a clock plan for
mt7621 assumptions should not be done for peripherals clocks:

http://archive.lwn.net:8080/devicetree/20190724022310.28010-1-gch981213@gmail.com/

So maybe we can just forget about clocks and clock-names stuff in the
pci controller binding and do what we are doing with the clock gate
now which is setting up the bit manually as other similar drivers do.

What do you think? (your tree has the patches of the thread I am
pointed out here applied)

>
> Thanks,
> NeilBrown

Best regards,
    Sergio Paracuellos
>
> 7e4350e416ed staging: mt7621-pci: simplify 'mt7621_pcie_init_virtual_bridges' function
> 283e56fe3f49 staging: mt7621-pci: enable clock bit for each port
> 5edfd9ca31ad MIPS: ralink: mt7621: introduce 'soc_device' initialization
> 7ce68fa530ad staging: mt7621-pci: use gpios for properly reset
> ccffb8f9a204 staging: mt7621-pci: change value for 'PERST_DELAY_MS'
> 840b0de42c22 staging: mt7621-dts: make use of 'reset-gpios' property for pci
> bd44f2c46e60 staging: mt7621-pci: bindings: update doc accordly to last changes
> a83cb7040463 staging: mt7621-pci: release gpios after pci initialization
> 51ae5f557464 staging: mt7621-pci: delete no more needed 'mt7621_reset_port'
> 6d5af2af8fdd staging: mt7621-pci-phy: add 'mt7621_phy_rmw' to simplify code
> 8f4e9d5f57ca staging: mt7621-pci: fix io space and properly set resource limits
> d907c205371d staging: mt7621-pci: fix register to set up virtual bridges
> 1a87910faf27 staging: mt7621-pci: don't return if get gpio fails
> dcd05b5bda59 staging: mt7621-pci-phy: avoid to create to different phys for a dual port one
> b2c3746212ae staging: mt7621-dts: set up only two pcie phys
> ef178ecf08bd staging: mt7621-pci: use only two phys from device tree
> 2553c237ffdc staging: mt7621-pci: change variable to print for slot
> 0bcb3caed96e staging: mt7621-pci: be sure gpio descriptor is null on fails
> 07d3877ebc7e staging: mt7621-pci: avoid to poweroff the phy for slot one
> ba5687b6220b staging: mt7621-dts: gpio 8 and 9 are vendor specific
> 04c8eb6ff776 staging: mt7621-pci: delete release gpios related code
> d3b3de21837b staging: mt7621-pci: use builtin_platform_driver()
> 41cd2464a89e staging: mt7621-pci: add myself as a contributor of the driver
^^^^
This one is not applied to the tree. This should be do throug the
MAINTAINERS file. Will do when this is mainlined.

> 815535a5b6ad staging: mt7621-pci-phy: use builtin_platform_driver()
> 8c26a5eec020 staging: mt7621-pci-phy: re-do 'xtal_mode' detection
> ccaa47aeb530 staging: mt7621-pci: avoid to set 'iomem_resource' addresses
> 28dd5daf3b55 staging: mt7621-pci: properly power off dual-ported pcie phy
> 10e6aa437d6e staging: mt7621-pci-phy: dt: bindings: add mediatek,mt7621-pci-phy.yaml
> 8dc6eec861d2 staging: mt7621-pci-phy: dt: bindings: remove bindings txt file
