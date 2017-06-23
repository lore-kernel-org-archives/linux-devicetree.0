From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v1 1/6] DT bindings: add bindings for ov965x camera module
Date: Fri, 23 Jun 2017 12:46:09 +0200
Message-ID: <d14b8c6e-b480-36f0-ed0a-684647617dbe@suse.de>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com>
 <1498143942-12682-2-git-send-email-hugues.fruchet@st.com>
 <D5629236-95D8-45B6-9719-E8B9796FEC90@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D5629236-95D8-45B6-9719-E8B9796FEC90-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Discussions about the Letux Kernel <letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 23.06.2017 um 12:25 schrieb H. Nikolaus Schaller:
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov965x.txt b/Documentation/devicetree/bindings/media/i2c/ov965x.txt
>> new file mode 100644
>> index 0000000..0e0de1f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ov965x.txt
>> @@ -0,0 +1,37 @@
>> +* Omnivision OV9650/9652/9655 CMOS sensor
>> +
>> +The Omnivision OV965x sensor support multiple resolutions output, such as
>> +CIF, SVGA, UXGA. It also can support YUV422/420, RGB565/555 or raw RGB
>> +output format.
>> +
>> +Required Properties:
>> +- compatible: should be one of
>> +	"ovti,ov9650"
>> +	"ovti,ov9652"
>> +	"ovti,ov9655"
>> +- clocks: reference to the mclk input clock.
> 
> I wonder why you have removed the clock-frequency property?
> 
> In some situations the camera driver must be able to tell the clock source
> which frequency it wants to see.

That's what assigned-clock-rates property is for:

https://www.kernel.org/doc/Documentation/devicetree/bindings/clock/clock-bindings.txt

AFAIU clock-frequency on devices is deprecated and equivalent to having
a clocks property pointing to a fixed-clock, which is different from a
clock with varying rate.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
