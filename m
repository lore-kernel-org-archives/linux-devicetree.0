From: Orson Zhai <orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] Documentation: DT: Add bindings for Spreadtrum serial
Date: Thu, 02 Oct 2014 23:08:35 +0800
Message-ID: <542D6A73.9020505@gmail.com>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com> <1411992293-7729-2-git-send-email-zhang.lyra@gmail.com> <20141001112149.GA13759@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141001112149.GA13759@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "jslaby-AlSwsSmVLrQ@public.gmane.org" <jslaby-AlSwsSmVLrQ@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "m-karicheri2-l0cyMroinI0@public.gmane.org" <m-karicheri2-l0cyMroinI0@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org" <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org" <geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org" <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "chunyan.zhang" <chunyan>
List-Id: devicetree@vger.kernel.org


On 2014=E5=B9=B410=E6=9C=8801=E6=97=A5 19:21, Mark Rutland wrote:
>> diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt =
b/Documentation/devicetree/bindings/serial/of-serial.txt
>> >index 7705477..a0bb1d1 100644
>> >--- a/Documentation/devicetree/bindings/serial/of-serial.txt
>> >+++ b/Documentation/devicetree/bindings/serial/of-serial.txt
>> >@@ -14,6 +14,7 @@ Required properties:
>> >  	- "altr,16550-FIFO32"
>> >  	- "altr,16550-FIFO64"
>> >  	- "altr,16550-FIFO128"
>> >+	- "sprd,serial"
> Is there not a more specific name? I'd imagine you might build a
> different uart in future.
AFAIK, sprd's uart is re-used the same ip core in ARM 32bit chip.
so it is neither 16550 or pl011 compatible.
>
> I didn't spot "sprd" in vendor-prefixes.txt in mainline. Is there a
> patch adding that?
sorry for missing it. we'll add it at patch V2.
thanks for reviewing! :)
>
> Mark.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
