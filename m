From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: display: bridge: Document
 THC63LVD1024 LVDS decoder
Date: Tue, 3 Apr 2018 14:33:16 +0200
Message-ID: <20180403123316.GA20945@w540>
References: <4060923.7DxT9ae38L@avalon> <20180327101008.GM27746@w540>
 <6353eb46-5a2d-7b75-a60b-c31c59c8636a@mentor.com>
 <4549018.sA3EWz2jVz@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0154958118=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4549018.sA3EWz2jVz@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: robh@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, airlied@linux.ie, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, niklas.soderlund@ragnatech.se, geert@linux-m68k.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org


--===============0154958118==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Rob,
    sorry for pointing to you directly :)

On Mon, Apr 02, 2018 at 04:36:55PM +0300, Laurent Pinchart wrote:
> Hi Vladimir,
>
> On Tuesday, 27 March 2018 14:03:25 EEST Vladimir Zapolskiy wrote:
> > On 03/27/2018 01:10 PM, jacopo mondi wrote:
> > > On Tue, Mar 27, 2018 at 12:37:31PM +0300, Vladimir Zapolskiy wrote:
> > >> On 03/27/2018 11:57 AM, jacopo mondi wrote:
> > >>> On Tue, Mar 27, 2018 at 11:30:29AM +0300, Vladimir Zapolskiy wrote:

[snip]

