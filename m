From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add UART2 pin nodes
Date: Tue, 18 Apr 2017 21:32:19 +0200
Message-ID: <81e89b9b-1b1c-42f7-eabc-e262cfd99735@suse.de>
References: <20170414171320.19743-1-afaerber@suse.de>
 <20170418053458.phcbp4da3vatejpg@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418053458.phcbp4da3vatejpg@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 18.04.2017 um 07:34 schrieb Maxime Ripard:
> On Fri, Apr 14, 2017 at 07:13:20PM +0200, Andreas Färber wrote:
>> UART2 is exposed on the Pi connector of Pine64. Make a pinctrl node
>> available at the SoC level, to simplify enabling UART2 via DT overlay.
>>
>> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> 
> Applied, thanks!

Thanks, that was fast.

> Could you also create the node in the pine64 DTS (with an explicit
> status = "disabled" in there) so that the overlay would be even easier
> to make ?

Makes sense. I went ahead and did it for all UART nodes then - careful,
final patch is neither build- nor runtime-tested yet.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
