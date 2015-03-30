From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] PCI: st: Add Device Tree bindings for sti pcie
Date: Mon, 30 Mar 2015 14:28:12 +0200
Message-ID: <CAG374jCm6CREcqKsXYnXHTNCOuaokNA11Sv6_JSW13Vdeo-tHw@mail.gmail.com>
References: <1426515635-9466-1-git-send-email-gabriel.fernandez@linaro.org>
	<1426515635-9466-3-git-send-email-gabriel.fernandez@linaro.org>
	<20150317114213.GH27081@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150317114213.GH27081-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd
List-Id: devicetree@vger.kernel.org

Hi Liviu,

You're right, i removed configuration space from the ranges.

Thanks for reviewing.

Gabriel

On 17 March 2015 at 12:42, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Gabriel,
>
> On Mon, Mar 16, 2015 at 02:20:32PM +0000, Gabriel FERNANDEZ wrote:
>> sti pcie is built around a Synopsis Designware PCIe IP.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/pci/st-pcie.txt | 54 ++++++++++++=
+++++++++++
>>  1 file changed, 54 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/st-pcie.tx=
t
>>
>> diff --git a/Documentation/devicetree/bindings/pci/st-pcie.txt b/Doc=
umentation/devicetree/bindings/pci/st-pcie.txt
>> new file mode 100644
>> index 0000000..94aae2d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/st-pcie.txt
>> @@ -0,0 +1,54 @@
>> +STMicroelectronics STi PCIe controller
>> +
>> +This PCIe host controller is based on the Synopsis Designware PCIe =
IP
>> +and thus inherits all the common properties defined in designware-p=
cie.txt.
>> +
>> +Required properties:
>> + - compatible: "st,stih407-pcie"
>> + - reg: base address and length of the pcie controller, mem-window =
address
>> +   and length available to the controller.
>> + - interrupts: A list of interrupt outputs of the controller. Must =
contain an
>> +   entry for each entry in the interrupt-names property.
>> + - interrupt-names: Should be "msi". STi interrupt that is asserted=
 when an
>> +   MSI is received.
>> + - st,syscfg : should be a phandle of the syscfg node. Also contain=
s syscfg
>> +   offset for IP configuration.
>> + - resets, reset-names: the power-down and soft-reset lines of PCIe=
 IP.
>> +   Associated names must be "powerdown" and "softreset".
>> + - phys, phy-names: the phandle for the PHY device.
>> +   Associated name must be "pcie"
>> +
>> +Optional properties:
>> + - reset-gpio: a GPIO spec to define which pin is connected to the =
bus reset.
>> +
>> +Example:
>> +
>> +pcie0: pcie@9b00000 {
>> +     compatible =3D "st,stih407-pcie", "snps,dw-pcie";
>> +     device_type =3D "pci";
>> +     reg =3D <0x09b00000 0x4000>,      /* dbi cntrl registers */
>> +           <0x2fff0000 0x00010000>,  /* configuration space */
>> +           <0x40000000 0x80000000>;  /* lmi mem window */
>> +     reg-names =3D "dbi", "config", "mem-window";
>> +     st,syscfg =3D <&syscfg_core 0xd8 0xe0>;
>> +     #address-cells =3D <3>;
>> +     #size-cells =3D <2>;
>> +     ranges =3D <0x00000800 0 0x2fff0000 0x2fff0000 0 0x00010000   =
/* configuration space */
>
> Unless you are trying to support some legacy code please remove the c=
onfiguration space from the ranges.
> There is no resource type associated with config space and the generi=
c parser will give you back an
> invalid resource type. The other reason for that is that if you reall=
y claim to be ECAM compliant by
> adding the config space here you need way more than 64K of space.
>
> Best regards,
> Liviu
>
>> +               0x82000000 0 0x20000000 0x20000000 0 0x0FFF0000>; /*=
 non-prefetchable memory */
>> +     num-lanes =3D <1>;
>> +     interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
>> +     interrupt-names =3D "msi";
>> +     #interrupt-cells =3D <1>;
>> +     interrupt-map-mask =3D <0 0 0 7>;
>> +     interrupt-map =3D <0 0 0 1 &intc GIC_SPI 160 IRQ_TYPE_LEVEL_HI=
GH>, /* INT A */
>> +                     <0 0 0 2 &intc GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH=
>, /* INT B */
>> +                     <0 0 0 3 &intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH=
>, /* INT C */
>> +                     <0 0 0 4 &intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH=
>; /* INT D */
>> +
>> +     resets =3D <&powerdown STIH407_PCIE0_POWERDOWN>,
>> +              <&softreset STIH407_PCIE0_SOFTRESET>;
>> +     reset-names =3D "powerdown",
>> +                   "softreset";
>> +     phys =3D <&phy_port0 PHY_TYPE_PCIE>;
>> +     phy-names =3D "pcie";
>> +};
>> --
>> 1.9.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