> > >>>>>>>>>>
> > >>>>>>>>>>> +- pdwn-gpios: Power down GPIO signal. Active low
> > >>>>>>>>>
> > >>>>>>>>> powerdown-gpios is the semi-standard name.
> > >>>>>>>>
> > >>>>>>>> right, I've also noticed it. If possible please avoid shortenings
> > >>>>>>>> in property names.
> > >>>>>>>
> > >>>>>>> It is not shortening, it just follow pin name from decoder's
> > >>>>>>> datasheet.
> > >>>>>>>
> > >>>>>>>>>>> +- oe-gpios: Output enable GPIO signal. Active high
> > >>>>>>>>>>> +
> > >>>>>>>>
> > >>>>>>>> And this one is also a not ever met property name, please consider
> > >>>>>>>> to rename it to 'enable-gpios', for instance display panels define
> > >>>>>>>> it.
> > >>>>>>>
> > >>>>>>> Again, it follows datasheet naming scheme. Has something changed in
> > >>>>>>> DT conventions?
> > >>>>>>
> > >>>>>> Seconded. My understanding is that the property name should reflect
> > >>>>>> what reported in the the chip manual. For THC63LVD1024 the enable and
> > >>>>>> power down pins are named 'OE' and 'PDWN' respectively.
> > >>>>>>
> > >>>>> But don't we need the vendor prefix in the prop names then, like
> > >>>>> "renesas,oe-gpios" then?
> > >>>>
> > >>>> Seconded, with a correction to "thine,oe-gpios".
> > >>>
> > >>> mmm, okay then...
> > >>>
> > >>> A grep for that semi-standard properties names in Documentation/
> > >>> returns only usage examples and no actual definitions, so I assume this
> > >>> is why they are semi-standard.
> > >>
> > >> Here we have to be specific about a particular property, let it be
> > >> 'oe-gpios' vs. 'enable-gpios' and let's collect some statistics:
> > >>
> > >> % grep -Hr oe-gpios Documentation/devicetree/bindings/* | wc -l
> > >> 0
> > >>
> > >> $ grep -Hr enable-gpios Documentation/devicetree/bindings/* | wc -l
> > >> 86
> > >>
> > >> While 'thine,oe-gpios' would be correct, I see no reason to introduce a
> > >> vendor specific property to define a pin with a common and well
> > >> understood purpose.
> > >>
> > >> If you go forward with the vendor specific prefix, apparently you can set
> > >> the name to 'thine,oe-gpio' (single) or even to 'thine,oe', or does the
> > >> datasheet names the pin as "OE GPIO" or "OE connected to a GPIO"? I
> > >> guess no.
> > >
> > > Let me clarify I don't want to push for a vendor specific name or
> > > similar, I'm fine with using 'semi-standard' names, I'm just confused
> > > by the 'semi-standard' definition. I guess from your examples, the
> > > usage count makes a difference here.
> >
> > yes, in gneneral you can read "semi-standard" as "widely used", thus
> > collecting statistics is a good enough method to make a reasoning.
> >
> > Hopefully the next evolutionary step of "widely used" is "described in
> > standard".
> >
> > >> Standards do not define '-gpios' suffix, but partially the description is
> > >> found in Documentation/bindings/gpio/gpio.txt, still it is not a section
> > >> in any standard as far as I know.
> > >>
> > >>> Seems like there is some tribal knowledge involved in defining what
> > >>> is semi-standard and what's not, or are those properties documented
> > >>> somewhere?
> > >>
> > >> The point is that there is no formal standard which describes every IP,
> > >> every IC and every single their property, some device node names and
> > >> property names are recommended in ePAPR and Devicetree Specification
> > >> though.
> > >>
> > >> Think of a confusion if 'rst-gpios' (have you seen any ICs with an RST
> > >> pin?) and 'reset-gpios' are different. Same applies to 'pdwn-gpios' vs.
> > >> 'powerdown-gpios'.
> > >
> > > I see all your points and I agree with most of them. Anyway, if the
> > > chip manual describes a pin as 'RST' I would not find it confusing to
> > > have a 'rst-gpio' defined in bindings :)
> > >
> > > Let me be a bit pesky here: what if a chip defines a reset GPIO, which
> > > is definitely a reset, but names it, say "XYZ" ? Would you prefer to
> > > see it defined as "reset-gpios" for consistency with other bindings,
> > > or "xyz-gpios" for consistency with documentation?
> >
> > If a pin is definitely an IC reset as you said, then my preference is to see
> > it described under 'reset-gpios' property name, plus a comment in the IC
> > device tree documentation document about it. I can provide two reasons to
> > advocate my position:
> >
> > 1) developers spend significantly more time reading and editing the actual
> >    DTSI/DTS board files rather than reading and editing documentation,
> >    it makes sense to use common property names to save time and reduce
> >    amount of "what does 'oe' stand for?" type of questions; I suppose
> >    that the recommendation to avoid not "widely used" abbreviations in
> >    device node and property names arises from the same reasoning,
> >
> > 2) "widely used" and "standard" properties are excellent candidates for
> >    developing (or re-using) generalization wrappers, it happened so many
> >    times in the past, and this process shall be supported in my opinion;
> >    due to compatibility restrictions it might be problematic to change
> >    property names, and every new exception to "widely used" properties
> >    makes problematic to develop and maintain these kinds of wrappers, and
> >    of course it postpones a desired "described in standard" recognition.
> >
> > If my point of view is accepted, I do admit that a developer who
> > translates a board schematics to board DTS file may experience a minor
> > discomfort, which is mitigated if relevant pin names are found in device
> > tree binding documentation in comments to properties, still the overall
> > gain is noticeably higher in my personal opinion.
>
> I have to disagree with this. When using a property name that doesn't
> correspond to the hardware documentation, developers will need to refer to the
> DT bindings documentation to confirm the property name. "Widely used" property
> names will not save time, they will use more time. This is of course marginal
> and I don't think it would have any noticeable impact, but I don't think your
> argument holds.
>
> I'm all for standardizing properties across DT bindings for multiple
> components, but doing so in a semi-random fashion will in my opinion not
> result in any gain. We can decide that power-down or output-enable GPIOS
> should have common property names (and I'm not even sure that would be useful,
> but we can certainly discuss it), but in that case someone should make a
> proposal and get the names standardized. Unless we do so, no matter what
> property name gets picked for a particular binding, it won't become
> universally used by magic.
>
> I'd like to hear the DT bindings maintainers position on this matter.
>

Me too :)

As driver developer I see both Vladimir's and Laurent's points.
I still prefer to reflect in bindings the pin name assigned in the
chip manual, over semi-standard names, but that's a personal preference.

In order to send next version I would like to know which direction do
the dt custodians should be taken on this.

Thanks
   j


> --
> Regards,
>
> Laurent Pinchart
>
>
>

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaw3SDAAoJEHI0Bo8WoVY8bJMP/jSXzAm9ADPSZe7dv16SA6Eu
plOdPDgOfSUcBICGfz+pY60NQZ/JkP0b5I5HzhgrDXbk3XlSfxA3Y34byp7C9M0f
b93yQ85EzMA77XX9FOS3I/lgyfMcVzg1pYTeU4wZGotykYzQHkApM1mHYQzl4dqx
nlEcpKPOvlbm5Px5+lZ4HyjG6631S1r0hMthmjAf/6lwWYgmmVzHy7Ri0awK28EW
fO3S46zn5QSYtjeEXDm8UHn93CJrMm6Jz9NtUsJjNABLWVT2jOHJtcoK+D47bCIQ
gHpksrmGs7UugrRNVwMuA65C7o9b69S9uCZkDx0pl1Gqzec97nhBiFod0IjjfJ8z
7V5iKgFsFPl11ajDyoDHxaWE/ccbIEl4p4dZilV9YCdIIjwx4+rANgRKgv892hoz
IKdbn2NSNVgxEaTlZMAtxfyoKR5KGNL6Fu4+9u3DLsnbjcKnctk3i6SSbBPj+F1o
vt+DwDx691ThWjwCMVWyK8KjRVLTAb9fxPKk/QP5xcoj1LrdRDDx8A30QmHuqr9N
O3WBZXlei/k8rAVzzFyYTmHbPgV+OrCFFNS5HocUaeSPZsFMZ+TjXsvHOIqkD1bq
e5pd5Lw9moHlbMKz5HlIP1h5oBeMRHedK3yyEkf2muUmouA9Af7oqBq9JVVqWFhJ
Y5FAFDtH00AlK9Skt7BG
=1DXU
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============0154958118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0154958118==--
