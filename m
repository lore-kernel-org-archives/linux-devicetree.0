From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT binding document
Date: Fri, 28 Aug 2015 17:57:57 +0300
Message-ID: <5DFD34E6-98F3-49CD-B37A-CE1AFB7C2739@konsulko.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com> <1440739433-6799-3-git-send-email-mporter@konsulko.com> <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Aug 28, 2015, at 17:53 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>=20
> On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> =
wrote:
>> Add a skeleton DT binding document that serves as the canonical
>> example for implementing YAML-based DT bindings documentation.
>> The skeleton binding illustrates use of all fields and variations
>> described in the dt-binding-format.txt documentation.
>>=20
>> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> ---
>> Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++=
++++++++++
>> 1 file changed, 98 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Docum=
entation/devicetree/bindings/skeleton.yaml
>> new file mode 100644
>> index 0000000..175965f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/skeleton.yaml
>> @@ -0,0 +1,98 @@
>> +%YAML 1.2
>> +---
>> +id: skel-device
>> +
>> +title: Skeleton Device
>> +
>> +maintainer:
>> +  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> We'd want to tie this into get_maintainers.pl obviously.
>=20
>> +
>> +description: >
>> +  The Skeleton Device binding represents the SK11 device produced b=
y
>> +  the Skeleton Corporation. The binding can also support compatible
>> +  clones made by second source vendors.
>> +
>> +compatible:
>> +  - name: "skel,sk11"
>> +  - name: "faux,fx11"
>=20
> Is this an OR or AND? We need both.
>=20
> The complicated case is "one of {specific names} followed by {generic=
 name}."
>=20
>> +    description: A clone of the original sk11 device
>> +
>> +required:
>> +  - name: "reg"
>=20
> We definitely need type info from the start.
>=20
>> +    description: chip select address of skeleton device
>> +    reference: spi-slave
>=20
> I would like to not have to list properties if the inherited binding
> lists it. The problem is we need to say how many cells and the order
> (not a problem here, but for mmio devices).
>=20
> Perhaps we can list the reference at the top level for the node
> instead of for every property.
>=20
>> +  - name: "spi-max-frequency"
>> +    description: >
>> +      Maximum SPI clocking speed of skeleton device in Hz, must be
>> +      1000000
>> +    reference: spi-slave
>=20
> Rather than listing the property and having constraint in description=
,
> perhaps we could add constraints like this:
>=20
> - spi-max-frequency-range: 1000000 1000000
>=20
> Or groups of constraints:
>=20
> - spi-max-frequency-constraints:
>  range: 1000000 1000000
>  some-other-constraint: <value>
>=20

I would like something that looks like a C expression.

=46or instance
- constraint: spi-max-frequency >=3D 1000000 && spi-max-frequency < 100=
00000

>> +
>> +optional:
>> +  - name: "spi-cs-high"
>> +    description: >
>> +      Set if skeleton device configuration straps are set for chip
>> +      select polarity high
>> +    reference: spi-slave
>> +
>> +deprecated:
>> +  - name: "skel,deprecated1"
>> +    description: >
>> +      First of two deprecated properties.
>> +  - name: "skel,deprecated2"
>> +    description: >
>> +      Second of two deprecated properties.
>> +
>> +example:
>> +  - dts: |
>> +      sk11@0 {
>> +              compatible =3D "skel,sk11";
>> +              reg =3D <0>;
>> +              spi-max-frequency =3D <1000000>;
>> +              spi-cs-high;
>> +      };
>=20
> At least in this example, we could generate it. Examples are nice, bu=
t
> we have dts files full of examples already. I get a fair number of
> "fix the example" patches, so maybe we should eliminate the simple
> ones.
>=20

How about we make sure we parse the example in the binding always, so
that we verify that it does much what the binding states?

> Rob

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
