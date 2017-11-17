Return-Path: <SRS0=tIKQ=CP=gmail.com=embed3d@kernel.org>
From: Philipp Rossak <embed3d@gmail.com>
Subject: Re: [PATCH v10 5/8] ARM: dts: sunxi: Restore EMAC changes (boards)
References: <20171031081915.18960-1-clabbe.montjoie@gmail.com>
 <20171031081915.18960-6-clabbe.montjoie@gmail.com>
Message-ID: <808fc691-6438-d5f6-d8a3-938b181bc7d8@gmail.com>
Date: Fri, 17 Nov 2017 20:56:44 +0100
MIME-Version: 1.0
In-Reply-To: <20171031081915.18960-6-clabbe.montjoie@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------9708F4246D4EED6E15ADD33E"
Content-Language: en-US
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, maxime.ripard@free-electrons.com, wens@csie.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------9708F4246D4EED6E15ADD33E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey,
Sorry for the bringing this up again.
Isn't there a: ethernet0 = &emac; for some boards missing?

Best,
Philipp

On Oct 31, 2017 09:24, "Corentin Labbe" <clabbe.montjoie@gmail.com 
<mailto:clabbe.montjoie@gmail.com>> wrote:

    The original dwmac-sun8i DT bindings have some issue on how to handle
    integrated PHY and was reverted in last RC of 4.13.
    But now we have a solution so we need to get back that was reverted.

    This patch restore all boards DT about dwmac-sun8i
    This reverts partially commit fe45174b72ae ("arm: dts: sunxi: Revert
    EMAC changes")

    Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com
    <mailto:clabbe.montjoie@gmail.com>>
    Acked-by: Florian Fainelli <f.fainelli@gmail.com
    <mailto:f.fainelli@gmail.com>>
    ---
      arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts |  9 +++++++++
      arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts   | 19
    +++++++++++++++++++
      arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts     | 19
    +++++++++++++++++++
      arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts         |  7 +++++++
      arch/arm/boot/dts/sun8i-h3-orangepi-2.dts         |  8 ++++++++
      arch/arm/boot/dts/sun8i-h3-orangepi-one.dts       |  8 ++++++++
      arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts   |  5 +++++
      arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts        |  8 ++++++++
      arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts      | 22
    ++++++++++++++++++++++
      arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts    | 16
    ++++++++++++++++
      10 files changed, 121 insertions(+)

    diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
    b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
    index b1502df7b509..6713d0f2b3f4 100644
    --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
    +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
    @@ -56,6 +56,8 @@

             aliases {
                     serial0 = &uart0;
    +               /* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
    +               ethernet0 = &emac;
                     ethernet1 = &xr819;
             };

    @@ -102,6 +104,13 @@
             status = "okay";
      };

    +&emac {
    +       phy-handle = <&int_mii_phy>;
    +       phy-mode = "mii";
    +       allwinner,leds-active-low;
    +       status = "okay";
    +};
    +
      &mmc0 {
             pinctrl-names = "default";
             pinctrl-0 = <&mmc0_pins_a>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
    b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
    index e1dba9ffa94b..f2292deaa590 100644
    --- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
    @@ -52,6 +52,7 @@
             compatible = "sinovoip,bpi-m2-plus", "allwinner,sun8i-h3";

             aliases {
    +               ethernet0 = &emac;
                     serial0 = &uart0;
                     serial1 = &uart1;
             };
    @@ -111,6 +112,24 @@
             status = "okay";
      };

    +&emac {
    +       pinctrl-names = "default";
    +       pinctrl-0 = <&emac_rgmii_pins>;
    +       phy-supply = <&reg_gmac_3v3>;
    +       phy-handle = <&ext_rgmii_phy>;
    +       phy-mode = "rgmii";
    +
    +       allwinner,leds-active-low;
    +       status = "okay";
    +};
    +
    +&external_mdio {
    +       ext_rgmii_phy: ethernet-phy@1 {
    +               compatible = "ethernet-phy-ieee802.3-c22";
    +               reg = <0>;
    +       };
    +};
    +
      &ir {
             pinctrl-names = "default";
             pinctrl-0 = <&ir_pins_a>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
    b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
    index 73766d38ee6c..cfb96da3cfef 100644
    --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
    @@ -66,6 +66,25 @@
             status = "okay";
      };

    +&emac {
    +       pinctrl-names = "default";
    +       pinctrl-0 = <&emac_rgmii_pins>;
    +       phy-supply = <&reg_gmac_3v3>;
    +       phy-handle = <&ext_rgmii_phy>;
    +       phy-mode = "rgmii";
    +
    +       allwinner,leds-active-low;
    +
    +       status = "okay";
    +};
    +
    +&external_mdio {
    +       ext_rgmii_phy: ethernet-phy@1 {
    +               compatible = "ethernet-phy-ieee802.3-c22";
    +               reg = <7>;
    +       };
    +};
    +
      &ir {
             pinctrl-names = "default";
             pinctrl-0 = <&ir_pins_a>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
    b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
    index 8d2cc6e9a03f..78f6c24952dd 100644
    --- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
    @@ -46,3 +46,10 @@
             model = "FriendlyARM NanoPi NEO";
             compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
      };
    +
    +&emac {
    +       phy-handle = <&int_mii_phy>;
    +       phy-mode = "mii";
    +       allwinner,leds-active-low;
    +       status = "okay";
    +};
    diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
    b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
    index 1bf51802f5aa..b20be95b49d5 100644
    --- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
    @@ -54,6 +54,7 @@
             aliases {
                     serial0 = &uart0;
                     /* ethernet0 is the H3 emac, defined in
    sun8i-h3.dtsi */
    +               ethernet0 = &emac;
                     ethernet1 = &rtl8189;
             };

    @@ -117,6 +118,13 @@
             status = "okay";
      };

    +&emac {
    +       phy-handle = <&int_mii_phy>;
    +       phy-mode = "mii";
    +       allwinner,leds-active-low;
    +       status = "okay";
    +};
    +
      &ir {
             pinctrl-names = "default";
             pinctrl-0 = <&ir_pins_a>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
    b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
    index a1c6ff6fd05d..82e5d28cd698 100644
    --- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
    @@ -52,6 +52,7 @@
             compatible = "xunlong,orangepi-one", "allwinner,sun8i-h3";

             aliases {
    +               ethernet0 = &emac;
                     serial0 = &uart0;
             };

    @@ -97,6 +98,13 @@
             status = "okay";
      };

    +&emac {
    +       phy-handle = <&int_mii_phy>;
    +       phy-mode = "mii";
    +       allwinner,leds-active-low;
    +       status = "okay";
    +};
    +
      &mmc0 {
             pinctrl-names = "default";
             pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
    b/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
    index 8b93f5c781a7..a10281b455f5 100644
    --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
    @@ -53,6 +53,11 @@
             };
      };

    +&emac {
    +       /* LEDs changed to active high on the plus */
    +       /delete-property/ allwinner,leds-active-low;
    +};
    +
      &mmc1 {
             pinctrl-names = "default";
             pinctrl-0 = <&mmc1_pins_a>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
    b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
    index d0b80fda2f6b..6d98bcfbe877 100644
    --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
    @@ -52,6 +52,7 @@
             compatible = "xunlong,orangepi-pc", "allwinner,sun8i-h3";

             aliases {
    +               ethernet0 = &emac;
                     serial0 = &uart0;
             };

    @@ -117,6 +118,13 @@
             status = "okay";
      };

    +&emac {
    +       phy-handle = <&int_mii_phy>;
    +       phy-mode = "mii";
    +       allwinner,leds-active-low;
    +       status = "okay";
    +};
    +
      &ir {
             pinctrl-names = "default";
             pinctrl-0 = <&ir_pins_a>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
    b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
    index 72ca01b93f1b..cbc499b04de4 100644
    --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
    @@ -47,6 +47,10 @@
             model = "Xunlong Orange Pi Plus / Plus 2";
             compatible = "xunlong,orangepi-plus", "allwinner,sun8i-h3";

    +       aliases {
    +               ethernet0 = &emac;
    +       };
    +
             reg_gmac_3v3: gmac-3v3 {
                     compatible = "regulator-fixed";
                     regulator-name = "gmac-3v3";
    @@ -74,6 +78,24 @@
             status = "okay";
      };

    +&emac {
    +       pinctrl-names = "default";
    +       pinctrl-0 = <&emac_rgmii_pins>;
    +       phy-supply = <&reg_gmac_3v3>;
    +       phy-handle = <&ext_rgmii_phy>;
    +       phy-mode = "rgmii";
    +
    +       allwinner,leds-active-low;
    +       status = "okay";
    +};
    +
    +&external_mdio {
    +       ext_rgmii_phy: ethernet-phy@1 {
    +               compatible = "ethernet-phy-ieee802.3-c22";
    +               reg = <0>;
    +       };
    +};
    +
      &mmc2 {
             pinctrl-names = "default";
             pinctrl-0 = <&mmc2_8bit_pins>;
    diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
    b/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
    index 97920b12a944..6dbf7b2e0c13 100644
    --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
    +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
    @@ -61,3 +61,19 @@
                     gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
             };
      };
    +
    +&emac {
    +       pinctrl-names = "default";
    +       pinctrl-0 = <&emac_rgmii_pins>;
    +       phy-supply = <&reg_gmac_3v3>;
    +       phy-handle = <&ext_rgmii_phy>;
    +       phy-mode = "rgmii";
    +       status = "okay";
    +};
    +
    +&external_mdio {
    +       ext_rgmii_phy: ethernet-phy@1 {
    +               compatible = "ethernet-phy-ieee802.3-c22";
    +               reg = <1>;
    +       };
    +};
    --
    2.13.6


