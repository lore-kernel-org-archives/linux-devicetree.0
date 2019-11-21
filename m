Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E0AC432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 09:26:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E216E20692
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 09:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKUJ0N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 04:26:13 -0500
Received: from foss.arm.com ([217.140.110.172]:53082 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbfKUJ0N (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Nov 2019 04:26:13 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7278DA7;
        Thu, 21 Nov 2019 01:26:12 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B2EB3F52E;
        Thu, 21 Nov 2019 01:26:11 -0800 (PST)
Date:   Thu, 21 Nov 2019 09:25:41 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] arm64: dts: allwinner: H6: Add PMU mode
Message-ID: <20191121092541.2bf9e5f5@donnerap.cambridge.arm.com>
In-Reply-To: <20191121072230.GD4345@gilmour.lan>
References: <20191121011835.8467-1-andre.przywara@arm.com>
        <20191121011835.8467-2-andre.przywara@arm.com>
        <20191121072230.GD4345@gilmour.lan>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 21 Nov 2019 08:22:30 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

Hi,

> On Thu, Nov 21, 2019 at 01:18:33AM +0000, Andre Przywara wrote:
> > Add the Performance Monitoring Unit (PMU) device tree node to the H6
> > .dtsi, which tells DT users which interrupts are triggered by PMU
> > overflow events on each core. The numbers come from the manual and have
> > been checked in U-Boot and with perf in Linux.
> >
> > Tested with perf record and taskset on a Pine H64.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>  
> 
> Queued all three patches for 5.6, thanks for taking the time to do
> this.
> 
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > index 29824081b43b..86a77b1734e0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -70,6 +70,16 @@
> >  		clock-output-names = "ext_osc32k";
> >  	};
> >
> > +        pmu {  
> 
> This was indented with spaces however, unlike the rest of the DT. I've
> fixed it while applying.

Shoot, thinks for fixing this up, also for queuing it!

Cheers,
Andre.
