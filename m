Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A36C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 15:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B124320833
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 15:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfLDPoj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 10:44:39 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:50439 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbfLDPoj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 10:44:39 -0500
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 16C7F20000E;
        Wed,  4 Dec 2019 15:44:36 +0000 (UTC)
Date:   Wed, 4 Dec 2019 16:44:35 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe PX30 caches
Message-ID: <20191204164435.2dd1b4fe@xps13>
In-Reply-To: <CAMdYzYrEmTqvJ6m54EADxLDf70duCtdz3pesV3EZmt67=cbs5g@mail.gmail.com>
References: <20191204103940.22050-1-miquel.raynal@bootlin.com>
        <CAMdYzYrEmTqvJ6m54EADxLDf70duCtdz3pesV3EZmt67=cbs5g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Peter,

Peter Geis <pgwipeout@gmail.com> wrote on Wed, 4 Dec 2019 10:36:19
-0500:

> On Wed, Dec 4, 2019 at 5:40 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > PX30 SoCs feature 4 Cortex-A35 CPUs with each of them a L1 data and
> > instruction cache. Both are 32kiB wide (PX30 TRM) and made of 64-bit
> > lines (ARM Cortex-A35 manual). I-cache is 2-way set associative (ARM
> > Cortex-A35 manual), D-cache is 4-way set associative (ARM
> > Cortex-A35manual).
> >
> > An L2 cache is placed after these 4 L1 caches (PX30 TRM), is 256kiB
> > wide (PX30 TRM) and made of 64-bit lines (ARM Cortex-A35 manual) and
> > is 8-way set associative (ARM Cortex-A35 manual).
> >
> > Describe all of them in the PX30 DTSI.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/px30.dtsi | 35 ++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > index 1fd12bd09e83..0e10a224a84b 100644
> > --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > @@ -48,6 +48,13 @@
> >                         cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> >                         dynamic-power-coefficient = <90>;
> >                         operating-points-v2 = <&cpu0_opp_table>;
> > +                       i-cache-size = <0x8000>;
> > +                       i-cache-line-size = <64>;
> > +                       i-cache-sets = <256>;
> > +                       d-cache-size = <0x8000>;
> > +                       d-cache-line-size = <64>;
> > +                       d-cache-sets = <128>;
> > +                       next-level-cache = <&l2>;  
> 
> If the i-cache is 2-way associative and the d-cache is 4-way, wouldn't
> that mean these two values are backwards?

Which value are you referring to? Do you mean cache-sets? The following
calculation is my understanding of the situation but it is the first
time I am doing it so I might be totally wrong.

My understanding is that if there are 32768 cache bytes made of 64-byte
lines, so there are 512 lines in both cases.

Then, if the instruction cache is 2-way associative, it means there are
512 / 2 = 256 sets. For the data cache (4-way), it would be 512 / 4 =
128. Am I wrong?

Thanks,
Miquèl
