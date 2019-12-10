Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C3BC43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 08:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12FED207FF
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575966799;
	bh=/VKW1xCEg210bfqLE1Nq6Wbt7xZ9sCqggKeIj+4r4iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bgCen4xYy7SLE2wT/48ffArBOJZehcP1dYK/9HLeXFLTgU3TUzFjbXq9WM6+lENrc
	 j9iSvqEBBDOdDvKjGdnjEqyH69za+ld3KbUjJ5jLYSUGXlx2IoEIliL+DpveXonid3
	 li3mHTqIFB9MpYDajdq+ahBVv9js6G8vdgDDDTYI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLJIdS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 03:33:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:54476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfLJIdS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 03:33:18 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7F7E2073D;
        Tue, 10 Dec 2019 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575966798;
        bh=/VKW1xCEg210bfqLE1Nq6Wbt7xZ9sCqggKeIj+4r4iM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+faPYDTzs2fjIOG25xbjNzX5+L5kLZ4YBBGtFU8GvSMzxQgJdfBdWRCIZU9JSm5K
         wzF7eZsdVZwaNYh12PbpSI///dDqSL84OfMBNzyR+54x8afL/0QJzR2WDxVrgtaheq
         t8Dade4ctF1cUXwXyUTwe+6i2FWCB6jZXYktIBjs=
Date:   Tue, 10 Dec 2019 09:33:15 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        arm-linux <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: set GPU clock to 432 MHz
Message-ID: <20191210083315.gixyhp2a4pg7oi7z@gilmour.lan>
References: <20191203021420.164129-1-anarsoul@gmail.com>
 <20191209193112.qr6un5ryhyxwu6a5@hendrix.lan>
 <CA+E=qVcxXu4CggnhZFti-J4MB5m3pvoxKCHnH6ap-4OSZMzCFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+E=qVcxXu4CggnhZFti-J4MB5m3pvoxKCHnH6ap-4OSZMzCFQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 09, 2019 at 12:23:18PM -0800, Vasily Khoruzhick wrote:
> On Mon, Dec 9, 2019 at 12:03 PM Maxime Ripard <mripard@kernel.org> wrote:
> > On Mon, Dec 02, 2019 at 06:14:20PM -0800, Vasily Khoruzhick wrote:
> > > That's what BSP kernel sets it to and it seems to work fine.
> > >
> > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > index 27e48234f1c2..0051f39b3d98 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > @@ -976,6 +976,9 @@ mali: gpu@1c40000 {
> > >                       clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
> > >                       clock-names = "bus", "core";
> > >                       resets = <&ccu RST_BUS_GPU>;
> > > +
> > > +                     assigned-clocks = <&ccu CLK_GPU>;
> > > +                     assigned-clock-rates = <432000000>;
> > >               };
> >
> > This doesn't really guarantee anything. If the GPU needs to remain at
> > that rate, it should be set in the driver. I just saw that you did
> > send a PR in github, I just merged it.
>
> Lima doesn't set GPU frequency at all since it's different for
> different SoCs and we don't support operation points nor frequency
> scaling yet.

You don't really need frequency scaling though, you just need to set
it to any of the OPP. And if that's still too complicated, the binding
mandates to associate a vendor compatible, so you can base the
information on that.

> So this change effectively sets GPU frequency to 432MHz on A64 when
> using lima.

Right before the driver is probed. For all you now, that frequency can
be changed to anything else at the very next operation and you'd end
up in the exact same situation than the one you're trying to fix.

Maxime