--------------9708F4246D4EED6E15ADD33E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div dir="auto"><span
        style="font-family:sans-serif;font-size:13.696px">Hey,</span>
      <div dir="auto" style="font-family:sans-serif;font-size:13.696px">Sorry
        for the bringing this up again. </div>
      <div dir="auto" style="font-family:sans-serif;font-size:13.696px">
        <div dir="auto">Isn't there a: <span style="font-size:13.696px">ethernet0
            = &amp;emac; </span>for some boards missing?</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Best,</div>
        <div dir="auto">Philipp</div>
      </div>
    </div>
    <div class="gmail_extra"><br>
      <div class="gmail_quote">On Oct 31, 2017 09:24, "Corentin Labbe"
        &lt;<a href="mailto:clabbe.montjoie@gmail.com">clabbe.montjoie@gmail.com</a>&gt;
        wrote:<br type="attribution">
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">The original
          dwmac-sun8i DT bindings have some issue on how to handle<br>
          integrated PHY and was reverted in last RC of 4.13.<br>
          But now we have a solution so we need to get back that was
          reverted.<br>
          <br>
          This patch restore all boards DT about dwmac-sun8i<br>
          This reverts partially commit fe45174b72ae ("arm: dts: sunxi:
          Revert EMAC changes")<br>
          <br>
          Signed-off-by: Corentin Labbe &lt;<a
            href="mailto:clabbe.montjoie@gmail.com">clabbe.montjoie@gmail.com</a>&gt;<br>
          Acked-by: Florian Fainelli &lt;<a
            href="mailto:f.fainelli@gmail.com">f.fainelli@gmail.com</a>&gt;<br>
          ---<br>
           arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts |  9
          +++++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts   | 19
          +++++++++++++++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts     | 19
          +++++++++++++++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts         |  7
          +++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts         |  8
          ++++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts       |  8
          ++++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts   |  5
          +++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts        |  8
          ++++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts      | 22
          ++++++++++++++++++++++<br>
           arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts    | 16
          ++++++++++++++++<br>
           10 files changed, 121 insertions(+)<br>
          <br>
          diff --git a/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts
          b/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts<br>
          index b1502df7b509..6713d0f2b3f4 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts<br>
          @@ -56,6 +56,8 @@<br>
          <br>
                  aliases {<br>
                          serial0 = &amp;uart0;<br>
          +               /* ethernet0 is the H3 emac, defined in
          sun8i-h3.dtsi */<br>
          +               ethernet0 = &amp;emac;<br>
                          ethernet1 = &amp;xr819;<br>
                  };<br>
          <br>
          @@ -102,6 +104,13 @@<br>
                  status = "okay";<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       phy-handle = &lt;&amp;int_mii_phy&gt;;<br>
          +       phy-mode = "mii";<br>
          +       allwinner,leds-active-low;<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
           &amp;mmc0 {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;mmc0_pins_a&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts<br>
          index e1dba9ffa94b..f2292deaa590 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts<br>
          @@ -52,6 +52,7 @@<br>
                  compatible = "sinovoip,bpi-m2-plus",
          "allwinner,sun8i-h3";<br>
          <br>
                  aliases {<br>
          +               ethernet0 = &amp;emac;<br>
                          serial0 = &amp;uart0;<br>
                          serial1 = &amp;uart1;<br>
                  };<br>
          @@ -111,6 +112,24 @@<br>
                  status = "okay";<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       pinctrl-names = "default";<br>
          +       pinctrl-0 = &lt;&amp;emac_rgmii_pins&gt;;<br>
          +       phy-supply = &lt;&amp;reg_gmac_3v3&gt;;<br>
          +       phy-handle = &lt;&amp;ext_rgmii_phy&gt;;<br>
          +       phy-mode = "rgmii";<br>
          +<br>
          +       allwinner,leds-active-low;<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
          +&amp;external_mdio {<br>
          +       ext_rgmii_phy: ethernet-phy@1 {<br>
          +               compatible = "ethernet-phy-ieee802.3-c22";<br>
          +               reg = &lt;0&gt;;<br>
          +       };<br>
          +};<br>
          +<br>
           &amp;ir {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;ir_pins_a&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts<br>
          index 73766d38ee6c..cfb96da3cfef 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts<br>
          @@ -66,6 +66,25 @@<br>
                  status = "okay";<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       pinctrl-names = "default";<br>
          +       pinctrl-0 = &lt;&amp;emac_rgmii_pins&gt;;<br>
          +       phy-supply = &lt;&amp;reg_gmac_3v3&gt;;<br>
          +       phy-handle = &lt;&amp;ext_rgmii_phy&gt;;<br>
          +       phy-mode = "rgmii";<br>
          +<br>
          +       allwinner,leds-active-low;<br>
          +<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
          +&amp;external_mdio {<br>
          +       ext_rgmii_phy: ethernet-phy@1 {<br>
          +               compatible = "ethernet-phy-ieee802.3-c22";<br>
          +               reg = &lt;7&gt;;<br>
          +       };<br>
          +};<br>
          +<br>
           &amp;ir {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;ir_pins_a&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts<br>
          index 8d2cc6e9a03f..78f6c24952dd 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts<br>
          @@ -46,3 +46,10 @@<br>
                  model = "FriendlyARM NanoPi NEO";<br>
                  compatible = "friendlyarm,nanopi-neo",
          "allwinner,sun8i-h3";<br>
           };<br>
          +<br>
          +&amp;emac {<br>
          +       phy-handle = &lt;&amp;int_mii_phy&gt;;<br>
          +       phy-mode = "mii";<br>
          +       allwinner,leds-active-low;<br>
          +       status = "okay";<br>
          +};<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts<br>
          index 1bf51802f5aa..b20be95b49d5 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts<br>
          @@ -54,6 +54,7 @@<br>
                  aliases {<br>
                          serial0 = &amp;uart0;<br>
                          /* ethernet0 is the H3 emac, defined in
          sun8i-h3.dtsi */<br>
          +               ethernet0 = &amp;emac;<br>
                          ethernet1 = &amp;rtl8189;<br>
                  };<br>
          <br>
          @@ -117,6 +118,13 @@<br>
                  status = "okay";<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       phy-handle = &lt;&amp;int_mii_phy&gt;;<br>
          +       phy-mode = "mii";<br>
          +       allwinner,leds-active-low;<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
           &amp;ir {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;ir_pins_a&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts<br>
          index a1c6ff6fd05d..82e5d28cd698 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts<br>
          @@ -52,6 +52,7 @@<br>
                  compatible = "xunlong,orangepi-one",
          "allwinner,sun8i-h3";<br>
          <br>
                  aliases {<br>
          +               ethernet0 = &amp;emac;<br>
                          serial0 = &amp;uart0;<br>
                  };<br>
          <br>
          @@ -97,6 +98,13 @@<br>
                  status = "okay";<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       phy-handle = &lt;&amp;int_mii_phy&gt;;<br>
          +       phy-mode = "mii";<br>
          +       allwinner,leds-active-low;<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
           &amp;mmc0 {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;mmc0_pins_a&gt;,
          &lt;&amp;mmc0_cd_pin&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts<br>
          index 8b93f5c781a7..a10281b455f5 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts<br>
          @@ -53,6 +53,11 @@<br>
                  };<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       /* LEDs changed to active high on the plus */<br>
          +       /delete-property/ allwinner,leds-active-low;<br>
          +};<br>
          +<br>
           &amp;mmc1 {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;mmc1_pins_a&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts<br>
          index d0b80fda2f6b..6d98bcfbe877 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts<br>
          @@ -52,6 +52,7 @@<br>
                  compatible = "xunlong,orangepi-pc",
          "allwinner,sun8i-h3";<br>
          <br>
                  aliases {<br>
          +               ethernet0 = &amp;emac;<br>
                          serial0 = &amp;uart0;<br>
                  };<br>
          <br>
          @@ -117,6 +118,13 @@<br>
                  status = "okay";<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       phy-handle = &lt;&amp;int_mii_phy&gt;;<br>
          +       phy-mode = "mii";<br>
          +       allwinner,leds-active-low;<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
           &amp;ir {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;ir_pins_a&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts<br>
          index 72ca01b93f1b..cbc499b04de4 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts<br>
          @@ -47,6 +47,10 @@<br>
                  model = "Xunlong Orange Pi Plus / Plus 2";<br>
                  compatible = "xunlong,orangepi-plus",
          "allwinner,sun8i-h3";<br>
          <br>
          +       aliases {<br>
          +               ethernet0 = &amp;emac;<br>
          +       };<br>
          +<br>
                  reg_gmac_3v3: gmac-3v3 {<br>
                          compatible = "regulator-fixed";<br>
                          regulator-name = "gmac-3v3";<br>
          @@ -74,6 +78,24 @@<br>
                  status = "okay";<br>
           };<br>
          <br>
          +&amp;emac {<br>
          +       pinctrl-names = "default";<br>
          +       pinctrl-0 = &lt;&amp;emac_rgmii_pins&gt;;<br>
          +       phy-supply = &lt;&amp;reg_gmac_3v3&gt;;<br>
          +       phy-handle = &lt;&amp;ext_rgmii_phy&gt;;<br>
          +       phy-mode = "rgmii";<br>
          +<br>
          +       allwinner,leds-active-low;<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
          +&amp;external_mdio {<br>
          +       ext_rgmii_phy: ethernet-phy@1 {<br>
          +               compatible = "ethernet-phy-ieee802.3-c22";<br>
          +               reg = &lt;0&gt;;<br>
          +       };<br>
          +};<br>
          +<br>
           &amp;mmc2 {<br>
                  pinctrl-names = "default";<br>
                  pinctrl-0 = &lt;&amp;mmc2_8bit_pins&gt;;<br>
          diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts
          b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts<br>
          index 97920b12a944..6dbf7b2e0c13 100644<br>
          --- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts<br>
          +++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts<br>
          @@ -61,3 +61,19 @@<br>
                          gpio = &lt;&amp;pio 3 6 GPIO_ACTIVE_HIGH&gt;;
          /* PD6 */<br>
                  };<br>
           };<br>
          +<br>
          +&amp;emac {<br>
          +       pinctrl-names = "default";<br>
          +       pinctrl-0 = &lt;&amp;emac_rgmii_pins&gt;;<br>
          +       phy-supply = &lt;&amp;reg_gmac_3v3&gt;;<br>
          +       phy-handle = &lt;&amp;ext_rgmii_phy&gt;;<br>
          +       phy-mode = "rgmii";<br>
          +       status = "okay";<br>
          +};<br>
          +<br>
          +&amp;external_mdio {<br>
          +       ext_rgmii_phy: ethernet-phy@1 {<br>
          +               compatible = "ethernet-phy-ieee802.3-c22";<br>
          +               reg = &lt;1&gt;;<br>
          +       };<br>
          +};<br>
          --<br>
          2.13.6<br>
          <br>
        </blockquote>
      </div>
    </div>
  </body>
</html>

--------------9708F4246D4EED6E15ADD33E--
