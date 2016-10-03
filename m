From: Muhammad Abdul WAHAB <muhammadabdul.wahab-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] Adding Support for Coresight Components on Zynq 7000.
Date: Mon, 3 Oct 2016 14:56:16 +0200
Message-ID: <5b56a00a-ac69-b15d-1155-bab53ed766f3@supelec.fr>
References: <c6836102-9b7e-a9d9-bad9-34b100d4ae49@supelec.fr>
 <20160929143411.GE16583@xsjsorenbubuntu>
 <920cac6c-e56a-60d5-4882-22892058346d@supelec.fr>
 <20160930165325.GA7630@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160930165325.GA7630@xsjsorenbubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sören,

 > I tried to refresh my Zynq knowledge a bit. The clkc provides the
 > dbg_trc clock, and that is the clock you need (not fclk). I couldn't
 > find it in the binding (I guess I messed that up), but apparently,
 > you can provide a 'trace_emio_clk' as input to the clkc node in the
 > Zynq DT. Then, with the muxes correctly configured (FSBL should do
 > that if you select the EMIO trace clock in Vivado), the dbg_trc
 > output of the clkc should be that EMIO clock. And the dbg_trc output
 > of the clkc is what should be consumed by the tpiu node. Though, as
 > I see it the binding/driver for the TPIU do not support that.
 >
 > I.e.
 > In the clkc description you'd have to add 'trace_emio_clk' to the
 > clock-names property together with a matching reference in the 'clocks'
 > property. As this change would be specific to local setups, this is not
 > really appropriate for upstream.
 >
 > Then, for the trace clock, ideally the TPIU would consume and enable it
 > as needed.

Thank you very much for this. I will have a look into it.
Below is the patch without TPIU, is it possible to submit it ? I will 
submit the TPIU part very soon once I manage to get it working.

 > Unfortunately, this is not how it works. The DT bindings are not a
 > recommendation. The DT description must follow the binding, otherwise
 > drivers will not work correctly, or best case, just ignore what you put
 > there.

Thanks. The idea of including TPIU part was to get feedback as I am far 
from being an expert on DT.

 > As I don't see this in the coresight binding, I doubt that it has any
 > effect or should be here.

That's what I was thinking also. I will re-look into TPIU part and send 
it soon. Besides, if I want to ask you a question regarding TPIU or DT, 
can I contact you alone or should I keep sending it to all the CS/DT 
maintainers ?

Thanks,
M.Abdul WAHAB
---
--- linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi.orig    2016-07-24 
21:23:50.000000000 +0200
+++ linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi    2016-10-03 
14:38:00.164515838 +0200
@@ -96,6 +96,57 @@
              rx-fifo-depth = <0x40>;
          };

+        etb@F8801000 {
+            compatible = "arm,coresight-etb10", "arm,primecell";
+            reg = <0xf8801000 0x1000>;
+
+            coresight-default-sink;
+            clocks = <&clkc 47>;
+            clock-names = "apb_pclk";
+
+            port {
+                etb_in_port: endpoint@0 {
+                    slave-mode;
+                    remote-endpoint = <&replicator_out_port0>;
+                };
+            };
+        };
+
+        funnel@F8804000 {
+            compatible = "arm,coresight-funnel", "arm,primecell";
+            reg = <0xf8804000 0x1000>;
+
+            clocks = <&clkc 47>;
+            clock-names = "apb_pclk";
+            ports {
+                #address-cells = <0x1>;
+                #size-cells = <0x0>;
+
+                port@0 {
+                    reg = <0x0>;
+                    funnel_out_port0: endpoint {
+                        remote-endpoint = <&replicator_in_port0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <0x0>;
+                    funnel_in_port0: endpoint {
+                        slave-mode;
+                        remote-endpoint = <&ptm0_out_port>;
+                    };
+                };
+
+                port@2 {
+                    reg = <0x1>;
+                    funnel_in_port1: endpoint {
+                        slave-mode;
+                        remote-endpoint = <&ptm1_out_port>;
+                    };
+                };
+            };
+        };
+
          gpio0: gpio@e000a000 {
              compatible = "xlnx,zynq-gpio-1.0";
              #gpio-cells = <2>;
@@ -311,6 +362,67 @@
              clocks = <&clkc 4>;
          };

+        ptm0@F889C000 {
+            compatible = "arm,coresight-etm3x", "arm,primecell";
+            reg = <0xf889c000 0x1000>;
+
+            cpu = <&cpu0>;
+            clocks = <&clkc 47>;
+            clock-names = "apb_pclk";
+
+            port {
+                ptm0_out_port: endpoint {
+                    remote-endpoint = <&funnel_in_port0>;
+                };
+            };
+        };
+
+        ptm1@F889D000 {
+            compatible = "arm,coresight-etm3x", "arm,primecell";
+            reg = <0xf889d000 0x1000>;
+
+            cpu = <&cpu1>;
+            clocks = <&clkc 47>;
+            clock-names = "apb_pclk";
+
+            port {
+                ptm1_out_port: endpoint {
+                    remote-endpoint = <&funnel_in_port1>;
+                };
+            };
+        };
+
+        replicator {
+            compatible = "arm,coresight-replicator";
+
+            ports {
+                #address-cells = <0x1>;
+                #size-cells = <0x0>;
+
+                port@0 {
+                    reg = <0x0>;
+                    replicator_out_port0: endpoint {
+                        remote-endpoint = <&etb_in_port>;
+                    };
+                };
+
+                port@1 {
+                    reg = <0x1>;
+                    replicator_out_port1: endpoint {
+                        remote-endpoint = <&tpiu_in_port>;
+                    };
+                };
+
+                port@2 {
+                    reg = <0x0>;
+                    replicator_in_port0: endpoint {
+                        slave-mode;
+                        remote-endpoint = <&funnel_out_port0>;
+                    };
+                };
+            };
+        };
+
          ttc0: timer@f8001000 {
              interrupt-parent = <&intc>;
              interrupts = <0 10 4>,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
