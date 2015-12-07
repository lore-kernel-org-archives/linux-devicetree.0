From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add Marvell PMU documentation
Date: Mon, 07 Dec 2015 11:27:31 +0100
Message-ID: <87k2oqeep8.fsf@free-electrons.com>
References: <E1a5j6L-000873-3P@rmk-PC.arm.linux.org.uk>
	<181206520.JBMXuTWYTV@wuerfel>
	<20151207100438.GL8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151207100438.GL8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org> (Russell King's
	message of "Mon, 7 Dec 2015 10:04:38 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
=20
 On lun., d=C3=A9c. 07 2015, Russell King - ARM Linux <linux-lFZ/pmaqli6BGKjqNUprAg@public.gmane.org=
org.uk> wrote:

> On Mon, Dec 07, 2015 at 10:09:48AM +0100, Arnd Bergmann wrote:
>> On Sunday 06 December 2015 23:52:21 Russell King wrote:
>> > Add the required DT binding documentation for the Marvell PMU driv=
er.
>> >=20
>> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> > ---
>> > Who takes these patches?  This never got merged when the PMU drive=
r
>> > itself was merged.
>>=20
>> I'd say it should go along with the dts changes for mvebu, and we'll
>> merge it through arm-soc.
>
> Well, it didn't, the dts changes are already in as well.  Someone now
> needs to pick it up independently.

OK I will.

The last time Andrew took your series to port it onto 4.2-rc and I
thought he took everything but actually he only focused on the commits
with conflict. Then I merged the series without checking it was
complete. Sorry for having missed it.

Gregory

>
> I wonder how many more of the undocumented bindings are actually caus=
ed
> by people not realising that the binding docs patches have been ignor=
ed.
> (Yes, I've found cases in the past where bindings are undocumented, a=
nd
> no, I don't keep a list and I don't remember which they were.)
>
> --=20
> FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
> according to speedtest.net.

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
