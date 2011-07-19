From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Device tree support for exynos4 gpio
Date: Tue, 19 Jul 2011 13:00:13 +0530
Message-ID: <CAJuYYwS3ag83osQenUUPFE5KYcU5wmGqMHw2GYr-QtpibbbXtQ@mail.gmail.com>
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

Thank you for your comments on exynos4 i2c driver device tree patches.
As you have suggested, I have started adding device tree support for
exynos4 gpio driver. I require few clarifications regarding the dt
support for gpio on exynos4.

The exynos4 gpio driver registers multiple gpio-chip (about 40). Each
gpio-chip manages maximum of eight gpios. The gpio driver is not a
platform driver and due to the large number of gpio-chips, I am not
sure if it would help to convert the driver to platform driver for
adding dt support.

To start with the dt support for gpio driver, is it okay to write
nodes as below in the dts file for all the gpio-chips.

        gpa: gpio-controller@gpa {
                compatible = "samsung,exynos4210-gpio";
                gpio-controller;
                #gpio-cells = <1>;
        };

        gpb: gpio-controller@gpb {
                compatible = "samsung,exynos4210-gpio";
                gpio-controller;
                #gpio-cells = <1>;
        };

and similarly for the rest of the gpio-chips (gpa to gpx). The
compatible property is not really required and could be removed.

Before the gpio-chip is registered, the exyno4 gpio driver can then be
modified to look up the node using "of_find_node_by_name". Each
gpio-chip has a label listed in the gpio driver and so it would be
possible to lookup a gpio controller node with the name
"gpio-controller"@<label>. So GPA gpiochip can be looked up by using
the name "gpio-controller@gpa". The node pointer could than be
attached to the gpio-chip instance, along with a "of_xlate" function
pointer that would translate the gpio number based on gpio-chip.base.

The i2c device node with gpio's listed could then be

        i2c at 13870000 {
                compatible = "samsung,s3c2440-i2c";
                reg = <0x13870000 0x100>;
                interrupts = <345>;
                samsung,i2c-slave-addr = <16>;
                samsung,i2c-sda-delay = <100>;
                samsung,i2c-max-bus-freq = <100000>;
                #address-cells = <1>;
                #size-cells = <0>;

                gpios = <&gpb 0 0
                              &gpb 1 0>;
         };

Would this approach be fine? I was not sure about the best way to
attach of_node pointer to gpio-chip due to so many gpio-chip
instances.

Thanks,
Thomas.
