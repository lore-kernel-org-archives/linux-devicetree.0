From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: at91/defconfig: update sama5 defconfig
Date: Thu, 15 Oct 2015 17:31:16 +0200
Message-ID: <20151015153116.GE26893@odux.rfo.atmel.com>
References: <1444824684-24526-1-git-send-email-ludovic.desroches@atmel.com>
 <1444824684-24526-3-git-send-email-ludovic.desroches@atmel.com>
 <20151015132451.GD3421@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151015132451.GD3421-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 03:24:51PM +0200, Alexandre Belloni wrote:
> Hi,
> 
> On 14/10/2015 at 14:11:24 +0200, Ludovic Desroches wrote :
> > Add SAMA5D2 SoC plus Atmel flexcom and Atmel sdhci devices.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/configs/sama5_defconfig | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> It is probably worth updating the multi_v7_defconfig too (in a separate
> patch).
> 

Maybe I have to send a whole defconfig update . I mean when you do
savedefconfig, you have more changes. I won't send each one separately. I
have kept changes which were in relation with the stuff I had.

Or I can send a defconfig update from the savedefconfig and then add
sama5d2, flexcom and sdhci.

Ludovic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
