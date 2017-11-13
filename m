From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Question about "unit address format error" of DTC
Date: Mon, 13 Nov 2017 16:27:19 +1100
Message-ID: <20171113052719.GB1014@umbus.fritz.box>
References: <CAK7LNARujG8J_z62bc+PQOz34rf-Bo=+M54kvtokZxnktn2Y+A@mail.gmail.com>
 <CAL_Jsq+eZkCQTEHLb62Le3e6eLxt=N7EWGk7dsPAfLF9-73soQ@mail.gmail.com>
 <CAK7LNARoE6hhhH36ZugfqCNubUQzSLYGkMrx5TzTQe-gpu4CaQ@mail.gmail.com>
 <CAL_JsqKjF0um6UrsyBSKF5bY3rRscRqua0ncJca6ZCOh5VcKwA@mail.gmail.com>
 <CAK7LNASRMBY1KjtzGxtXzkzDWgXmu3ZzfJu5kh1GRqP1WxQ6TQ@mail.gmail.com>
 <CAL_JsqLXRxz-VpFe5AC6NHu5UBvi8frt1CtEFSJH_JhaLDk8QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLXRxz-VpFe5AC6NHu5UBvi8frt1CtEFSJH_JhaLDk8QQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2017 at 09:48:46AM -0600, Rob Herring wrote:
> On Thu, Nov 9, 2017 at 7:48 PM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> > Hi Rob,
> >
> > 2017-11-10 3:04 GMT+09:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> >> On Thu, Nov 9, 2017 at 9:09 AM, Masahiro Yamada
> >> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> >>> Hi Rob,
> >>>
> >>> 2017-11-09 23:15 GMT+09:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> >>>> On Thu, Nov 9, 2017 at 6:14 AM, Masahiro Yamada
> >>>> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> >>>>> Hi Rob, David,
> >>>>>
> >>>>>
> >>>>> I am just curious about a DTC warning.
> >>>>>
> >>>>>
> >>>>> For example,
> >>>>>
> >>>>> soc {
> >>>>>     compatible =3D "simple-bus";
> >>>>>     #address-cells =3D <1>;
> >>>>>     #size-cells =3D <1>;
> >>>>>     ranges;
> >>>>>
> >>>>>     foo@11111111 {
> >>>>>          compatible =3D "foo";
> >>>>>          reg =3D <0x54006800 0x40>;
> >>>>>     };
> >>>>> };
> >>>>>
> >>>>> This emits the following warning.
> >>>>>
> >>>>> Warning (simple_bus_reg): Node /soc/foo@11111111 simple-bus unit
> >>>>> address format error, expected "54006800"
> >>>>>
> >>>>>
> >>>>> But, if I replace "simple-bus" with "simple-mfd",
> >>>>> DTC is completely happy.
> >>>>
> >>>> We could probably add simple-mfd to the check. Though, if you have
> >>>> addresses, then you probably should use simple-bus. I'm not a bit fan
> >>>> of simple-mfd in general.
> >>>>
> >>>>> Why is this check limited to simple bus / PCI bus?
> >>>>
> >>>> Because bus types are free to define their own unit address format to
> >>>> some extent.
> >>>>
> >>>>> For other cases, is mismatching @<address>  allowed?
> >>>>
> >>>> No, but it is not checked. Most other cases such as I2C and SPI buses
> >>>> aren't checked because we have no generic way to key off of them. We
> >>>> need schema data with compatible strings of those bus controllers to
> >>>> do the checking.
> >>>>
> >>>> Any bus type needs to define its unit address format. Generally, it
> >>>> must match data fields in reg property and distinct fields are
> >>>> separated by commas.
> >>>>
> >>>
> >>> Thanks.
> >>> I had a more specific example I wanted to ask,
> >>> but your last comment "distinct fields are separated by commas"
> >>> probably answered the question.
> >>>
> >>>
> >>> The following is an example of NVMEM data cells.
> >>> The generic binding is Documentation/devicetree/binding/nvmem/nvmem.t=
xt
> >>>
> >>>
> >>> reg:    specifies the offset in byte within the storage device.
> >>>
> >>> bits:   Is pair of bit location and number of bits, which specifies o=
ffset
> >>>         in bit and number of bits within the address range specified
> >>> by reg property.
> >>>         Offset takes values from 0-7.
> >>>
> >>> So, it is possible to have multiple data cells
> >>> that share the same "reg".
> >>
> >> In hindsight, I think I'd do away with bits and just define that reg
> >> is the offset and size in bits. Maybe we did discuss that and I've
> >> just forgotten the reasons not to do that.
> >
> >
> > Yeah, I like the idea, but "in hindsight".
> >
> >
> >
> >>>
> >>> @<reg-offset>,<bit-position>
> >>> was the idea in my mind, but I was not 100% sure.
> >>
> >> Yeah, this is fine. Bonus points if you write a check in dtc for it. I
> >> think we can match on #nvmem-cells in the parent node.
> >
> >
> > I have no idea when I can look into it.
> >
> > I think most (all?) of DTC checks are from your contribution.
>=20
> Recently, yes. Except for fixing all my bugs. :)
>=20
> > It would be appreciated if you care to it.
>=20
> I'd appreciate contributions from others. :)
>=20
> > One idea for generic solution might be DTC checks:
> >
> >   - @* exactly matches to reg
> >
> >      or
> >
> >   - The first field of comma separated @*,*,... matches to reg
>=20
> David rejected generic checks of the unit-address beyond what we have
> now. Part of the problem is what is valid vs. what is considered best
> practice today. Or to put another way, things we'd like to check and
> discourage, but aren't something we should fix in existing
> trees/bindings.

