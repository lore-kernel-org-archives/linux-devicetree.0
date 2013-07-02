From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Best practice device tree design for display subsystems/DRM
Date: Tue, 2 Jul 2013 11:43:59 -0600
Message-ID: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: =?ISO-8859-1?Q?Jean=2DFran=E7ois_Moine?= <moinejf-GANU6spQydw@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm looking into implementing devicetree support in armada_drm and
would like to better understand the best practice here.

Adding DT support for a DRM driver seems to be complicated by the fact
that DRM is not "hotpluggable" - it is not possible for the drm_device
to be initialised without an output, with the output connector/encoder
appearing at some later moment. Instead, the connectors/encoders must
be fully loaded before the drm_driver load function returns. This
means that we cannot drive the individual display components through
individual, separate modules - we need a way to control their load
order.

Looking at existing DRM drivers:

tilcdc_drm takes an approach that each of the components in the
display subsystem (panel, framebuffer, encoder, display controllers)
are separate DT nodes and do not have any DT-level linkage.
It implements just a single module, and that module carefully
initialises things in this order:
 1. Register platform drivers for output components
 2. Register main drm_driver

When the output component's platform drivers get loaded, probes for
such drivers immediately run as they match things in the device tree.
At this point, there is no drm_device available for the outputs to
bind to, so instead, references to these platform devices just get
saved in some global structures.

Later, when the drm_driver gets registered and loaded, the global
structures are consulted to find all of the output devices at the
right moment.


exynos seems to take a the same approach. Components are separate in
the device tree, and each component is implemented as a platform
driver or i2c driver. However all the drivers are built together in
the same module, and the module_init sequence is careful to initialise
all of the output component drivers before loading the DRM driver. The
output component driver store their findings in global structures.



Russell King suggested an alternative design for armada_drm. If all
display components are represented within the same "display"
super-node, we can examine the DT during drm_device initialisation and
initialise the appropriate output components. In this case, the output
components would not be registered as platform drivers.

The end result would be something similar to exynos/tilcdc (i.e.
drm_driver figuring out its output in the appropriate moment), however
the hackyness of using global storage to store output devices before
drm_driver is ready is avoided. And there is the obvious difference in
devicetree layout, which would look something like:

display {
  compatible = "marvell,armada-510-display";
  clocks = <&ext_clk0>, <&lcd_pll_clk>;
  lcd0 {
    compatible = "marvell,armada-510-lcd";
    reg = <0xf1820000 0x1000>;
    interrupts = <47>;
  };
  lcd1 {
    compatible = "marvell,armada-510-lcd";
    reg = <0xf1810000 0x1000>;
    interrupts = <46>;
  };
  dcon {
    compatible = "marvell,armada-510-dcon";
    reg = <...>;
  };
};

Any thoughts/comments?

Thanks
Daniel
