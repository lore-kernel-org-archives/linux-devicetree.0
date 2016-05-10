From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] mtd: atmel_nand: remove compatible
 "atmel,sama5d4-nfc"
Date: Tue, 10 May 2016 13:52:58 +0200
Message-ID: <20160510115258.GS2890@piout.net>
References: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
 <20160509201324.GA9845@rob-hp-laptop>
 <B256D81BAE5131468A838E5D7A243641D6487F5A@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D6487F5A@penmbx01>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/05/2016 at 04:50:37 +0000, Yang, Wenyou wrote :
>=20
>=20
> > -----Original Message-----
> > From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> > Sent: 2016=E5=B9=B45=E6=9C=8810=E6=97=A5 4:13
> > To: Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; David Woodhouse
> > <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>; Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>; Mark Brown
> > <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>;=
 Kumar
> > Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> > mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Ferre, Nicolas
> > <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>; Alexandre Belloni <alexandre.belloni@fre=
e-
> > electrons.com>; Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft=
=2Ecom>;
> > Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>; Josh Wu <rainyfeeling@outloo=
k.com>;
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Subject: Re: [PATCH 0/2] mtd: atmel_nand: remove compatible "atmel,=
sama5d4-
> > nfc"
> >=20
> > On Mon, May 09, 2016 at 02:51:17PM +0800, Wenyou Yang wrote:
> > > It is a datasheet bug, for current SoCs, the RB_EDGE3(i.e. bit 27=
) of
> > > HSMC_SR register does not exist, the RB_EDGE0 (i.e. bit 24) is th=
e
> > > ready/busy line edge status bit. So the compatible "atmel,sama5d4=
-nfc"
> > > is unneeded.
> >=20
> > The compatible is needed if the SOC still exists. You can list both=
 for the sama5d4
> > if the block is the same.
>=20
> The NFC IP of SAMA5D4 is same as SAMA5D2's, SAMA5D4 hase this issue. =
 This compatible can be removed.=20
>=20

Well, I agree with Rob, we don't remove an existing compatible. Simply
make it do the right thing (i.e. the same as sama5d3-nfc).

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
