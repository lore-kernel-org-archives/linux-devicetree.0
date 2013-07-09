From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: match the compatible in the order set by the dts file
Date: Tue, 9 Jul 2013 07:03:14 -0500
Message-ID: <CAL_JsqL4ABJCQXveSAMZKOiHwJi=w8zFYjg3DV7kqEEcCXQJcw@mail.gmail.com>
References: <1373013818-11365-1-git-send-email-b32955@freescale.com>
	<20130709070541.GQ516@pengutronix.de>
	<51DBBFDA.70302@freescale.com>
	<20130709075124.GR516@pengutronix.de>
	<51DBC58D.90002@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51DBC58D.90002@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2013 at 3:10 AM, Huang Shijie <b32955@freescale.com> wro=
te:
> =D3=DA 2013=C4=EA07=D4=C209=C8=D5 15:51, Sascha Hauer =D0=B4=B5=C0:
>
>> On Tue, Jul 09, 2013 at 03:46:34PM +0800, Huang Shijie wrote:
>>>
>>> =D3=DA 2013=C4=EA07=D4=C209=C8=D5 15:05, Sascha Hauer =D0=B4=B5=C0:
>>>>
>>>> Why don't you set the matching order in the driver the way you wan=
t it
>>>> to be, i.e.:
>>>>
>>>>         { .compatible =3D "fsl,imx6q-uart", ... },
>>>>         { .compatible =3D "fsl,imx21-uart", ... },
>>>>         { .compatible =3D "fsl,imx1-uart", ... },
>>>>
>>> yes. i can set it like this.
>>>
>>> but this method looks like a ugly workaround.
>>
>> If a driver has different ways of supporting a single device, then
>> putting the preferred or most feature rich on top doesn't look very =
ugly
>> to me.
>
> this method makes it much _coupled_ between the driver and the dts fi=
le.
>
> IMHO, it's an unnecessary _burden_ to the driver programmer:
>    he should puts the most feature compatible on the top.
>
> it's much graceful if we let the driver programmer be transparent abo=
ut
> this.

The dts requires compatible strings to be most specific to least
specific. There is no reason that driver match tables should not be
the same and that is the assumption. Matching is not just based on
compatible properties and your patch does not handle the other cases.

Rob



>
>
> thanks
> Huang Shijie
>
>
>
>
>
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
