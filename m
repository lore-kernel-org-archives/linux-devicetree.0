From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: How to add multiple example with conflicting includes
Date: Fri, 26 Jul 2019 20:11:08 +0200
Message-ID: <20190726181108.GA17767@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello

When I try to check the following examples of a devicetree schema:
examples:                                                                       
  - |                                                                           
    #include <dt-bindings/interrupt-controller/arm-gic.h>                       
    #include <dt-bindings/clock/sun50i-a64-ccu.h>                               
    #include <dt-bindings/reset/sun50i-a64-ccu.h>                               
                                                                                
    crypto: crypto@1c15000 {                                                    
      compatible = "allwinner,sun8i-h3-crypto";                                 
      reg = <0x01c15000 0x1000>;                                                
      interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;                            
      clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>;                                
      clock-names = "ahb", "mod";                                               
      resets = <&ccu RST_BUS_CE>;                                               
      reset-names = "ahb";                                                      
    };                                                                          
                                                                                
  - |                                                                           
    #include <dt-bindings/interrupt-controller/arm-gic.h>                       
    #include <dt-bindings/clock/sun50i-h6-ccu.h>                                
    #include <dt-bindings/reset/sun50i-h6-ccu.h>                                
                                                                                
    crypto: crypto@1904000 {                                                    
      compatible = "allwinner,sun50i-h6-crypto";                                
      reg = <0x01904000 0x1000>;                                                
      interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;                            
      clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>, <&ccu CLK_MBUS_CE>;            
      clock-names = "ahb", "mod", "mbus";                                       
      resets = <&ccu RST_BUS_CE>;                                               
      reset-names = "ahb";                                                      
    };

I get:
In file included from Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.example.dts:42:
/linux-next/scripts/dtc/include-prefixes/dt-bindings/clock/sun50i-h6-ccu.h:9: warning: "CLK_PLL_PERIPH0" redefined
 #define CLK_PLL_PERIPH0  3
[...]

So how can I add multiple examples which need somes conflicting #include to be validated.

Thanks
Regards
