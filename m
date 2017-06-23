From: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: Re: [PATCH v1 1/6] DT bindings: add bindings for ov965x camera module
Date: Fri, 23 Jun 2017 16:53:43 +0200
Message-ID: <24C976BF-52FD-4509-BCE4-9AE41B335482@goldelico.com>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com> <d14b8c6e-b480-36f0-ed0a-684647617dbe@suse.de> <3E7B1344-ECE6-4CCC-9E9D-7521BB566CDE@goldelico.com> <13144955.Kq5qljPvgI@avalon>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13144955.Kq5qljPvgI@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Discussions about the Letux Kernel <letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

> Am 23.06.2017 um 13:58 schrieb Laurent Pinchart =
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>:
>=20
> Hi Nikolaus,
>=20
> On Friday 23 Jun 2017 12:59:24 H. Nikolaus Schaller wrote:
>> Am 23.06.2017 um 12:46 schrieb Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>:
>>> Am 23.06.2017 um 12:25 schrieb H. Nikolaus Schaller:
>>>>> diff --git =
a/Documentation/devicetree/bindings/media/i2c/ov965x.txt
>>>>> b/Documentation/devicetree/bindings/media/i2c/ov965x.txt new file =
mode
>>>>> 100644
>>>>> index 0000000..0e0de1f
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/ov965x.txt
>>>>> @@ -0,0 +1,37 @@
>>>>> +* Omnivision OV9650/9652/9655 CMOS sensor
>>>>> +
>>>>> +The Omnivision OV965x sensor support multiple resolutions output, =
such
>>>>> as
>>>>> +CIF, SVGA, UXGA. It also can support YUV422/420, RGB565/555 or =
raw RGB
>>>>> +output format.
>>>>> +
>>>>> +Required Properties:
>>>>> +- compatible: should be one of
>>>>> +	"ovti,ov9650"
>>>>> +	"ovti,ov9652"
>>>>> +	"ovti,ov9655"
>>>>> +- clocks: reference to the mclk input clock.
>>>>=20
>>>> I wonder why you have removed the clock-frequency property?
>>>>=20
>>>> In some situations the camera driver must be able to tell the clock
>>>> source which frequency it wants to see.
>>>=20
>>> That's what assigned-clock-rates property is for:
>>>=20
>>> =
https://www.kernel.org/doc/Documentation/devicetree/bindings/clock/clock-b=

>>> indings.txt
>>>=20
>>> AFAIU clock-frequency on devices is deprecated and equivalent to =
having
>>> a clocks property pointing to a fixed-clock, which is different from =
a
>>> clock with varying rate.
>>=20
>> I am not sure if that helps here. The OMAP3-ISP does not have a fixed =
clock
>> rate so we can only have the driver define what it wants to see.
>>=20
>> And common practise for OMAP3-ISP based camera modules (e.g. N900, =
N9) is
>> that they do it in the driver.
>>=20
>> Maybe ISP developers can comment?
>=20
> The OMAP3 ISP is a variable-frequency clock provider. The clock =
frequency is=20
> controlled by the clock consumer. As such, it's up to the consumer to =
decide=20
> whether to compute and request the clock rate dynamically at runtime, =
or use=20
> the assigned-clock-rates property in DT.
>=20
> Some ISPs include a clock generator, others don't. It should make no=20=

> difference whether the clock is provided by the ISP, by a dedicated =
clock=20
> source in the SoC or by a discrete on-board adjustable clock source.

Thanks for explaining the background.

Do you have an hint or example how to use the assigned-clock-rates =
property in
a DT for a camera module connected to the omap3isp?

Or does it just mean that it defines the property name?

BR,
Nikolaus

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
