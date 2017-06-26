From: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: Re: [PATCH v1 0/6] Add support of OV9655 camera
Date: Mon, 26 Jun 2017 08:02:31 +0200
Message-ID: <AA7BA0B2-F16F-4BEE-B2ED-7C452D7C4A6F@goldelico.com>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com> <385A82AC-CC23-41BD-9F57-0232F713FED9@goldelico.com> <1E453955-0C1A-414B-BBB2-C64B6D0EF378@goldelico.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1E453955-0C1A-414B-BBB2-C64B6D0EF378-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Discussions about the Letux Kernel <letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hugues,

> Am 23.06.2017 um 12:25 schrieb H. Nikolaus Schaller =
<hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>:
>=20
> Hi Hugues,
>=20
>> Am 22.06.2017 um 17:41 schrieb H. Nikolaus Schaller =
<hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>:
>>=20
>>=20
>>> Am 22.06.2017 um 17:05 schrieb Hugues Fruchet =
<hugues.fruchet-qxv4g6HH51o@public.gmane.org>:
>>>=20
>>> This patchset enables OV9655 camera support.
>>>=20
>>> OV9655 support has been tested using STM32F4DIS-CAM extension board
>>> plugged on connector P1 of STM32F746G-DISCO board.
>>> Due to lack of OV9650/52 hardware support, the modified related code
>>> could not have been checked for non-regression.
>>>=20
>>> First patches upgrade current support of OV9650/52 to prepare then
>>> introduction of OV9655 variant patch.
>>> Because of OV9655 register set slightly different from OV9650/9652,
>>> not all of the driver features are supported (controls). Supported
>>> resolutions are limited to VGA, QVGA, QQVGA.
>>> Supported format is limited to RGB565.
>>> Controls are limited to color bar test pattern for test purpose.
>>>=20
>>> OV9655 initial support is based on a driver written by H. Nikolaus =
Schaller [1].
>>=20
>> Great!
>=20
> Thanks again for picking up or work and trying to get it upstream.
>=20
>>=20
>> I will test as soon as possible.

Here are some more test results and fixes:

>=20
> I have tried and had to fix some issues first:
> * gpio properties have a different name than in our approach (but that =
is something maintainers have to decide and is easy to follow this or =
that way)
> * there is no clock-frequency property which makes the driver request =
a clock frequency (something our camera interface expects this way)

This can indeed be replaced by assigned-clock-rates and no additional
driver code. So there is no need to implement anything new here.

> * there is no vana-supply regulator and we need that to power on/off =
the camera on demand (reset and pwdn isn't enough in our hardware)

this is something we still need to have added by patch

=
<http://git.goldelico.com/?p=3Dgta04-kernel.git;a=3Dblobdiff;f=3Ddrivers/m=
edia/i2c/ov9650.c;h=3Ded5d0a53a9c72036d6e017094b68111b5eb7f00d;hp=3Dc0819a=
fdcefcb19da351741d51dad00aaf909254;hb=3Dda8ae2b038a448c8f822b3a4f20ed378db=
6d2934;hpb=3D6db55fc472eea2ec6db03833df027aecf6649f88>

> * for some unknown reason the driver does not load automatically from =
DT compatibility string and needs to be explicitly modprobed

This turned out to be because the i2c device ids are upper case while =
compatible-strings
are lower-case. See comment for patch 6/6.

BR and looking forward to v2,
Nikolaus=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
