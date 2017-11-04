From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 0/3] Add clock driver for Actions S900 SoC
Date: Sat, 4 Nov 2017 17:05:31 +0800
Message-ID: <62797b3b-a622-48a1-9dc5-3cc2b5c7afd3@suse.de>
References: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509479663-8985-1-git-send-email-manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mani,

Am 01.11.2017 um 03:54 schrieb Manivannan Sadhasivam:
> This series adds clock driver for Actions Semi OWL series
> S900 SoC with relevant clock bindings and device tree data.
> 
> This series also addresses the review comments from previous
> submission happened last year.
> 
> https://patchwork.kernel.org/patch/9254471/

Interesting - I had searched for any S500/S900 patches before starting
to work on this but came up empty on LAKML.

It seems you missed at least one review comment from 2016 about the
example indentation, so please double-check for anything Stephen already
pointed out.

> Driver has been validated on Bubblegum-96 board.
> 
> Thanks,
> Mani
> 
> Manivannan Sadhasivam (3):
>   arm64: dts: actions: add s900 clock controller nodes
>   clk: owl: add clock driver for Actions S900 SoC
>   Documentation: add Actions S900 clock bindings

Please reverse the patch order.

Have you checked S500 code whether the S900 vs. common split is correct?

Many thanks for your work on this,

Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
