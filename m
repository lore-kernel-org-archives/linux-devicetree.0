From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: doubt about where to put pin-mux in MX28 based platform DT
Date: Fri, 22 Mar 2013 14:28:04 +0100
Message-ID: <514C5C64.4040208@free-electrons.com>
References: <5137769F.1000308@digi.com> <513890D3.5060905@free-electrons.com>
 <514B3C15.8080103@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <514B3C15.8080103-i7dp0qKlBMg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hector,

Le 21/03/2013 17:57, Hector Palacios a =E9crit :
> On 03/07/2013 02:06 PM, Maxime Ripard wrote:
>> Hi Hector,
>>
>> Le 06/03/2013 18:02, Hector Palacios a =E9crit :
>>> I'm creating the DT for a custom platform based on Freescale MX28 CPU
>>> and I have some doubts about where to add some pin mux configurations:
>>> whether in imx28.dtsi or in my platform dts.
>>>
>>> A pair of examples folow:
>>>
>>> Example #1. My platform is using a valid IOMUX for DUART TX/RX lines
>>> which is not covered in imx28.dtsi, namely the I2C0 pins. Since this is
>>> a valid IOMUX that can be used by other platforms, I'd say I should
>>> included it in imx28.dtsi:
>>>
>>> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
>>> index 3fa6d19..8928b7b 100644
>>> --- a/arch/arm/boot/dts/imx28.dtsi
>>> +++ b/arch/arm/boot/dts/imx28.dtsi
>>> @@ -186,6 +186,17 @@
>>>                                          fsl,pull-up =3D <0>;
>>>                                  };
>>>
>>> +                               duart_pins_c: duart@2 {
>>> +                                       reg =3D <2>;
>>> +                                       fsl,pinmux-ids =3D <
>>> +                                               0x3182 /*
>>> MX28_PAD_I2C0_SCL__DUART_RX */
>>> +                                               0x3192 /*
>>> MX28_PAD_I2C0_SDA__DUART_TX */
>>> +                                       >;
>>> +                                       fsl,drive-strength =3D <0>;
>>> +                                       fsl,voltage =3D <1>;
>>> +                                       fsl,pull-up =3D <0>;
>>> +                               };
>>> +
>>>                                  duart_4pins_a: duart-4pins@0 {
>>>                                          reg =3D <0>;
>>>                                          fsl,pinmux-ids =3D <
>>
>> That's right.
> =

> I'm getting into more cases like this: valid IOMUX configurations that
> my platform uses but are not included into imx28.dtsi.
> So before adding new entries I was wondering whether it is a good idea
> to have IOMUX configurations in this include file at all. There are
> multiple valid combinations so why not adding these to the specific
> platform DTS files instead?
> =

> Existing IOMUX configurations in imx28.dtsi that later are not used by
> platform *.dts files are 'polluting' the final DTB with unused nodes.
> Do other architectures follow the same approach?
> Maybe there is a good reason that I simply don't see.

My view on this is: as long as a pinmux combination is defined in the
datasheet, we should add it to the DTSI to avoid duplication and errors
in boards DTS. And all the muxing that is board specific (like which pin
should I mux to the GPIO function to use the LED on my board) should be
in the board DTS.

You have a point about the final DTB size, but I don't think we care
that much...

-- =

Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
