Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5227BC2D0C8
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 02:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26E4B206D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 02:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577067566;
	bh=Qs9x63hsjZxcsMDM0L+FbX3+vjr2YojnzjvOHKCVPDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UvbJsNe6z4/8elArWfDvVWKIhMguMkBwnTzA9DwSP1P3n/Mdr6V6ApadaKYmUoksK
	 AzZ2u8YlhzERQWiuPd5OGWfuPFYkFfL/Sp8MaSUrJqI2znjZGTH4vqOxMsC28OUOcJ
	 awNxXQWX/RBIm768Qgv10Jm6M4BlOgZtZ8oqrrcU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfLWCTY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 21:19:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:42824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbfLWCTY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 22 Dec 2019 21:19:24 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 718B8206B7;
        Mon, 23 Dec 2019 02:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577067564;
        bh=Qs9x63hsjZxcsMDM0L+FbX3+vjr2YojnzjvOHKCVPDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aI8aXM9CjGoY6MD/gw4xrY9FOLoPTahrWMuSN9OaS12eTVmRrm86lJHB5xXPDHPXG
         6ROn9pNtagHUUNQ5rDRFYv1Ab8oG7rN7BM9rDMYaQFZAjdpQHqGtCrZgg0eDFi6DRQ
         UALaKXm8bIbrPRe1kCLPUcfCf8C+CfM0b/P4DL/E=
Date:   Mon, 23 Dec 2019 10:19:03 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: lx2160a: add dts for CEX7 platforms
Message-ID: <20191223021900.GE11523@dragon>
References: <20191209120010.GG25745@shell.armlinux.org.uk>
 <E1ieHiU-0004wa-83@rmk-PC.armlinux.org.uk>
 <20191211074006.GP15858@dragon>
 <20191216110137.GD25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216110137.GD25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 16, 2019 at 11:01:37AM +0000, Russell King - ARM Linux admin wrote:
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> > > new file mode 100644
> > > index 000000000000..4761737e62e2
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> > > @@ -0,0 +1,123 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +//
> > > +// Device Tree file for LX2160A-CEx7
> > > +//
> > > +// Copyright 2019 SolidRun Ltd.
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "fsl-lx2160a.dtsi"
> > > +
> > > +/ {
> > > +	model = "SolidRun LX2160A COM Express Type 7 module";
> > > +	compatible = "solidrun,lx2160a-cex7", "fsl,lx2160a";
> > 
> > Any new compatible needs to be documented.
> 
> Grepping for "lx2160a-qds" and "lx2160a-rdb" in that tree shows no
> matches.  Maybe all lx2160a boards should be documented together
> when a place for such documentation is decided upon.  (In other
> words, no, I'm not going to do as you requested until the existing
> boards are given the same treatment you're requesting - otherwise
> it's unfair.)

Okay, I will create a patch to document "lx2160a-qds" and "lx2160a-rdb".

Shawn
