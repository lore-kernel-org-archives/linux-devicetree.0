From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] devicetree: add binding for Sigma Designs SMP86xx interrupt controller
Date: Fri, 22 Jan 2016 16:36:18 +0000
Message-ID: <yw1xbn8dmv0d.fsf@unicorn.mansr.com>
References: <1453313237-18570-1-git-send-email-mans@mansr.com>
	<20160122160644.GA18668@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160122160644.GA18668@rob-hp-laptop> (Rob Herring's message of
	"Fri, 22 Jan 2016 10:06:44 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Wed, Jan 20, 2016 at 06:07:16PM +0000, Mans Rullgard wrote:
>> This adds a binding for the secondary interrupt controller in
>> Sigma Designs SMP86xx and SMP87xx chips.
>>=20
>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>> ---
>> Changes:
>> - not included in v3
>> ---
>>  .../interrupt-controller/sigma,smp8642-intc.txt    | 49 +++++++++++=
+++++++++++
>>  1 file changed, 49 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-cont=
roller/sigma,smp8642-intc.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/=
sigma,smp8642-intc.txt b/Documentation/devicetree/bindings/interrupt-co=
ntroller/sigma,smp8642-intc.txt
>> new file mode 100644
>> index 000000000000..2643f3466091
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/sigma,s=
mp8642-intc.txt
>> @@ -0,0 +1,49 @@
>> +Sigma Designs SMP86xx/SMP87xx secondary interrupt controller
>> +
>> +Required properties:
>> +- compatible: should be "sigma,smp8642-intc"
>> +- reg: physical address of MMIO region
>> +- ranges: address space mapping of child nodes
>> +- interrupt-parent: phandle of parent interrupt controller
>> +- interrupt-controller: boolean
>> +- #address-cells: should be <1>
>> +- #size-cells: should be <1>
>> +
>> +One child node per control block with properties:
>> +- reg: address of registers for this control block
>> +- interrupt-controller: boolean
>> +- #interrupt-cells: should be <2>, interrupt index and flags per in=
terrupts.txt
>> +- interrupts: interrupt spec of primary interrupt controller
>> +
>> +Example:
>> +
>> +interrupt-controller@6e000 {
>> +	compatible =3D "sigma,smp8642-intc";
>> +	reg =3D <0x6e000 0x400>;
>> +	ranges =3D <0x0 0x6e000 0x400>;
>> +	interrupt-parent =3D <&gic>;
>> +	interrupt-controller;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <1>;
>> +
>> +	irq0: irq0 {
>
> Keeping with generic names, this should be interrupt-controller@0 (an=
d=20
> 100, 300).

I could've sworn I'd made that change.  Too many versions of this patch
floating about...

> Otherwise,
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
>> +		reg =3D <0x000 0x100>;
>> +		interrupt-controller;
>> +		#interrupt-cells =3D <2>;
>> +		interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	irq1: irq1 {
>> +		reg =3D <0x100 0x100>;
>> +		interrupt-controller;
>> +		#interrupt-cells =3D <2>;
>> +		interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	irq2: irq2 {
>> +		reg =3D <0x300 0x100>;
>> +		interrupt-controller;
>> +		#interrupt-cells =3D <2>;
>> +		interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +};
>> --=20
>> 2.7.0
>>=20

--=20
M=E5ns Rullg=E5rd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