Right.

The problem is what does "matches to reg" mean.  Equals reg rendered
as a hex string?  That works for simple cases, but not for more
complex busses.  That won't work for PCI - even the first element
before a , has to be deciphered from the devfn bits encoded within the
various words of the 'reg' address.  A similar scheme would make sense
for many complex busses.

There are other variants to, like I think you can have things like
@i80 on old ISA busses to represent things in IO space rather than
MMIO space.  Not much used nowadays, though.

But the point is that the formatting of the unit address is entirely
up to the bus type.  In traditional OF the unit address could be
determined automatically, but that's because it didn't include just
the device tree, but actual methods for all the devices and busses
that knew how to correctly format the address from 'reg'.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloJLTUACgkQbDjKyiDZ
s5JEQRAAkYVj75pCtJmlAdNOSfZhwWJqmf4zhOHTk3WkKgGXn4T1PXCQQbV+zorj
DXOpHYI4djTRl7EtviGe1/R1SSG37+03uSJH/AFh0sU34L4DfTcz/zYGZlaAnf31
FUwPaNQR4SId83keXbE29LHrNMVZX+ALYV8RV8Ica8j1Hm0kAiK3+mqWu3Ac6g60
uP4ZQJFBkqrfkX2Gpq4UtNTXN0Q0vJDE+QfymBs9csseg1C+Mm/520ra8QxLoARC
OybxJwPlnEyyNG8DSawrR0uEbv2tdDY+4mBLg4lQIozJeKUxNoioLh8ocTXDvROR
oK/GskYWTUY7mt981zzt/8CMbW/Bv9LfWZr+rnWmXMkg9YJHeVRMdMN0nPdTVxq8
wJSgZJKEsB23WqMfDSHcy+yteXcBpWE+in12XrDNP25lN7By+OO6Dk6K5lynaEK1
6sWE5nn2VFhvZ54xg8oWlh1ENlHBYN1cRc5XMb8IsPgdEeYsBUGO/t/SNlrnW/az
SV3uHBzRNNaDgZz9cjNK4V/Fuu/HW5p3K6XTDjTHK1iGP+yL84Ux5zKAOHFhzxcI
AeQKeSsPgNIl03y3nlw1Y+0ZupObpaq8pcJgWJSKOc63XBoLh0fdA2FUlshPtOqA
IKSccx+BKoJham6XSnLpdTdK05mp6yThUY1p8XUf94///EVlhS8=
=dJAX
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
