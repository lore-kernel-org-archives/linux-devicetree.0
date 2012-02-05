From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: An extremely simplified pinctrl bindings proposal
Date: Sat, 4 Feb 2012 21:31:49 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Linus Walleij
 (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org)" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Sascha Hauer
 (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "Simon Glass (sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org)" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Grant
 Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>"rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "ext Tony Lindgren
 (tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org)" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sorry, I haven't had a chance to read any of the pincrl emails from
Friday onwards. However, I thought a bit more about this, and decided
to propose someting much simpler:

Thoughts:

* Defining all the pins, groups, functions, ... takes a lot of space,
  whether it's in static data in pinctrl drivers or in the device tree.
  The lists must also be stored in RAM at runtime.

* It's been very difficult to come up with a generic description of all
  pin controller's capabilities. This is true even irrespective of device
  tree; think pin config where we've agonized over whether we can create
  a standardized list of pin config properties, or need to allow each
  pinctrl driver to define its own set of properties, etc.

* The only real use of the lists is for debugfs. Drivers shouldn't expect
  to directly request specific pinctrl settings, since that would encode
  knowledge of an individual SoC's pin controller. This should be
  abstracted from drivers.

* The data in debugfs could easily be replaced by a raw register dump
  coupled with a SoC-specific script to print out what each register
  means.

My proposal below is to radically simplify the pinctrl subsystem, and
make it little more than a system to execute a list of arbitrary register
writes.

Advantages:

* No need to define any kind of data model for pinctrl.

* No need to store any list of pins/groups/function/parameters/... either
  in static data, in device tree, or at run-time.

* No need to store the the selected board-specific settings anywhere either.

* Completely generic; can handle anything that exists now or in the future.

* Handles pin mux and pin config identically.

* Extremely simple to implement and understand; probably just a few K
  of code and no data. I assume this will be very appealing to those
  interested in using the binding within U-Boot too.

* The lists of register writes can just as easily be provided by board
  files as device tree, so operation should be identical.

Disadvantages:

* Creating the list of register values/masks may be a little painful. If
  we move forward with this, we'd want to strongly push dtc towards
  providing named constants, expressesion, macros, etc. Those dtc features
  would be very useful anyway.

* Lack of high-level semantic meaning to the data; but I assert there's
  little benefit to having that anyway.

  To solve this, write a script to parse each pinctrl driver's regcache
  file and print out all the register meanings.

* This scheme wouldn't represent which device "owns" which pins/groups,
  nor be able to validate that different devices' pinmux settings don't
  conflict.

  I don't think this is a huge issue though, since that's mainly error-
  checking. Any problems should be just as obvious during testing whether
  they cause the HW to fail to operate correctly, or whether they cause
  pinctrl to throw an error. Equally, there are many error conditions
  that pinctrl core wasn't checking for anyway.

Precedent:

* There was previous discussion on using this exact technique for pinmux
  at a previous Linaro Connect:

  http://www.spinics.net/lists/linux-tegra/msg01943.html

* There is an existing binding that works very similarly, for the Mavell
  PHY:

  http://www.gossamer-threads.com/lists/linux/kernel/1305624
  drivers/net/phy/marvell.c

  Explicit mention was made here that a simple list of register writes
  avoiding the complexity of representing a huge number of combinations
  in the device tree.

tegra20.dtsi:

pinmux: pinmux@70000000 {
        compatible = "nvidia,tegra20-pinmux";
        reg = <0x70000014 0x10>  /* Tri-state registers */
              <0x70000080 0x20>  /* Mux registers */
              <0x700000a0 0x14>  /* Pull-up/down registers */
              <0x70000868 0xa8>; /* Pad control registers */

        pinmux_i2c1_spdio_active: pinmux-i2c1-spdio-active {
                reg-init =
                    /* Set pingroup SPDO to function I2C1 */
                    <
                        1          /* Register "bank" in controller */
                        0x8c       /* Register offset */
                        0x000000c0 /* Write bitmask, 0 for whole register */
                        0x00000080 /* Write value */
                    >
                    /* Set pingroup SPDI to function I2C1 */
                    <
                        1          /* Register "bank" in controller */
                        0x8c       /* Register offset */
                        0x00000300 /* Write bitmask, 0 for whole register */
                        0x00000200 /* Write value */
                    >;
        };
        pinmux_i2c1_spdio_suspend: pinmux-i2c1-spdio-suspend {
                ...
        };
};

tegra-seaboard.dts:

i2c@7000c000 {
        /*
         * These are phandles to nodes that containthe reg-init list. Can
         * we have phandles to properties instead? Then we wouldn't need
         * all those nodes which each just contains 1 property.
         */
        pinctrl = <&pinmux_i2c1_spdio_active &pinmux_i2c1_spdio_suspend>;
        pinctrl-names = "active", "suspend";
};

In order to support programming more than one pin controller at once, we
could include the phandle of the pin controller in the "reg-init" property:

somewhere-other-than-under-a-pin-controller {
        pinmux-foo {
                reg-init =
                    <
                        &tegra_pmx /* Pin controller */
                        2          /* Number of entries for this controller */
                    >
                    <
                        1          /* Register "bank" in controller */
                        0x8c       /* Register offset */
                        0x000000c0 /* Write bitmask, 0 for whole register */
                        0x00000080 /* Write value */
                    >
                    <
                        1          /* Register "bank" in controller */
                        0x8c       /* Register offset */
                        0x00000300 /* Write bitmask, 0 for whole register */
                        0x00000200 /* Write value */
                    >
                    <
                        &other_pmx /* Pin controller */
                        1          /* Number of entries for this controller */
                    >
                    <
                        0          /* Register "bank" in controller */
                        0x04       /* Register offset */
                        0x000000ff /* Write bitmask, 0 for whole register */
                        0x0000005a /* Write value */
                    >;
        }
};

When parsing a reg-init property, we know if it contains phandles by:
* If node containing property is a child of a pin controller, the property
  doesn't containt pin controller phandles.
* Otherwise, it does.

What are people's thoughts. Thinking about all the issues involved, this
is certainly the approach I like most right now.

-- 
nvpublic
