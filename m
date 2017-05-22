From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [DT Question] "simple-mfd" DT binding
Date: Mon, 22 May 2017 10:29:26 +0900
Message-ID: <CAK7LNARQmfX+3RwFgwtvf2Qu79XNX1zh0O741-pPFWS6npytLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: masahiroy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi DT experts,

I have a question about "simple-mfd".


Documentation/devicetree/bindings/mfd/mfd.txt says as allows:

----------------------8<---------------------
Optional properties:

- compatible : "simple-mfd" - this signifies that the operating system should
  consider all subnodes of the MFD device as separate devices akin to how
  "simple-bus" indicates when to see subnodes as children for a simple
  memory-mapped bus.   <snip>
----------------------8<---------------------


I'd like to be sure about the statement above.

Does this mean, "simple-bus" and "simple-mfd" are technically interchangeable?



If so, I thought the example some lines below is questionable.

---------------------8<---------------------------
Example:

foo@1000 {
        compatible = "syscon", "simple-mfd";
        reg = <0x01000 0x1000>;

        led@08.0 {
                compatible = "register-bit-led";
                offset = <0x08>;
                mask = <0x01>;
                label = "myled";
                default-state = "on";
        };
};
---------------------8<---------------------------


Because "simple-bus" indicates that child nodes are
simply memory mapped, but the node "register-bit-led"
can not be memory-mapped.
So, "simple-mfd" can not be replaced "simple-bus" here.



arch/arm/boot/dts/arm-realview-pb1176.dts is a real example.

If I replace "simple-mfd" with "simple-bus",
DTC warns "empty reg/ranges property".



$ sed -i  -e 's/simple-mfd/simple-bus/'
arch/arm/boot/dts/arm-realview-pb1176.dts
$ make -s ARCH=arm defconfig
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- W=1  arm-realview-pb1176.dtb
   ...
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.0 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.1 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.2 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.3 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.4 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.5 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.6 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/led@08.7 missing or empty reg/ranges
property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/osc0@0c missing or empty reg/ranges property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/osc1@10 missing or empty reg/ranges property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/osc2@14 missing or empty reg/ranges property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/osc3@18 missing or empty reg/ranges property
arch/arm/boot/dts/arm-realview-pb1176.dtb: Warning (simple_bus_reg):
Node /soc/syscon@10000000/osc4@1c missing or empty reg/ranges property






-- 
Best Regards
Masahiro Yamada
