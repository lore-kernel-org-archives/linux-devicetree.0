From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: DT binding review for Armada display subsystem
Date: Fri, 12 Jul 2013 12:44:28 -0400 (EDT)
Message-ID: <20130712164428.AC3D2FAAE9@dev.laptop.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7884785818793004297=="
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
To: rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: moinejf-GANU6spQydw@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7884785818793004297==
Content-Type: text/plain

Hi,

Based on the outcomes of the "Best practice device tree design for display
subsystems" discussion I have drafted a DT binding. Comments much appreciated.

At a high level, it uses a "super node" as something for the driver to bind
to, needed because there is no clear one device that controls all the
others, and also to distinguish between the Armada 510 possible use cases
of having one video card with two outputs, or two independent video cards.
It uses node-to-node linking beyond that point, V4L2 style.

I have some questions still:

1. What names does the Armada 510 datasheet give to the components? Below
   I renamed the "LCD controllers" (which don't control LCDs on any of the
   current target hardware) to "display controllers". For what we were
   previously referring to as DCON, I renamed to "output selector". I would
   like to match the docs.

   Actually the output selector is not mentioned as per Sebastian's
   suggestion, but I believe it would fit in the below design once the first
   user comes along (e.g. it would slot in the graph between dcon0 and tda99x).

2. On that topic, what names does the Armada 510 datasheet give to the
   available clocks? Lets make them match the docs.

3. What is the "remote" property in the video interfaces binding? Doesn't
   seem to be documented. But I think I copied its usage style below.





Marvell Armada Display Subsystem

Design considerations
---------------------

The display device that emerges from this subsystem is quite heavily
componentized and the formation of the composite device will vary by SoC and
by board. The DT binding is designed with this flexibility in mind.

For example, there are 2 display controllers on the Armada 510.
They could legitametely be used to form two independent video cards, or
they could be combined into a single video card with two outputs, depending
on board wiring and use case.

As there is no clear component that controls the other components, especially
when we wish to combine the two display controllers into one virtual device, we
define a top-level "super node" that describes the basic composition of the
overall display device. That node uses phandles to define the start of the
graph of display components.

In the bindings for the individual display components, phandle properties
are used to represent direct, fixed links to other components. We use the
port/endpoint abstraction from bindings/media/video-interfaces.txt to
represent these links.


display super node
------------------

Required properties:
 - compatible: "marvell,armada-display"
 - marvell,video-devices : List of phandles to the display controllers that
   form this composite device.

Optional properties;
 - reg: Memory address and size of a RAM allocation designated as graphics
   memory
 - linux,video-memory-size: If reg is not provided, this property defines
   how much memory to cut out of regular available RAM to be used as graphics
   memory.


display-controller node
-----------------------

Required properties:
 - compatible: "marvell,armada-510-display", "marvell,mmp2-display" or
  "marvell,mmp3-display"
 - reg: Register space for this display controller
 - clocks: List of clocks available to this device. From common clock binding.
 - clock-names: Names of the given clocks (see below)
 - ports: From video interface binding

Valid clock names for Armada 510: extclk0 extclk1 axi pll

Valid clock names for MMP2: lcd1 lcd2 axi hdmi

Valid clock names for MMP3: lcd1 lcd2 axi hdmi dsi lvds


Example:

    display {
      compatible = "marvell,armada-display";
      reg = <0 0x3f000000 0x1000000>; /* video-mem hole */
      marvell,video-devices = <&dcon0>;
    };

    dcon0: display-controller@20000 {
      compatible = "marvell,armada-510-display-controller";
      reg = <0x20000 0x1000>;
      interrupts = <47>;
      clocks = <&ext_clk0>;
      clock-names = "extclk0";

      port {
        dcon0_1: endpoint {
          remote = <&tda998x>;
        };
      };
    };

    &i2c0 {
      tda998x: hdmi-transmitter@60 {
        compatible = "nxp,tda19988";
        reg = <0x60>;
        port {
          tda998x_1: endpoint {
            remote-endpoint = <&dcon0_1>;
          };
        };
      };
    };

--===============7884785818793004297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7884785818793004297==--
