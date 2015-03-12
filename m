From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Date: Thu, 12 Mar 2015 10:53:52 +0000
Message-ID: <20150312105352.GC30145@leverpostej>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
 <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 12, 2015 at 10:36:29AM +0000, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 12 March 2015 at 11:19, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> =
wrote:
> > On Wed, Mar 11, 2015 at 10:57 PM, Brian Norris
> > <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Do=
cumentation/devicetree/bindings/mtd/m25p80.txt
> >> index 4611aa83531b..1b2997d4cee4 100644
> >> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
> >> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> >> @@ -3,9 +3,12 @@
> >>  Required properties:
> >>  - #address-cells, #size-cells : Must be present if the device has=
 sub-nodes
> >>    representing partitions.
> >> -- compatible : Should be the manufacturer and the name of the chi=
p. Bear in mind
> >> +- compatible : Should be "nor-jedec" for any SPI NOR flash that c=
an be
> >> +               identified by the JEDEC READ ID opcode (0x95).
> >> +               Additionally, may include a device-specific string=
 consisting of
> >> +               the manufacturer and name of the chip. Bear in min=
d
> >
> > For the casual reader, this suggests putting "nor-jedec" first, whi=
ch is not
> > what we want. So I would write it like e.g.
> >
> > "Should be the manufacturer and the name of the chip. Additionally,
> >  should contain "nor-jedec" for any SPI NOR flash that can be
> >  identified by the JEDEC READ ID opcode (0x95)."
>=20
> I don't really like above. It suggests using manufacturer,name
> always/in most cases. This is what we want to avoid. Let's use
> "nor-jedec" wherever possible (when dealing with JEDEC compatible
> flashes).

The compatible property is a list. We should have "nor-jedec" in the
list, but a more specific string should come first. If we don't
recognise the more specific string, we'll still recognise nor-jedec, if
we do recognise it then we can do more advacned things with the HW (or
work around errata).

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
