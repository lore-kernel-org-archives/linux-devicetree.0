From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: split SolidRun CuBox into variants
Date: Wed, 28 May 2014 00:37:36 +0200
Message-ID: <538513B0.2020903@gmail.com>
References: <1401140009-31505-1-git-send-email-sebastian.hesselbarth@gmail.com> <20140527213549.GU8664@titan.lakedaemon.net> <538508A5.2010809@gmail.com> <32589428.8iAxtgFCnl@phil>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <32589428.8iAxtgFCnl@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/28/2014 12:24 AM, Heiko St=FCbner wrote:
> Am Dienstag, 27. Mai 2014, 23:50:29 schrieb Sebastian Hesselbarth:
>> On 05/27/2014 11:35 PM, Jason Cooper wrote:
>>> On Tue, May 27, 2014 at 07:28:09PM +0200, Sebastian Hesselbarth wro=
te:
>>>> On 05/27/2014 06:11 PM, Jason Cooper wrote:
>>>>> On Mon, May 26, 2014 at 11:33:29PM +0200, Sebastian Hesselbarth w=
rote:
>>> info.  It may be useful here, but I'd like to hear from the DT
>>> maintainers how they want it used.  eg: most popular first, like yo=
u
>>> have it, or oldest first
>>>
>>> dove-cubox-es.dts
>>> +--> dove-cubox.dts
>>
>> In the cubox case, this is not possible. ES has a misrouted
>> card-detection for sdhci, this requires an additional property.
>> There is no way to remove a property once it is written down in
>> any of the files included. But you know about that already.
>=20
> dtc knows "/delete-property/" [0], but I may be missing something her=
e.
>=20
> [0] https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-August=
/018169.html

Heiko,

thanks for the link, I must have completely ignored it! Now that I
think about it, it may be very useful for kirkwood-98xsomething.dtsi
that is a special Kirkwood with a bunch of IP removed (but only some
boards). That way we could consolidate the common SoCs and use
/delete-node/ for the special case SoC.

Anyway, for CuBox ES, I either prefer the v2 approach just send - or
have a cubox-common.dtsi with two board dts for 1G and ES each. We use
this structure a lot and Andrew showed it even works for up to 5 or 10
different variants.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
