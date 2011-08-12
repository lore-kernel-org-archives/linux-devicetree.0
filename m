From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: GPIO and Pinmux device tree support for Exynos.
Date: Fri, 12 Aug 2011 12:35:50 +0530
Message-ID: <CAJuYYwSeq4Sjj4LLR49hwfvSGTyTDYLXCTp0ZB2yQt2F4rfHcg@mail.gmail.com>
References: <CAJuYYwRJ5UJ8OeTEDEh1Mk9yhJGVA7he1EzG8yM+pJYQVo6BXQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD9@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD9-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12 August 2011 01:36, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Thomas Abraham wrote at Thursday, August 11, 2011 12:09 PM:
>> I did some work on the gpio and pinmux device tree support for exynos.
>> I thought to discuss with you about what was done before proceeding
>> further.
>>
>> In the dts file, the interrupt controller node is listed as
>>
>> GPA: gpio-controller@11400000 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-gpio-gpa0", =
"samsung,exynos4-gpio";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D <4>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;
>> };
>>
>> The meaning of the 4 cells are as below. The values of all the cells
>> are set as per the exynos chip specification.
>>
>> < [GPIO Pin Number] =A0[Pin-Mux Function Number] [Pull Up/Down Setting]
>> [Driver Strength Setting] >
>>
>>
>> Device nodes would include the gpio's that it would use (as in below exa=
mple)
>>
>> serial@13800000 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s5pv310-uart";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x13800000 0x100>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <116>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&GPA =A00 =A02 =A00 =A02 =A0 /* T=
x */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &GPA =A01 =
=A02 =A00 =A02>; =A0/* Rx */
>> };
>
> The one problem with this approach is that presumably every single driver
> (e.g. for the serial port above) must look for and handle the gpios
> property, whereas presumably a serial port would otherwise have no need
> to deal with GPIOs.

The pin-mux setting on exynos4 is done in the device driver's probe
function. A pointer to a function, which is in the platform code, that
sets up the pin-mux for the driver/peripheral is passed in the
platform data of the driver. The driver invokes that function during
the probe to setup the pinmux. And all drivers adopt this approach.

The advantage of this approach is that the pin-mux are configured at
driver probe time and makes it possible to switch the functionality of
the pin at runtime if a pin is used by two controllers. I intend to
retain this feature even when driver uses dt (no more function pointer
from platform data). So, as you said, every driver will require a
change to get a list of gpio's it uses and request them.

>
> That's probably quite a bit of work. Also, what if some pins need to be
> configured for which there is no driver to parse that property?

Is there any particular example for this? Will there not be a node in
dt node for such a case. If there is a node in dt which includes a
gpio property, it should be possible to use this approach.

>
> I just recently started working on this for Tegra, and in
> http://www.spinics.net/lists/arm-kernel/msg136138.html
> I proposed listing all the GPIO/pinmux settings directly within the GPIO
> and pinmux nodes, thus making only the GPIO and pinmux drivers responsible
> for parsing them. What do you think of that idea?

I read through your email. Your approach effortlessly integrates with
the existing Tegra gpio and pinmux code but similar approach would be
difficult for exynos.

And for exynos, the gpio and pin-mux registers are all part of a
single register set. For instance, pin-mux function 0 and 1 when
selected, configures the gpio as a input line and output line
respectively. Function 2 to 15 select various other pin function
modes. So it would be difficult to use your approach for exynos.

Thanks for your suggestions.

Thanks,
Thomas.

>
> Thanks.
>
> --
> nvpublic
>
>
