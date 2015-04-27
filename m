From: Vianney le =?iso-8859-1?q?Cl=E9ment?=
	<vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Add Embest MarS Board
Date: Mon, 27 Apr 2015 11:42:38 +0200
Message-ID: <1430127758.1475.2@mail.essensium.com>
References: <1427875809-10444-1-git-send-email-vianney.leclement@essensium.com>
	<20150427083917.GD9231@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150427083917.GD9231@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Thanks for taking time reviewing this.  I will send a follow-up patch.

On Mon, Apr 27, 2015 at 10:39 , Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> If eMMC doesn't work yet, you should just not add it.

Thanks to Lucas and Catalin it does work now :).  Will update it in v2.


> For new dts file, we suggest to use GPL/X11 dual-license for non-Linu=
x
> users. Find example below.
>=20
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm/boot/dts/imx6q-hummingboard.dts

No problem for dual-licensing on my part, but this dts is heavily based=
=20
on imx6q-riotboard.dts (as mentioned in the header), which is only=20
licensed under the GPL.


>>  +		pinctrl_usbotg: usbotggrp {
>>  +			fsl,pins =3D <
>>  +				MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
>>  +				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x000b0	/*=20
>> MX6QDL_PAD_EIM_D22__USB_OTG_PWR */
>=20
> What does the comment mean?

It is a leftover from imx6q-riotboard.dts.  I will change it.

Regards,
Vianney

Vianney le Cl=C3=A9ment de Saint-Marcq
Embedded Software Developper =C2=B7 +32 485 84 55 05
Essensium, Mind division =C2=B7 www.mind.be
GPG: 727B CFE9 355F 1B02 0820 EE1C 9042 3E07 A804 0316

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
