From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] nvmem: imx-ocotp: Add i.MX6 OCOTP driver
Date: Fri, 07 Aug 2015 10:11:23 +0100
Message-ID: <55C4763B.4090508@linaro.org>
References: <1438693342-605-1-git-send-email-p.zabel@pengutronix.de>		 <1438693342-605-2-git-send-email-p.zabel@pengutronix.de>		 <55C38941.9090709@linaro.org> <1438878490.3223.10.camel@pengutronix.de>	 <55C3B74F.5010501@linaro.org> <1438933597.3638.5.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438933597.3638.5.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 07/08/15 08:46, Philipp Zabel wrote:
>>> Nobody. I had initially copied the code that actually senses the fuses,
>>> > >but since this happens during power-on reset anyway (all values are
>>> > >stored in shadow registers), I didn't see the point and dropped it for
>>> > >now.
>>> > >The shadow registers are clocked directly by the ungated ipg_root clock.
>> >
>> >So, are you planning to drop the clocks property from the bindings too?
> The gated clock input exists and is needed for the full functionality of
> the device (writing and re-sensing fuses).
Thanks for clarification.

--srini
  It should be in the device
> tree even if the linux driver doesn't implement writing.
>
> regards
> Philipp
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
