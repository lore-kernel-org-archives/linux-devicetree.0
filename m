Return-Path: <SRS0=I01o=JO=redhat.com=javierm@kernel.org>
Subject: Re: [PATCH 00/21] TVP5150 fixes and new features
References: <20180628162054.25613-1-m.felsch@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <9058a558-dd67-33f6-b2c7-7e3cdc3a7f61@redhat.com>
Date: Thu, 28 Jun 2018 22:57:28 +0200
MIME-Version: 1.0
In-Reply-To: <20180628162054.25613-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: p.zabel@pengutronix.de, afshin.nasser@gmail.com, sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Marco,

On 06/28/2018 06:20 PM, Marco Felsch wrote:
> First some fixes were made which may possibly interesting for other
> kernel versions.
> 
> Then I picked most of the patches from Philipp [1] and ported them
> to the recent media_tree master branch [3].
> 
> But the main purpose of this series is to convert the proprietary
> connector DT property into the generic input port property. I picked commit
> ('partial revert of "[media] tvp5150: add HW input connectors support"')
> to have a clean working base and used the results of the discussion [2].
> 

Thanks for working on this! I've felt guilty that I never re-worked my
patch-set after the discussion from [2].

I'll try to review these patches next week.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
