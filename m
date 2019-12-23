Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADF0C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 09:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C907C206D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 09:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfLWJDZ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 04:03:25 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36283 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfLWJDZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Dec 2019 04:03:25 -0500
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C0EFA1BF206;
        Mon, 23 Dec 2019 09:03:21 +0000 (UTC)
Date:   Mon, 23 Dec 2019 10:03:20 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc:     linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe PX30 caches
Message-ID: <20191223100320.3b852485@xps13>
In-Reply-To: <1982322.8UTTk47u2F@diego>
References: <20191204103940.22050-1-miquel.raynal@bootlin.com>
        <1982322.8UTTk47u2F@diego>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Heiko,

Heiko Stübner <heiko@sntech.de> wrote on Fri, 20 Dec 2019 01:55:58
+0100:

> Am Mittwoch, 4. Dezember 2019, 11:39:40 CET schrieb Miquel Raynal:
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
> >  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> >  			dynamic-power-coefficient = <90>;
> >  			operating-points-v2 = <&cpu0_opp_table>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&l2>;
> >  		};
> >  
> >  		cpu1: cpu@1 {
> > @@ -60,6 +67,13 @@
> >  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> >  			dynamic-power-coefficient = <90>;
> >  			operating-points-v2 = <&cpu0_opp_table>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&l2>;
> >  		};
> >  
> >  		cpu2: cpu@2 {
> > @@ -72,6 +86,13 @@
> >  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> >  			dynamic-power-coefficient = <90>;
> >  			operating-points-v2 = <&cpu0_opp_table>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&l2>;
> >  		};
> >  
> >  		cpu3: cpu@3 {
> > @@ -84,6 +105,13 @@
> >  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> >  			dynamic-power-coefficient = <90>;
> >  			operating-points-v2 = <&cpu0_opp_table>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&l2>;
> >  		};
> >  
> >  		idle-states {
> > @@ -107,6 +135,13 @@
> >  				min-residency-us = <2000>;
> >  			};
> >  		};
> > +
> > +		l2: l2-cache {
> > +			compatible = "cache";
> > +			cache-size = <0x40000>;
> > +			cache-line-size = <64>;
> > +			cache-sets = <512>;
> > +		};
> >  	};  
> 
> Looks like Rob did answer my unspoken question, citing his reply to
> 	"arm64: dts: amazon: add Amazon's Annapurna Labs Alpine v3 support" [0]
> 
> "We only define cache attributes if not discoverable or the cache ID 
> registers are wrong and you need to override what's discoverable."
> 
> So unless the cache information read during boot is wrong, it looks
> like we don't need this.

Well, I actually met the:

         "Unable to detect cache hierarchy for CPU <x>"

warning in the dmesg. Do you know anything about cache ID registers?

There is some kind of "i-cache" infos [TRM page 391] but it doesn't
seem enough to describe the cache hierarchy.

> 
> Heiko
> 
> 
> [0] https://patchwork.kernel.org/patch/11279705/

Thanks,
Miquèl
