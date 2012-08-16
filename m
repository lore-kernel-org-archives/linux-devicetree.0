From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Device tree node names
Date: Thu, 16 Aug 2012 13:34:00 -0600
Message-ID: <502D4B28.4020108@wwwdotorg.org>
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
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As I understand it, there is a rule when writing device tree files (and
bindings) that nodes should be named after the type of object they
represent, and not the particular instance of the object. Related, node
names should not be interpreted as data.

This rules makes perfect sense when talking about nodes on a bus that
represent devices; something like:

    i2c@7000c000 {
        compatible = "nvidia,tegra20-i2c";
        reg = <0x7000c000 0x100>;
        ...
    };

    i2c@7000c400 {
        compatible = "nvidia,tegra20-i2c";
        reg = <0x7000c400 0x100>;
        ...
    };

However, when nodes are being used to represent configuration
information inside a device node, or even when representing
pseudo-devices that don't directly exist on a specific bus, this rules
becomes quite annoying.

As an example, consider a device that contains 10 voltage regulators
(named "ldon" in the chip documentation), and each needs some
configuration provided through DT. A simple binding might result in:

    i2c@7000c000 {
        ldo0 {
            ... (configuration data here)
        };
        ldo1 {
            ...
        };
        ...
    };

Where regulator "name"'s configuration is encoded into node "name".

Instead, if we follow this rule precisely, we end up with something more
like:

    i2c@7000c000 {
        #address-cells = <1>;
        #size-cells = <0>;

        ldo@0 {
            reg = <0>;
            regulator-id = "ldo0";
            ...
        };
        ldo@1 {
            reg = <1>;
            regulator-id = "ldo1";
            ...
        };
        ...
    };

This is a fair bit more wordy, and the only advantage appears to be that
it correctly conforms to some apparently arbitrary rule for node naming.

Similar situations exist when describing the set of power sequences
needed to enable/disable a device [1] or pinctrl configurations (see
Linux kernel file arch/arm/boot/dts/tegra20-harmony.dts, node
/pinmux/pinmux where I haven't actually followed this rule correctly) etc.

So, my question is: Can/should we relax this rule? Can we allow drivers
(bindings) to require specific node names for things, lookup up specific
configuration data by node name and/or enumerate all nodes, and parse
data out of the node names (e.g. the value n for nodes named LDOn in the
above example)?

[1]
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-August/018433.html
