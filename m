From: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v1 1/1] mtd: mtk-nor: set controller's address width
 according to nor flash
Date: Mon, 17 Apr 2017 11:34:32 +0800
Message-ID: <1492400072.2866.39.camel@mhfsdcap03>
References: <1491381462-21893-1-git-send-email-guochun.mao@mediatek.com>
         <1491381462-21893-2-git-send-email-guochun.mao@mediatek.com>
         <e9eafca3-41a0-7e88-996b-9d1c51f0c132@wedev4u.fr>
         <1492051237.2866.36.camel@mhfsdcap03>
         <3cf1c63e-c56f-2f07-9d16-7ec346758dfa@wedev4u.fr>
         <e78dba15-80d0-f2c3-c963-a7eb033af58d@wedev4u.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e78dba15-80d0-f2c3-c963-a7eb033af58d-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On Sun, 2017-04-16 at 19:18 +0200, Cyrille Pitchen wrote:
> Le 13/04/2017 à 10:24, Cyrille Pitchen a écrit :
> > Hi Guochun,
> > 
> > Le 13/04/2017 à 04:40, Guochun Mao a écrit :
> >> Hi Cyrille,
> >>
> >> On Wed, 2017-04-12 at 22:57 +0200, Cyrille Pitchen wrote:
> >>> Hi Guochun,
> >>>
> >>> Le 05/04/2017 à 10:37, Guochun Mao a écrit :
> >>>> When nor's size larger than 16MByte, nor's address width maybe
> >>>> set to 3 or 4, and controller should change address width according
> >>>> to nor's setting.
> >>>>
> >>>> Signed-off-by: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>st
> > 
> > Acked-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > 
> 
> Applied to github/spi-nor

Thank you very much!

Best regards,
Guochun

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
