From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: GPIO and Pinmux device tree support for Exynos.
Date: Thu, 11 Aug 2011 23:38:50 +0530
Message-ID: <CAJuYYwRJ5UJ8OeTEDEh1Mk9yhJGVA7he1EzG8yM+pJYQVo6BXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

I did some work on the gpio and pinmux device tree support for exynos.
I thought to discuss with you about what was done before proceeding
further.

In the dts file, the interrupt controller node is listed as

GPA: gpio-controller@11400000 {
		compatible = "samsung,exynos4-gpio-gpa0", "samsung,exynos4-gpio";
		#gpio-cells = <4>;
		gpio-controller;
};

The meaning of the 4 cells are as below. The values of all the cells
are set as per the exynos chip specification.

< [GPIO Pin Number]  [Pin-Mux Function Number] [Pull Up/Down Setting]
[Driver Strength Setting] >


Device nodes would include the gpio's that it would use (as in below example)

serial@13800000 {
		compatible = "samsung,s5pv310-uart";
		reg = <0x13800000 0x100>;
		interrupts = <116>;
		gpios = <&GPA  0  2  0  2   /* Tx */
				&GPA  1  2  0  2>;  /* Rx */
};


When the gpio_chip is registered, the corresponding node is searched
in the device tree and attached to the gpio_chip. Along with node
pointer, the of_gpio_n_cells is set to 4 and the of_xlate function is
set to point to the function listed below.

int exynos4_gpio_xlate(struct gpio_chip *gc, struct device_node *np,
			 const void *gpio_spec, u32 *flags)
{
	const __be32 *gpio = gpio_spec;
	const u32 n = be32_to_cpup(gpio);
	unsigned int pin = gc->base + be32_to_cpu(gpio[0]);

	if (gc->of_gpio_n_cells < 4) {
		WARN_ON(1);
		return -EINVAL;
	}

	if (n > gc->ngpio)
		return -EINVAL;

	/* Set PinMux */
	s3c_gpio_cfgpin(pin, be32_to_cpu(gpio[1]));
	/* Set pull up/down */
	s3c_gpio_setpull(pin, be32_to_cpu(gpio[2]));
	/* Set driver strength */
	s5p_gpio_set_drvstr(pin, be32_to_cpu(gpio[3]));

	return n;
}


The above function translates the gpio controller pin number to a
linux gpio number and sets the pinmux, pull up/down and driver
strength values. The device driver uses the of_get_gpio() function to
get the gpio pin number and then calls gpio_request on that gpio
number. The call to of_get_gpio() invokes the gpio translate function
which sets the pinmux, pull up/down and driver strength values.

This handles the gpio and pinmux requirements for exynos. Would this
approach be acceptable?

Thanks,
Thomas.
