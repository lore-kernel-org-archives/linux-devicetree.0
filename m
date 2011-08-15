From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: GPIO and Pinmux device tree support for Exynos.
Date: Mon, 15 Aug 2011 08:54:10 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA2504D@HQMAIL01.nvidia.com>
References: <CAJuYYwRJ5UJ8OeTEDEh1Mk9yhJGVA7he1EzG8yM+pJYQVo6BXQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD9@HQMAIL01.nvidia.com>
	<20110813140046.GD7244@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110813140046.GD7244-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Shawn Guo wrote at Saturday, August 13, 2011 8:01 AM:
> On Thu, Aug 11, 2011 at 01:06:19PM -0700, Stephen Warren wrote:
> > Thomas Abraham wrote at Thursday, August 11, 2011 12:09 PM:
> > > I did some work on the gpio and pinmux device tree support for exynos.
> > > I thought to discuss with you about what was done before proceeding
> > > further.
> > >
> > > In the dts file, the interrupt controller node is listed as
> > >
> > > GPA: gpio-controller@11400000 {
> > > 		compatible = "samsung,exynos4-gpio-gpa0", "samsung,exynos4-gpio";
> > > 		#gpio-cells = <4>;
> > > 		gpio-controller;
> > > };
> > >
> > > The meaning of the 4 cells are as below. The values of all the cells
> > > are set as per the exynos chip specification.
> > >
> > > < [GPIO Pin Number]  [Pin-Mux Function Number] [Pull Up/Down Setting]
> > > [Driver Strength Setting] >
> > >
> > >
> > > Device nodes would include the gpio's that it would use (as in below example)
> > >
> > > serial@13800000 {
> > > 		compatible = "samsung,s5pv310-uart";
> > > 		reg = <0x13800000 0x100>;
> > > 		interrupts = <116>;
> > > 		gpios = <&GPA  0  2  0  2   /* Tx */
> > > 				&GPA  1  2  0  2>;  /* Rx */
> > > };
> >
> > The one problem with this approach is that presumably every single driver
> > (e.g. for the serial port above) must look for and handle the gpios
> > property, whereas presumably a serial port would otherwise have no need
> > to deal with GPIOs.
>
> I think that individual driver still needs to look for gpios property
> to actually use gpio with gpiolib api like gpio_request(),
> gpio_direction_output() etc. no?

If those pins are actually used as GPIOs with gpio_set/get_value, then
yes, certainly.

However, given the comments in your example at least, it sounds like those
pins are the serial RX/TX lines, in which case they aren't being used as
GPIOs, but are driven by hardware. As such, I'd expect gpio_direction_*()
to be irrelevant for them, since I think those function are only intended
for SW-controlled literal GPIOs. If HW-controlled pins need direction
configuration, that's logically pinmux functionality rather than GPIO
functionality, even if on Exynos, both those functionalities are provided
by the same HW.

-- 
nvpublic
