From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: Enable "power-source" to be extracted from DT files
Date: Wed, 28 May 2014 10:15:43 +0200
Message-ID: <CACRpkdbaWYgku0_n5CqGU8DAFnn-5jEJ64Mfh9fixB4mRPnfwg@mail.gmail.com>
References: <CACRpkdZyLxMTSygRP6pD-mxghQ_D6tQ821tvn8GYw0Rnh9hZoQ@mail.gmail.com>
	<1401172056-25743-1-git-send-email-iivanov@mm-sol.com>
	<2480893.UEqfxe8meR@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2480893.UEqfxe8meR@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 27, 2014 at 3:09 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Am Dienstag, 27. Mai 2014, 09:27:36 schrieb Ivan T. Ivanov:
>> From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>>
>> Add "power-source" property to generic options used for DT parsing f=
iles.
>> This  enables drivers, which use generic pin configurations, to get =
the
>> value passed to this property.
>
> I think the main problem here is, that pinconf-generic.h defines the =
power-
> source as having a "custom format". With DT as a hardware description=
,
> implementaton specific values do not work well - instead it should ha=
ve a
> regular unit-value.
>
> For the power-source I think volts could work well - as this is the m=
ain use-
> case for pinctrl I know. The regulator-binding uses microvolts, maybe=
 it would
> be good use a similar unit.
(...)
>         pcfg_1v8 {
>                 power-source =3D <1800000>;
>         };

I don't think this is what it's meant for actually. In this case the th=
ing would
be modeled as a regulator rather than some pin control option I guess?

I think it's more like a selector, such as found on old amplifiers,
input source A, B or C? So it's just some discrete number.

Then we don't know which voltage comes from power source A, B, C.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
