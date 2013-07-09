From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] of: match the compatible in the order set by the dts
 file
Date: Tue, 9 Jul 2013 16:10:53 +0800
Message-ID: <51DBC58D.90002@freescale.com>
References: <1373013818-11365-1-git-send-email-b32955@freescale.com> <20130709070541.GQ516@pengutronix.de> <51DBBFDA.70302@freescale.com> <20130709075124.GR516@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130709075124.GR516@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: grant.likely@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B407=E6=9C=8809=E6=97=A5 15:51, Sascha Hauer =E5=86=
=99=E9=81=93:
> On Tue, Jul 09, 2013 at 03:46:34PM +0800, Huang Shijie wrote:
>> =E4=BA=8E 2013=E5=B9=B407=E6=9C=8809=E6=97=A5 15:05, Sascha Hauer =E5=
=86=99=E9=81=93:
>>> Why don't you set the matching order in the driver the way you want=
 it
>>> to be, i.e.:
>>>
>>> 	{ .compatible =3D "fsl,imx6q-uart", ... },
>>> 	{ .compatible =3D "fsl,imx21-uart", ... },
>>> 	{ .compatible =3D "fsl,imx1-uart", ... },
>>>
>> yes. i can set it like this.
>>
>> but this method looks like a ugly workaround.
> If a driver has different ways of supporting a single device, then
> putting the preferred or most feature rich on top doesn't look very u=
gly
> to me.
this method makes it much _coupled_ between the driver and the dts file=
=2E

IMHO, it's an unnecessary _burden_ to the driver programmer:
    he should puts the most feature compatible on the top.

it's much graceful if we let the driver programmer be transparent about=
=20
this.

thanks
Huang Shijie
