From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] add dts for PopMetal board
Date: Wed, 04 Mar 2015 20:57:40 +0100
Message-ID: <2239622.yIer0hBRK8@phil>
References: <1425201914-4695-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425201914-4695-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, naobsd@gmail.com, romain.perier@gmail.com, b.galvani@gmail.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Sonntag, 1. M=E4rz 2015, 17:25:14 schrieb Andy Yan:
> PopMetal is a rockchip rk3288 based board made by ChipSpark,
> which has many interface such as VGA,HDMI,usb,ir,sdcad and lots of
> sensors such as gyroscope(L3G4200D),accelerometer(mma8452),compass(AK=
8963C).
>=20
> http://wiki.chipspark.com/en/index.php?title=3DPopMetal
>=20
> This patch add basic support for it, which can boot the board
> into a shell with linux boot logo on hdmi, sdcard and many
> sensors enabled. More feather will be enabled later.

I've added both patches to my dts branch


Heiko
