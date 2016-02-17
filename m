From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] spi/rockchip: Add dt-binding for Rockchip rk3399 spi
Date: Wed, 17 Feb 2016 07:45:09 +0100
Message-ID: <4579617.rz6Yi2sU5M@phil>
References: <1455614538-4415-1-git-send-email-jay.xu@rock-chips.com> <1730751.NYv1NxJVuB@phil> <56C3BD26.3030704@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56C3BD26.3030704@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianqun Xu <jay.xu@rock-chips.com>
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, jwerner@chromium.org, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jianqun,

Am Mittwoch, 17. Februar 2016, 08:21:58 schrieb Jianqun Xu:
> =E5=9C=A8 16/02/2016 22:37, Heiko Stuebner =E5=86=99=E9=81=93:
> > Am Dienstag, 16. Februar 2016, 13:22:23 schrieb Mark Brown:
> >> On Tue, Feb 16, 2016 at 05:22:18PM +0800, jianqun.xu wrote:
> >>>   Documentation/devicetree/bindings/spi/spi-rockchip.txt | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>=20
> >> I'd expect this to be added to both the driver and the binding doc=
ument
> >> not just the document.
> >=20
> > It seems the driver can still use the rk3066-variant - aka nobody h=
as
> > found specific issues in the rk3399 IP implementation.
> >=20
> > Having the more specific IP names already in the dts before actuall=
y
> > using them was suggested by devicetree people to not have to exchan=
ge
> > everything once specific issues were found.
> >=20
> > So right now it's using the fallback-mechanism of binding to the rk=
3066
> > name, but if some obstacle appears it will only take adding the bin=
ding
> > in the driver to make it work (even with old devicetrees).
>=20
> Thank you, got it, and I will re-send this patch with the driver patc=
h.

you have me confused now :-) .

That was meant as a reply to Mark's comment, explaining why the double=20
compatible and the driver only binding to the rk3066-one right now.


Heiko
