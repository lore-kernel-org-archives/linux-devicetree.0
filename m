From: Liu Ying <liu.y.victor@gmail.com>
Subject: Re: [PATCH RFC v9 09/20] drm/dsi: Add a helper to get bits per pixel
 of MIPI DSI pixel format
Date: Fri, 3 Apr 2015 11:28:18 +0800
Message-ID: <CA+8Hj80iRz6RTtzOiYvSPmgiR4w6X+hBukXgBkZz3o6+Z4RecA@mail.gmail.com>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
	<1423720903-24806-10-git-send-email-Ying.Liu@freescale.com>
	<1425380860.3146.49.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425380860.3146.49.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Liu Ying <Ying.Liu@freescale.com>, Thierry Reding <thierry.reding@gmail.com>, stefan.wahren@i2se.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, sboyd@codeaurora.org, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kernel@pengutronix.de, andy.yan@rock-chips.com, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

2015-03-03 19:07 GMT+08:00 Philipp Zabel <p.zabel@pengutronix.de>:
> Hi,
>
> Am Donnerstag, den 12.02.2015, 14:01 +0800 schrieb Liu Ying:
>> Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
>> ---
>> v8->v9:
>>  * Rebase onto the imx-drm/next branch of Philipp Zabel's open git repository.
>
> I can't test this myself for lack of hardware, but I see no further
> issues with patches 09 - 13 except for the use of
> imx_drm_encoder_get_mux_id. I'll either rebase my patches that remove it
> or fix it up when applying.
>
> Thierry, may I take these patches through imx-drm, or would you rather I
> waited for you to pick up the drm/dsi and drm/bridge patches?

Gentle ping.  What's your opinion on the patches Philipp mentioned?

Regards,
Liu Ying

>
> regards
> Philipp
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Best Regards,
Liu Ying
