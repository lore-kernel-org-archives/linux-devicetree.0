From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Same parts of DT being probed twice
Date: Thu, 21 Jul 2011 15:46:02 +0100
Message-ID: <CAGq3pz5V0psn1QgUV7VGKCusc4kO+128OQAzUfmqSec4i2R8vw@mail.gmail.com>
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
Cc: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

We're working on enabling the HDD LED on the XO-1.5 laptop using
gpio-leds and its automatic interaction with the device tree. I have
it working locally, but there is something not quite right.

We have modified the device tree to add /pci/isa/gpios

gpios then has a child "gpio-leds" which has a child "hdd" as
described in Documentation/devicetree/bindings/gpio/gpio-leds.txt

This means that we must extend the "matches" list passed to
of_platform_bus_probe() in arch/x86/platform/olpc/olpc_dt.c so that
the search goes deep enough into the tree to find the gpio-leds
element and create a device for it. Specifically we must add:

	{ .compatible = "pci" },
	{ .compatible = "isa" },
	{ .compatible = "via,vx855-gpio" },
	{ .compatible = "gpio-leds" },

This works, but it causes huge duplication of the whole pci and isa
trees in /sys/devices. These devices were already created because
arch/x86/kernel/devicetree.c unconditionally calls
of_platform_bus_probe() for pci and isa devices (see add_bus_probe()
and ce4100_ids), but not for vx855-gpio and gpio-leds.

Whats the best way to solve this?

Thanks,
Daniel
