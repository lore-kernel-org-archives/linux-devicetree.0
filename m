From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCHv4 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Mon, 23 Jan 2017 08:18:35 +0000
Message-ID: <6eb30a9ec3cf4fc9971f33742f334980@svr-chch-ex1.atlnz.lc>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-4-chris.packham@alliedtelesis.co.nz>
 <20170119100244.GX27312@n2100.armlinux.org.uk>
 <c873040cba1a4d5aa15dbaf3c5cc44e0@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kalyan Kinthada <Kalyan.Kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20/01/17 10:10, Chris Packham wrote:=0A=
> On 19/01/17 23:03, Russell King - ARM Linux wrote:=0A=
>> On Fri, Jan 13, 2017 at 10:12:18PM +1300, Chris Packham wrote:=0A=
>>> +static struct mvebu_mpp_ctrl mv98dx3236_mpp_controls[] =3D {=0A=
>>> +	MPP_FUNC_CTRL(0, 32, NULL, armada_xp_mpp_ctrl),=0A=
>>> +};=0A=
>>=0A=
>> As Linus has taken my mvebu pinctrl series, this will need to be=0A=
>> changed to "mvebu_mmio_mpp_ctrl" rather than "armada_xp_mpp_ctrl"=0A=
>> when it's merged.=0A=
>>=0A=
>=0A=
> OK I was thinking about rebasing my series so maybe it's time.=0A=
>=0A=
=0A=
I noticed the mvebu pinctrl series isn't in Linus's (Torvalds) tree. Is =0A=
this on the cards for v4.10 or is it waiting for the next merge window? =0A=
In other words should I send v5 or my series now or wait for this to be =0A=
merged so I can rebase on top of it?=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
