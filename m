Return-Path: <muhammadabdul.wahab@supelec.fr>
Subject: Re: [PATCH] Adding Support for Coresight Components on Zynq 7000.
References: <c6836102-9b7e-a9d9-bad9-34b100d4ae49@supelec.fr>
 <20160929143411.GE16583@xsjsorenbubuntu>
From: Muhammad Abdul WAHAB <muhammadabdul.wahab@supelec.fr>
Message-ID: <253d0d82-276e-9c94-9727-df6f0925085e@supelec.fr>
Date: Fri, 30 Sep 2016 09:34:26 +0200
MIME-Version: 1.0
In-Reply-To: <20160929143411.GE16583@xsjsorenbubuntu>
Content-Type: multipart/alternative;
 boundary="------------EB7E0B80F7AD576D8A896AB4"
To: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------EB7E0B80F7AD576D8A896AB4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sören,

Thank you for your remarks. I corrected a few things as you suggested.

> I'm curious, did you test that with external debug tools. I have the
> feeling the kernel using the debug HW could interfere with JTAG
> debuggers, external trace tools, etc.

I did not test with any external debug tools. For testing, I obtained
trace for simple function (e.g. loop) on Xilinx standalone and I then
traced the same function under Linux. Then, I compare both traces
obtained under standalone and under Linux. I decoded the trace to make
  sure that the trace I get corresponds to my function. The instructions
for testing here only allows users to see that coresight components
are enabled and generating traces. The trace still need to be decoded
to make sure whether the trace is correct or not. It can be done by
openCSD[1] library.

> Use labels please.

I changed the entries to use labels. I don't need phandle anymore.

