From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/1] ARM: imx28: add basic dt support
Date: Sat, 24 Mar 2012 01:21:38 +0800
Message-ID: <CAA+hA=RV=pfAUT5Q+kXe5WXwwKx5kgAAaV+e9F5heCCBC=HoSQ@mail.gmail.com>
References: <1332513070-5400-1-git-send-email-b29396@freescale.com>
 <201203231543.54588.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203231543.54588.marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Fri, Mar 23, 2012 at 10:43 PM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Dear Dong Aisheng,
>
>> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> This patch includes basic dt support which can boot via nfs rootfs.
>>
>> Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> ChangeLog v1->v2:
>> =A0* Some fixes addressed Rob's review comments.
>> =A0 =A0Remove using of OF_DEV_AUXDATA.
>> =A0* Remove mac address from dts file
>> =A0 =A0Currently we use the mac address got from uboot to work.
>> =A0 =A0Will submit a p separate atch using prom_update_property to fix t=
his
>> =A0 =A0issue for driver based on suggestions from Grant and Lothar.
>> =A0* rename mxs-dt.c to mach-mxs.c which is supposed to support mx23 dt
>> =A0 =A0too in the future.
>> =A0* add compatible string "fsl,imx28" per Sascha's suggestion
>> =A0* add more devices in dtsi file
>> =A0 =A0For those devices still not in use, set the state to "disabled"
>> =A0 =A0by default.
>>
>> For other patches i sent with this in the first series like mmc and sdma
>> dt support, i will send out them separately since this patch does not
>> depend on them and does not block you to run dt via nfs rootfs.
>> ---
>> =A0Documentation/devicetree/bindings/arm/fsl.txt | =A0 =A04 +
>> =A0arch/arm/boot/dts/imx28-evk.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 35 =
+++
>
> Isn't this supposed to be "mx28evk.dts"?
>
I just keep consistent with other existing imx dts file like imx6q-arm2.dts.

>> =A0arch/arm/boot/dts/imx28.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
358
>> +++++++++++++++++++++++++ arch/arm/mach-mxs/Kconfig =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 |
>> =A0 8 +
>> =A0arch/arm/mach-mxs/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
>> =A0arch/arm/mach-mxs/clock-mx28.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A04 +
>> =A0arch/arm/mach-mxs/mach-mxs.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 69 +++++
>> =A07 files changed, 479 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/boot/dts/imx28-evk.dts
>> =A0create mode 100644 arch/arm/boot/dts/imx28.dtsi
>> =A0create mode 100644 arch/arm/mach-mxs/mach-mxs.c
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt
>> b/Documentation/devicetree/bindings/arm/fsl.txt index 54bddda..9f21faf
>> 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.txt
>> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
>> @@ -1,6 +1,10 @@
>> =A0Freescale i.MX Platforms Device Tree Bindings
>> =A0-----------------------------------------------
>>
>> +i.MX28 Evaluation Kit
>> +Required root node properties:
>> + =A0 =A0- compatible =3D "fsl,imx28-evk", "fsl,imx28";
>> +
>> =A0i.MX51 Babbage Board
>> =A0Required root node properties:
>> =A0 =A0 =A0- compatible =3D "fsl,imx51-babbage", "fsl,imx51";
>> diff --git a/arch/arm/boot/dts/imx28-evk.dts
>> b/arch/arm/boot/dts/imx28-evk.dts new file mode 100644
>> index 0000000..5402495
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imx28-evk.dts
>> @@ -0,0 +1,35 @@
>> +/*
>> + * Copyright 2012 Freescale Semiconductor, Inc.
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>> +
>> +/dts-v1/;
>> +/include/ "imx28.dtsi"
>> +
>> +/ {
>> + =A0 =A0 model =3D "Freescale i.MX28 Evaluation Kit";
>> + =A0 =A0 compatible =3D "fsl,imx28-evk", "fsl,imx28";
>> +
>> + =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x40000000 0x08000000>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 ahb@80080000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ethernet@800f0000 {
>
> fec@... would be more readable, but I think this was decided before to be=
 like
> this?
>
Yes.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-mode =3D "rmii";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "okay";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>
> [...]
>
>> diff --git a/arch/arm/mach-mxs/Makefile b/arch/arm/mach-mxs/Makefile
>> index 908bf9a..8328c45 100644
>> --- a/arch/arm/mach-mxs/Makefile
>> +++ b/arch/arm/mach-mxs/Makefile
>> @@ -7,6 +7,7 @@ obj-$(CONFIG_PM) +=3D pm.o
>> =A0obj-$(CONFIG_SOC_IMX23) +=3D clock-mx23.o
>> =A0obj-$(CONFIG_SOC_IMX28) +=3D clock-mx28.o
>>
>> +obj-$(CONFIG_MACH_MXS_DT) +=3D mach-mxs.o
>> =A0obj-$(CONFIG_MACH_STMP378X_DEVB) +=3D mach-stmp378x_devb.o
>> =A0obj-$(CONFIG_MACH_MX23EVK) +=3D mach-mx23evk.o
>> =A0obj-$(CONFIG_MACH_MX28EVK) +=3D mach-mx28evk.o
>> diff --git a/arch/arm/mach-mxs/clock-mx28.c
>> b/arch/arm/mach-mxs/clock-mx28.c index 5d68e41..88ed30c 100644
>> --- a/arch/arm/mach-mxs/clock-mx28.c
>> +++ b/arch/arm/mach-mxs/clock-mx28.c
>> @@ -671,6 +671,10 @@ static struct clk_lookup lookups[] =3D {
>> =A0 =A0 =A0 _REGISTER_CLOCK("imx28-fb", NULL, lcdif_clk)
>> =A0 =A0 =A0 _REGISTER_CLOCK("mxs-saif.0", NULL, saif0_clk)
>> =A0 =A0 =A0 _REGISTER_CLOCK("mxs-saif.1", NULL, saif1_clk)
>> + =A0 =A0 /* for DT */
>> + =A0 =A0 _REGISTER_CLOCK("80074000.serial", NULL, uart_clk)
>> + =A0 =A0 _REGISTER_CLOCK("800f0000.ethernet", NULL, fec_clk)
>> + =A0 =A0 _REGISTER_CLOCK("800f4000.ethernet", NULL, fec_clk)
>
> Wasn't the DT stuff supposed to be more symbolic? Aka. this seems weird.
>
Sorry, i'm not quite understand.
What's your suggestion to change?

Regards
Dong Aisheng
