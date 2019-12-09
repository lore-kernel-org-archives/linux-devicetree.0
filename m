Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8565AC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 00:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DAA1206E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 00:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575853003;
	bh=el/OTbphV9HjIKRMZ2QKo2lfvib9RuNgPJS+Z3thZog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=p1JDqH3QguaCyBKbYCbBfehOngP9lP4CTw/ebqO95cPnQoAdDd0ZX19R5QmaXkjHp
	 klVCW67ggq3+EJw8LYeSuqF0tFIKmwGDjd/1HnFBpXLZidie/F+/+VbRbYnZUyGOVE
	 mIaeiHSgZJV9Buzy0w7ZUNifm7ZOoKLdGC6kOF8w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfLIA4m (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Dec 2019 19:56:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbfLIA4m (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 8 Dec 2019 19:56:42 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97F3B206DB;
        Mon,  9 Dec 2019 00:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575853001;
        bh=el/OTbphV9HjIKRMZ2QKo2lfvib9RuNgPJS+Z3thZog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c9hAO1IfDZP+nrTOhuZ0GOxHHLzXnHkYhn2wCFOWaTPBcARl2uQSPFeKkPVcTmMUF
         lSIYNs+VxtvZXxSo5aQO9RkHIC+UF4KLBlIjolglbr899AF/w6eurnY0M6lHPri63X
         jp5olO3T97dRFMojqvojRCxYmfvgi7oGs1uQQDmc=
Date:   Mon, 9 Dec 2019 08:56:26 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] ARM: dts: e60k02: fix power button
Message-ID: <20191209005621.GO3365@dragon>
References: <20191111202959.24189-1-andreas@kemnade.info>
 <20191204123645.GL3365@dragon>
 <20191205070612.27204646@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205070612.27204646@kemnade.info>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 05, 2019 at 07:06:12AM +0100, Andreas Kemnade wrote:
> On Wed, 4 Dec 2019 20:36:47 +0800
> Shawn Guo <shawnguo@kernel.org> wrote:
> 
> > On Mon, Nov 11, 2019 at 09:29:59PM +0100, Andreas Kemnade wrote:
> > > The power button was only producing irqs, but no key events,
> > > Forced power down with long key press works, so probably
> > > only a short spike arrives at the SoC.
> > > Further investigation shows that LDORTC2 is off after boot
> > > of the vendor kernel. LDORTC2 is shared with a GPIO at the pmic
> > > which probably transfers the button press to the SoC.
> > > That regulator off at boot, so "regulator-boot-on" is definitively
> > > wrong. So remove that.
> > > 
> > > Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
> > 
> > Do you want this go into 5.5-rc as a fix?  In that case, we may need a
> > Fixes tag here.
> > 
> well, now there is 
> regulator: core: Let boot-on regulators be powered off
> so the power button should work after regulator_late_cleanup()
> is called but that is usually some time after userspace has started,
> so it would be better to have that in. And of course dt should
> correctly describe the hardware. That would be
> 
> Fixes: c100ea86e6ab ("ARM: dts: add Netronix E60K02 board common file")

Applied with the tag.

> 
> BTW: I have not seen your 5.5 stuff in Linus' tree yet. Seems that Olof
> has not sent his pull request yet or is there bigger trouble?

Now they are in v5.5-rc1.

Shawn