>> +        tpiu@F8803000 {
>>> +            compatible = "arm,coresight-tpiu", "arm,primecell";
>>> +            reg = <0xf8803000 0x1000>;
>>> +            clocks = <&clkc 47>, <&clkc 16>;
> I'm not sure this is correct for every setup. Sorry, that I don't recall
> all the details, I haven't used tracing in a long time. But I guess this
> clock is configurable as you're referring an fclk here. The other thing
> that makes me a little suspicious is, that nothing in here uses the
> 'dbg_trc' clock that the clock controller provides.

The TPIU setup included in my patch is specific to my configuration of TPIU.
The second clock is configurable but I didn't know how to do so. As in
Vivado setup I chose "fclk1" as the clock for TPIU, I decided to put fclk1.
But, I am not sure about this. I am having some problems when I recover the
trace from TPIU: it is not the same as in ETB even though it resembles a lot.
I don't know if the problem is coming from the device tree or from the driver.
I will have a look at 'dbg_trc' clock.

>> +            clock-names = "apb_pclk", "fclk1";
> Those names (at least fclk1) is not a good name for tpiu to identify
> it's input. fclk1 is a zynq-specific clock, and as mentioned above, it
> seems likely that this could easily become a different one. The
> clock-names are meant to identify an input from the consumer's
> perspective. The correct names should be documented in the DT binding.

The first name was chosen as "apb_pclk" because it was recommended in
Documentation. On the second name, I agree with you but again for TPIU DT
entry, I am not sure how to make this clock configurable. So, that's why
I put the same clock name as I had in my Vivado setup. If you have any
leads on how to make it configurable, I will be happy to take a look
into it.

>> +            clock-frequency=<0xee6b280>;
> I cannot find this property in the binding.

This property was described in clock binding (in an example [2]) and the
value here (250MHz) corresponds to the value I had chosen in Vivado for
TPIU input clock.

> I think nodes were ordered alphabetically in our DTs.

Yes, I modified the patch to take care of it. Thank you.

Muhammad Abdul WAHAB

[1]:https://github.com/Linaro/OpenCSD
[2]: Documentation/devicetree/bindings/clock/clock-bindings.txt
---
--- linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi.orig    2016-07-24 21:23:50.000000000 +0200
+++ linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi    2016-09-29 20:42:44.286322433 +0200
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
@@ -311,6 +362,82 @@
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
+        tpiu@F8803000 {
+            compatible = "arm,coresight-tpiu", "arm,primecell";
+            reg = <0xf8803000 0x1000>;
+
+            clocks = <&clkc 47>, <&clkc 46>;
+            clock-names = "apb_pclk", "configurable_clk";
+            clock-frequency=<0xee6b280>;
+
+            port {
+                tpiu_in_port: endpoint@0 {
+                    slave-mode;
+                    remote-endpoint = <&replicator_out_port0>;
+                };
+            };
+        };
+
          ttc0: timer@f8001000 {
              interrupt-parent = <&intc>;
              interrupts = <0 10 4>, <0 11 4>, <0 12 4>;


--------------EB7E0B80F7AD576D8A896AB4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-plain" wrap="true" graphical-quote="true"
      style="font-family: -moz-fixed; font-size: 14px;" lang="x-unicode">
      <pre wrap="">Hi Sören,

Thank you for your remarks. I corrected a few things as you suggested.
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">I'm curious, did you test that with external debug tools. I have the
feeling the kernel using the debug HW could interfere with JTAG
debuggers, external trace tools, etc.
</pre>
      </blockquote>
      <pre wrap="">I did not test with any external debug tools. For testing, I obtained 
trace for simple function (e.g. loop) on Xilinx standalone and I then
traced the same function under Linux. Then, I compare both traces 
obtained under standalone and under Linux. I decoded the trace to make
 sure that the trace I get corresponds to my function. The instructions
for testing here only allows users to see that coresight components
are enabled and generating traces. The trace still need to be decoded
to make sure whether the trace is correct or not. It can be done by 
openCSD[1] library.
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">Use labels please. 
</pre>
      </blockquote>
      <pre wrap="">I changed the entries to use labels. I don't need phandle anymore.
</pre>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">+        tpiu@F8803000 {
</pre>
          <blockquote type="cite" style="color: #000000;">
            <pre wrap="">+            compatible = "arm,coresight-tpiu", "arm,primecell";
+            reg = &lt;0xf8803000 0x1000&gt;;
+            clocks = &lt;&amp;clkc 47&gt;, &lt;&amp;clkc 16&gt;;
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="">I'm not sure this is correct for every setup. Sorry, that I don't recall
all the details, I haven't used tracing in a long time. But I guess this
clock is configurable as you're referring an fclk here. The other thing
that makes me a little suspicious is, that nothing in here uses the
'dbg_trc' clock that the clock controller provides.
</pre>
      </blockquote>
      <pre wrap="">The TPIU setup included in my patch is specific to my configuration of TPIU.
The second clock is configurable but I didn't know how to do so. As in 
Vivado setup I chose "fclk1" as the clock for TPIU, I decided to put fclk1.
But, I am not sure about this. I am having some problems when I recover the
trace from TPIU: it is not the same as in ETB even though it resembles a lot.
I don't know if the problem is coming from the device tree or from the driver.
I will have a look at 'dbg_trc' clock.
</pre>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">+            clock-names = "apb_pclk", "fclk1";
</pre>
        </blockquote>
        <pre wrap="">Those names (at least fclk1) is not a good name for tpiu to identify
it's input. fclk1 is a zynq-specific clock, and as mentioned above, it
seems likely that this could easily become a different one. The
clock-names are meant to identify an input from the consumer's
perspective. The correct names should be documented in the DT binding.
</pre>
      </blockquote>
      <pre wrap="">The first name was chosen as "apb_pclk" because it was recommended in
Documentation. On the second name, I agree with you but again for TPIU DT
entry, I am not sure how to make this clock configurable. So, that's why
I put the same clock name as I had in my Vivado setup. If you have any 
leads on how to make it configurable, I will be happy to take a look 
into it.
</pre>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">+            clock-frequency=&lt;0xee6b280&gt;;
</pre>
        </blockquote>
        <pre wrap="">I cannot find this property in the binding.
</pre>
      </blockquote>
      <pre wrap="">This property was described in clock binding (in an example [2]) and the
value here (250MHz) corresponds to the value I had chosen in Vivado for
TPIU input clock.
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">I think nodes were ordered alphabetically in our DTs.
</pre>
      </blockquote>
      <pre wrap="">Yes, I modified the patch to take care of it. Thank you.

Muhammad Abdul WAHAB

[1]: <a class="moz-txt-link-freetext" href="https://github.com/Linaro/OpenCSD">https://github.com/Linaro/OpenCSD</a>
[2]: Documentation/devicetree/bindings/clock/clock-bindings.txt
---
--- linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi.orig    2016-07-24 21:23:50.000000000 +0200
+++ linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi    2016-09-29 20:42:44.286322433 +0200
@@ -96,6 +96,57 @@
             rx-fifo-depth = &lt;0x40&gt;;
         };
 
+        etb@F8801000 {
+            compatible = "arm,coresight-etb10", "arm,primecell";
+            reg = &lt;0xf8801000 0x1000&gt;;
+
+            coresight-default-sink;
+            clocks = &lt;&amp;clkc 47&gt;;
+            clock-names = "apb_pclk";
+
+            port {
+                etb_in_port: endpoint@0 {
+                    slave-mode;
+                    remote-endpoint = &lt;&amp;replicator_out_port0&gt;;
+                };
+            };
+        };
+
+        funnel@F8804000 {
+            compatible = "arm,coresight-funnel", "arm,primecell";
+            reg = &lt;0xf8804000 0x1000&gt;;
+           
+            clocks = &lt;&amp;clkc 47&gt;;
+            clock-names = "apb_pclk";
+            ports {
+                #address-cells = &lt;0x1&gt;;
+                #size-cells = &lt;0x0&gt;;
+
+                port@0 {
+                    reg = &lt;0x0&gt;;
+                    funnel_out_port0: endpoint {
+                        remote-endpoint = &lt;&amp;replicator_in_port0&gt;;
+                    };
+                };
+
+                port@1 {
+                    reg = &lt;0x0&gt;;
+                    funnel_in_port0: endpoint {
+                        slave-mode;
+                        remote-endpoint = &lt;&amp;ptm0_out_port&gt;;
+                    };
+                };
+
+                port@2 {
+                    reg = &lt;0x1&gt;;
+                    funnel_in_port1: endpoint {
+                        slave-mode;
+                        remote-endpoint = &lt;&amp;ptm1_out_port&gt;;
+                    };
+                };
+            };
+        };
+
         gpio0: gpio@e000a000 {
             compatible = "xlnx,zynq-gpio-1.0";
             #gpio-cells = &lt;2&gt;;
@@ -311,6 +362,82 @@
             clocks = &lt;&amp;clkc 4&gt;;
         };
 
+        ptm0@F889C000 {
+            compatible = "arm,coresight-etm3x", "arm,primecell";
+            reg = &lt;0xf889c000 0x1000&gt;;
+
+            cpu = &lt;&amp;cpu0&gt;;
+            clocks = &lt;&amp;clkc 47&gt;;
+            clock-names = "apb_pclk";
+
+            port {
+                ptm0_out_port: endpoint {
+                    remote-endpoint = &lt;&amp;funnel_in_port0&gt;;
+                };
+            };
+        };
+
+        ptm1@F889D000 {
+            compatible = "arm,coresight-etm3x", "arm,primecell";
+            reg = &lt;0xf889d000 0x1000&gt;;
+           
+            cpu = &lt;&amp;cpu1&gt;;
+            clocks = &lt;&amp;clkc 47&gt;;
+            clock-names = "apb_pclk";
+
+            port {
+                ptm1_out_port: endpoint {
+                    remote-endpoint = &lt;&amp;funnel_in_port1&gt;;                   
+                };
+            };
+        };
+
+        replicator {
+            compatible = "arm,coresight-replicator";
+
+            ports {
+                #address-cells = &lt;0x1&gt;;
+                #size-cells = &lt;0x0&gt;;
+
+                port@0 {
+                    reg = &lt;0x0&gt;;
+                    replicator_out_port0: endpoint {
+                        remote-endpoint = &lt;&amp;etb_in_port&gt;;
+                    };
+                };
+
+                port@1 {
+                    reg = &lt;0x1&gt;;
+                    replicator_out_port1: endpoint {
+                        remote-endpoint = &lt;&amp;tpiu_in_port&gt;;
+                    };
+                };
+
+                port@2 {
+                    reg = &lt;0x0&gt;;
+                    replicator_in_port0: endpoint {
+                        slave-mode;
+                        remote-endpoint = &lt;&amp;funnel_out_port0&gt;;
+                    };
+                };
+            };
+        };
+
+        tpiu@F8803000 {
+            compatible = "arm,coresight-tpiu", "arm,primecell";
+            reg = &lt;0xf8803000 0x1000&gt;;
+
+            clocks = &lt;&amp;clkc 47&gt;, &lt;&amp;clkc 46&gt;;
+            clock-names = "apb_pclk", "configurable_clk";
+            clock-frequency=&lt;0xee6b280&gt;;
+
+            port {
+                tpiu_in_port: endpoint@0 {
+                    slave-mode;
+                    remote-endpoint = &lt;&amp;replicator_out_port0&gt;;
+                };
+            };
+        };
+
         ttc0: timer@f8001000 {
             interrupt-parent = &lt;&amp;intc&gt;;
             interrupts = &lt;0 10 4&gt;, &lt;0 11 4&gt;, &lt;0 12 4&gt;;
</pre>
    </div>
  </body>
</html>

--------------EB7E0B80F7AD576D8A896AB4--
