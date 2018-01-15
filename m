From: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] mtd: mtk-nor: modify functions' name more generally
Date: Mon, 15 Jan 2018 09:58:34 +0800
Message-ID: <1515981514.8823.3.camel@mhfsdcap03>
References: <1513561655-10570-1-git-send-email-guochun.mao@mediatek.com>
         <1513561655-10570-2-git-send-email-guochun.mao@mediatek.com>
         <5348c8dd-dc78-bdeb-f9d0-5ce20616d69b@wedev4u.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5348c8dd-dc78-bdeb-f9d0-5ce20616d69b-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

Thank you very much.

BR,
Guochun Mao


On Sun, 2018-01-14 at 16:23 +0100, Cyrille Pitchen wrote:
> Le 18/12/2017 à 02:47, Guochun Mao a écrit :
> > Since more and more Mediatek's SoC can use this driver to
> > control spi-nor flash, functions' name with "mt8173_" is
> > no longer properly. Replacing "mt8173_" with "mtk_" will
> > be more accurate to describe these functions' usable scope.
> > 
> > Signed-off-by: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Applied to the spi-nor/next branch of linux-mtd
> 
> Thanks!
> 
> > ---
> >  drivers/mtd/spi-nor/mtk-quadspi.c |  240 ++++++++++++++++++-------------------
> >  1 file changed, 120 insertions(+), 120 deletions(-)
> > 



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
