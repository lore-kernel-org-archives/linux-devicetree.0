From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: GPIO and Pinmux device tree support for Exynos.
Date: Thu, 11 Aug 2011 10:28:00 -1000
Message-ID: <4E443B50.1020500@firmworks.com>
References: <CAJuYYwRJ5UJ8OeTEDEh1Mk9yhJGVA7he1EzG8yM+pJYQVo6BXQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD9@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
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

On 8/11/2011 10:06 AM, Stephen Warren wrote:
> Thomas Abraham wrote at Thursday, August 11, 2011 12:09 PM:
>> I did some work on the gpio and pinmux device tree support for exynos.
>> I thought to discuss with you about what was done before proceeding
>> further.
>>
>> In the dts file, the interrupt controller node is listed as
>>
>> GPA: gpio-controller@11400000 {
>> 		compatible = "samsung,exynos4-gpio-gpa0", "samsung,exynos4-gpio";
>> 		#gpio-cells =<4>;
>> 		gpio-controller;
>> };
>>
>> The meaning of the 4 cells are as below. The values of all the cells
>> are set as per the exynos chip specification.
>>
>> <  [GPIO Pin Number]  [Pin-Mux Function Number] [Pull Up/Down Setting]
>> [Driver Strength Setting]>
>>
>>
>> Device nodes would include the gpio's that it would use (as in below example)
>>
>> serial@13800000 {
>> 		compatible = "samsung,s5pv310-uart";
>> 		reg =<0x13800000 0x100>;
>> 		interrupts =<116>;
>> 		gpios =<&GPA  0  2  0  2   /* Tx */
>> 				&GPA  1  2  0  2>;  /* Rx */
>> };
>
> The one problem with this approach is that presumably every single driver
> (e.g. for the serial port above) must look for and handle the gpios
> property, whereas presumably a serial port would otherwise have no need
> to deal with GPIOs.
>
> That's probably quite a bit of work. Also, what if some pins need to be
> configured for which there is no driver to parse that property?
>
> I just recently started working on this for Tegra, and in
> http://www.spinics.net/lists/arm-kernel/msg136138.html
> I proposed listing all the GPIO/pinmux settings directly within the GPIO
> and pinmux nodes, thus making only the GPIO and pinmux drivers responsible
> for parsing them. What do you think of that idea?


I'm in favor of handling pin-muxing separately from the individual 
devices connected through the pinmux.  The same device programming model 
can be used for different platforms or SoCs with widely differing pin 
muxing strategies and pinmux programming models.

Pin-muxing is a platform configuration issue, not an attribute of 
individual drivers.

>
> Thanks.
>
