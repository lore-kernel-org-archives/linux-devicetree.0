Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD28C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 13:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CF222076C
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 13:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgFHN1Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 09:27:24 -0400
Received: from mga04.intel.com ([192.55.52.120]:48373 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728799AbgFHN1X (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Jun 2020 09:27:23 -0400
IronPort-SDR: VKI/Ei8xGcDohHE7F3NU470by6Z3iwrVW/zqOKL/Jcj9Ve2BhSXkVqEBpEPD+CdBugwN5ImTi0
 edy2mm2kwYJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:27:22 -0700
IronPort-SDR: ungGUpT5j+d5S0pUhJNhA7Nxvt+IsR8LGvkXo/B4aaVix6dyYH7I2UOo7AgOF0aTiTk0zhzdfk
 GmsMBJ1M7v+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="270507472"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 08 Jun 2020 06:27:17 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jiHo8-00Bgmg-5M; Mon, 08 Jun 2020 16:27:20 +0300
Date:   Mon, 8 Jun 2020 16:27:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200608132720.GS2428291@smile.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605124643.GG2428291@smile.fi.intel.com>
 <1591424358.8804.599.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591424358.8804.599.camel@mhfsdcap03>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jun 06, 2020 at 02:19:18PM +0800, Dongchun Zhu wrote:
> On Fri, 2020-06-05 at 15:46 +0300, Andy Shevchenko wrote:
> > On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:

...

> > > +	depends on I2C && VIDEO_V4L2
> > 
> > No compile test?
> > 
> 
> Sorry?
> Kconfig here is based on the current media tree master branch.
> It is also what the other similar drivers from Dongwoon do. 

COMPILE_TEST.
I dunno if it's established or not practice in media subsystem.

...

> > > +/*
> > > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > > + * or in the case of PD reset taking place.
> > > + */
> > > +#define DW9768_T_OPR_US				1000
> > > +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> > > +#define DW9768_AAC_MODE_DEFAULT			2
> > 
> > > +#define DW9768_AAC_TIME_DEFAULT			0x20
> > 
> > Hex? Why not decimal?
> > 
> 
> There is one optional property 'dongwoon,aac-timing' defined in DT.
> I don't know whether you have noticed that.
> 
> 'DW9768_AAC_TIME_DEFAULT' is the value set to AACT[5:0] register.
> I thought the Hex unit should be proper as it is directly written to the
> Hex register.

I see. I would rather put it like (BIT(6) / 2) to show explicitly that we
choose half of the resolution.

...

> > > +	val = ((unsigned char)ret & ~mask) | (val & mask);
> > 
> > This cast is weird.
> > 
> 
> Thanks for the review, but this cast is using classical pattern from
> your suggestion on OV02A10 v5:
> https://patchwork.linuxtv.org/patch/59788/
> 
> So I wonder whether it is still required to be refined currently.
> Or what would it be supposed to do for the cast?

Okay, does it produce a warning w/o cast?
If yes, replace it at least to be the same type as mask and val.

...

> > > +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> > > +		ret = dw9768_set_dac(dw9768, val);
> > > +		if (ret) {
> > > +			dev_err(&client->dev, "I2C write fail: %d", ret);
> > > +			return ret;
> > > +		}
> > > +		usleep_range(move_delay_us, move_delay_us + 1000);
> > > +	}
> > 
> > 
> > It will look more naturally in the multiplier kind of value.
> > 
> > 	unsigned int steps = DIV_ROUND_UP(...);
> > 
> > 	while (steps--) {
> > 		...(..., steps * ..._MOVE_STEPS);
> > 		...
> > 	}
> > 
> > but double check arithmetics.
> 
> The current coding style is actually updated with reference to your
> previous comments on DW9768 v3:
> https://patchwork.linuxtv.org/patch/61856/

I understand, but can you consider to go further and see if the proposal works?

-- 
With Best Regards,
Andy Shevchenko


