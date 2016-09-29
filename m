Return-Path: <muhammadabdul.wahab@supelec.fr>
From: Muhammad Abdul WAHAB <muhammadabdul.wahab@supelec.fr>
Subject: [PATCH] Adding Support for Coresight Components on Zynq 7000.
Message-ID: <7ab0d935-1525-30a8-24f1-fa4c5bbeb872@supelec.fr>
Date: Thu, 29 Sep 2016 12:10:15 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------C23A167FEE54F5563FF2420A"
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------C23A167FEE54F5563FF2420A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The Coresight components are present on the Zynq SoC but the corresponding
device tree entries are missing. This patch adds device tree entries for
coresight components while explaining how it was done in order to allow
porting towards other boards easily.

By adding the entries for Coresight components in the device tree: if no
files are created in sysfs file system, you need to contact the board 
designer
to sort out the problem. On some boards, Coresight components are not
powered on boot.

Signed-off-by: Muhammad Abdul Wahab <muhammadabdul.wahab@centralesupelec.fr>
---
The documentation file was very helpful
(Documentation/devicetree/bindings/arm/coresight.txt). However, few details
can be added to make it more clear for beginners.

Things to modify in device tree when changing the board are mainly:

- address
- `clocks` field
- some references in other entries may be missing (e.g. for `CPU` field in
   ETM/PTM component, references may need to be created)

Furthermore, the `reg` field should be adapted according to
`#address-cells` and `#size-cells`. It may appear obvious, not for
beginners.

## Testing

The trace sink components need to be enabled by accessing through sysfile
system.

     echo 1 > /sys/bus/coresight/devices/@addr.etb/enable\_sink

Then enable the CS source component:

     echo 1 > /sys/bus/coresight/devices/@addr.ptm/enable\_source

By default, CS Source components are configured to trace the kernel.

Then the trace can be read by dumping ETB.

     dd if=/dev/@addr.etb of=trace_kernel.bin

The trace can be visualized by:

     hexdump -C trace_kernel.bin

Or stored using:

     hexdump -C trace_kernel.bin > trace_kernel.txt

The trace need to be decoded to be readable. All these above steps can now
be performed with Perf Library which was not available at the time I was
playing with DT entries.

--- linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi.orig     2016-07-24 
21:23:50.000000000 +0200
+++ linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi    2016-09-28 
19:13:52.651881000 +0200
@@ -363,5 +363,159 @@
              reg = <0xf8005000 0x1000>;
              timeout-sec = <10>;
          };
+
+ etb@F8801000 {
+ compatible = "arm,coresight-etb10", "arm,primecell";
+ reg = <0xf8801000 0x1000>;
+ coresight-default-sink;
+ clocks = <&clkc 47>;
+ clock-names = "apb_pclk";
+
+ port {
+
+ endpoint@0 {
+ slave-mode;
+ remote-endpoint = <0x8>;
+ linux,phandle = <0xd>;
+ phandle = <0xd>;
+ };
+ };
+ };
+
+ tpiu@F8803000 {
+ compatible = "arm,coresight-tpiu", "arm,primecell";
+ reg = <0xf8803000 0x1000>;
+ clocks = <&clkc 47>, <&clkc 16>;
+ clock-names = "apb_pclk", "fclk1";
+ clock-frequency=<0xee6b280>;
+
+ port {
+
+ endpoint@0 {
+ slave-mode;
+ remote-endpoint = <0x9>;
+ linux,phandle = <0xe>;
+ phandle = <0xe>;
+ };
+ };
+ };
+
+ funnel@F8804000 {
+ compatible = "arm,coresight-funnel", "arm,primecell";
+ reg = <0xf8804000 0x1000>;
+ clocks = <&clkc 47>;
+ clock-names = "apb_pclk";
+
+ ports {
+ #address-cells = <0x1>;
+ #size-cells = <0x0>;
+
+ port@0 {
+ reg = <0x0>;
+
+ endpoint {
+ remote-endpoint = <0xa>;
+ linux,phandle = <0xf>;
+ phandle = <0xf>;
+ };
+ };
+
+ port@1 {
+ reg = <0x0>;
+
+ endpoint {
+ slave-mode;
+ remote-endpoint = <0xb>;
+ linux,phandle = <0x11>;
+ phandle = <0x11>;
+ };
+ };
+
+ port@2 {
+ reg = <0x1>;
+
+ endpoint {
+ slave-mode;
+ remote-endpoint = <0xc>;
+ linux,phandle = <0x13>;
+ phandle = <0x13>;
+ };
+ };
+ };
+ };
+
+ replicator {
+ compatible = "arm,coresight-replicator";
+
+ ports {
+ #address-cells = <0x1>;
+ #size-cells = <0x0>;
+
+ port@0 {
+ reg = <0x0>;
+
+ endpoint {
+ remote-endpoint = <0xd>;
+ linux,phandle = <0x8>;
+ phandle = <0x8>;
+ };
+ };
+
+ port@1 {
+ reg = <0x1>;
+
+ endpoint {
+ remote-endpoint = <0xe>;
+ linux,phandle = <0x9>;
+ phandle = <0x9>;
+ };
+ };
+
+ port@2 {
+ reg = <0x0>;
+
+ endpoint {
+ slave-mode;
+ remote-endpoint = <0xf>;
+ linux,phandle = <0xa>;
+ phandle = <0xa>;
+ };
+ };
+ };
+ };
+
+ ptm0@F889C000 {
+ compatible = "arm,coresight-etm3x", "arm,primecell";
+ reg = <0xf889c000 0x1000>;
+ cpu = <0x10>;
+ clocks = <&clkc 47>;
+ clock-names = "apb_pclk";
+
+ port {
+
+ endpoint {
+ remote-endpoint = <0x11>;
+ linux,phandle = <0xb>;
+ phandle = <0xb>;
+ };
+ };
+ };
+
+ ptm1@F889D000 {
+ compatible = "arm,coresight-etm3x", "arm,primecell";
+ reg = <0xf889d000 0x1000>;
+ cpu = <0x12>;
+ clocks = <&clkc 47>;
+ clock-names = "apb_pclk";
+
+ port {
+
+ endpoint {
+ remote-endpoint = <0x13>;
+ linux,phandle = <0xc>;
+ phandle = <0xc>;
+ };
+ };
+ };
      };
  };


--------------C23A167FEE54F5563FF2420A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>The Coresight components are present on the Zynq SoC but the
      corresponding <br>
      device tree entries are missing. This patch adds device tree
      entries for <br>
      coresight components while explaining how it was done in order to
      allow <br>
      porting towards other boards easily. <br>
       <br>
      By adding the entries for Coresight components in the device tree:
      if no <br>
      files are created in sysfs file system, you need to contact the
      board designer<br>
      to sort out the problem. On some boards, Coresight components are
      not <br>
      powered on boot.<br>
      <br>
      Signed-off-by: Muhammad Abdul Wahab
      <a class="moz-txt-link-rfc2396E" href="mailto:muhammadabdul.wahab@centralesupelec.fr">&lt;muhammadabdul.wahab@centralesupelec.fr&gt;</a><br>
      ---<br>
      The documentation file was very helpful <br>
      (Documentation/devicetree/bindings/arm/coresight.txt). However,
      few details<br>
      can be added to make it more clear for beginners.<br>
      <br>
      Things to modify in device tree when changing the board are
      mainly: <br>
      <br>
      <span style="color: #808080; ">- </span>address<br>
      <span style="color: #808080; ">- </span><span style="color:
        #008000; ">`clocks`</span> field<br>
      <span style="color: #808080; ">- </span>some references in other
      entries may be missing (e.g. for <span style="color: #008000; ">`CPU`</span> field
      in<br>
        ETM/PTM component, references may need to be created)<br>
      <br>
      Furthermore, the <span style="color: #008000; ">`reg`</span> field
      should be adapted according to <br>
      <span style="color: #008000; ">`#address-cells`</span> and <span
        style="color: #008000; ">`#size-cells`</span>. It may appear
      obvious, not for <br>
      beginners. <br>
      <br>
      <span style="color: #b22222; ">## Testing</span><br>
      <br>
      The trace sink components need to be enabled by accessing through
      sysfile <br>
      system. <br>
      <br>
      <span style="color: #008000; ">    echo 1 &gt;
        /sys/bus/coresight/devices/@addr.etb/enable\_sink</span><br>
      <br>
      Then enable the CS source component: <br>
      <br>
      <span style="color: #008000; ">    echo 1 &gt;
        /sys/bus/coresight/devices/@addr.ptm/enable\_source</span><br>
      <br>
      By default, CS Source components are configured to trace the
      kernel.<br>
      <br>
      Then the trace can be read by dumping ETB. <br>
      <br>
      <span style="color: #008000; ">    dd <a class="moz-txt-link-abbreviated" href="mailto:if=/dev/@addr.etb">if=/dev/@addr.etb</a>
        of=trace_kernel.bin</span><br>
      <br>
      The trace can be visualized by: <br>
      <br>
      <span style="color: #008000; ">    hexdump -C trace_kernel.bin </span><br>
      <br>
      Or stored using:<br>
      <br>
      <span style="color: #008000; ">    hexdump -C trace_kernel.bin
        &gt; trace_kernel.txt</span><br>
      <br>
      The trace need to be decoded to be readable. All these above steps
      can now <br>
      be performed with Perf Library which was not available at the time
      I was <br>
      playing with DT entries. <br>
      <br>
      --- linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi.orig     2016-07-24
      21:23:50.000000000 +0200<br>
      +++ linux-4.7/arch/arm/boot/dts/zynq-7000.dtsi    2016-09-28
      19:13:52.651881000 +0200<br>
      @@ -363,5 +363,159 @@<br>
                   reg = &lt;0xf8005000 0x1000&gt;;<br>
                   timeout-sec = &lt;10&gt;;<br>
               };<br>
      +<br>
      <span style="color: #808080; ">+        </span>etb@F8801000 {<br>
      <span style="color: #808080; ">+            </span>compatible =
      "arm,coresight-etb10", "arm,primecell";<br>
      <span style="color: #808080; ">+            </span>reg =
      &lt;0xf8801000 0x1000&gt;;<br>
      <span style="color: #808080; ">+            </span>coresight-default-sink;<br>
      <span style="color: #808080; ">+            </span>clocks =
      &lt;&amp;clkc 47&gt;;<br>
      <span style="color: #808080; ">+            </span>clock-names =
      "apb_pclk";<br>
      +<br>
      <span style="color: #808080; ">+            </span>port {<br>
      +<br>
      <span style="color: #808080; ">+                </span>endpoint@0
      {<br>
      <span style="color: #808080; ">+                    </span>slave-mode;<br>
      <span style="color: #808080; ">+                    </span>remote-endpoint
      = &lt;0x8&gt;;<br>
      <span style="color: #808080; ">+                    </span>linux,phandle
      = &lt;0xd&gt;;<br>
      <span style="color: #808080; ">+                    </span>phandle
      = &lt;0xd&gt;;<br>
      <span style="color: #808080; ">+                </span>};<br>
      <span style="color: #808080; ">+            </span>};<br>
      <span style="color: #808080; ">+        </span>};<br>
      +<br>
      <span style="color: #808080; ">+        </span>tpiu@F8803000 {<br>
      <span style="color: #808080; ">+            </span>compatible =
      "arm,coresight-tpiu", "arm,primecell";<br>
      <span style="color: #808080; ">+            </span>reg =
      &lt;0xf8803000 0x1000&gt;;<br>
      <span style="color: #808080; ">+            </span>clocks =
      &lt;&amp;clkc 47&gt;, &lt;&amp;clkc 16&gt;;<br>
      <span style="color: #808080; ">+            </span>clock-names =
      "apb_pclk", "fclk1";<br>
      <span style="color: #808080; ">+            </span>clock-frequency=&lt;0xee6b280&gt;;<br>
      +<br>
      <span style="color: #808080; ">+            </span>port {<br>
      +<br>
      <span style="color: #808080; ">+                </span>endpoint@0
      {<br>
      <span style="color: #808080; ">+                    </span>slave-mode;<br>
      <span style="color: #808080; ">+                    </span>remote-endpoint
      = &lt;0x9&gt;;<br>
      <span style="color: #808080; ">+                    </span>linux,phandle
      = &lt;0xe&gt;;<br>
      <span style="color: #808080; ">+                    </span>phandle
      = &lt;0xe&gt;;<br>
      <span style="color: #808080; ">+                </span>};<br>
      <span style="color: #808080; ">+            </span>};<br>
      <span style="color: #808080; ">+        </span>};<br>
      +<br>
      <span style="color: #808080; ">+        </span>funnel@F8804000 {<br>
      <span style="color: #808080; ">+            </span>compatible =
      "arm,coresight-funnel", "arm,primecell";<br>
      <span style="color: #808080; ">+            </span>reg =
      &lt;0xf8804000 0x1000&gt;;<br>
      <span style="color: #808080; ">+            </span>clocks =
      &lt;&amp;clkc 47&gt;;<br>
      <span style="color: #808080; ">+            </span>clock-names =
      "apb_pclk";<br>
      +<br>
      <span style="color: #808080; ">+            </span>ports {<br>
      <span style="color: #808080; ">+                </span>#address-cells
      = &lt;0x1&gt;;<br>
      <span style="color: #808080; ">+                </span>#size-cells
      = &lt;0x0&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                </span>port@0 {<br>
      <span style="color: #808080; ">+                    </span>reg =
      &lt;0x0&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                    </span>endpoint
      {<br>
      <span style="color: #808080; ">+                        </span>remote-endpoint
      = &lt;0xa&gt;;<br>
      <span style="color: #808080; ">+                        </span>linux,phandle
      = &lt;0xf&gt;;<br>
      <span style="color: #808080; ">+                        </span>phandle
      = &lt;0xf&gt;;<br>
      <span style="color: #808080; ">+                    </span>};<br>
      <span style="color: #808080; ">+                </span>};<br>
      +<br>
      <span style="color: #808080; ">+                </span>port@1 {<br>
      <span style="color: #808080; ">+                    </span>reg =
      &lt;0x0&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                    </span>endpoint
      {<br>
      <span style="color: #808080; ">+                        </span>slave-mode;<br>
      <span style="color: #808080; ">+                        </span>remote-endpoint
      = &lt;0xb&gt;;<br>
      <span style="color: #808080; ">+                        </span>linux,phandle
      = &lt;0x11&gt;;<br>
      <span style="color: #808080; ">+                        </span>phandle
      = &lt;0x11&gt;;<br>
      <span style="color: #808080; ">+                    </span>};<br>
      <span style="color: #808080; ">+                </span>};<br>
      +<br>
      <span style="color: #808080; ">+                </span>port@2 {<br>
      <span style="color: #808080; ">+                    </span>reg =
      &lt;0x1&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                    </span>endpoint
      {<br>
      <span style="color: #808080; ">+                        </span>slave-mode;<br>
      <span style="color: #808080; ">+                        </span>remote-endpoint
      = &lt;0xc&gt;;<br>
      <span style="color: #808080; ">+                        </span>linux,phandle
      = &lt;0x13&gt;;<br>
      <span style="color: #808080; ">+                        </span>phandle
      = &lt;0x13&gt;;<br>
      <span style="color: #808080; ">+                    </span>};<br>
      <span style="color: #808080; ">+                </span>};<br>
      <span style="color: #808080; ">+            </span>};<br>
      <span style="color: #808080; ">+        </span>};<br>
      +<br>
      <span style="color: #808080; ">+        </span>replicator {<br>
      <span style="color: #808080; ">+            </span>compatible =
      "arm,coresight-replicator";<br>
      +<br>
      <span style="color: #808080; ">+            </span>ports {<br>
      <span style="color: #808080; ">+                </span>#address-cells
      = &lt;0x1&gt;;<br>
      <span style="color: #808080; ">+                </span>#size-cells
      = &lt;0x0&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                </span>port@0 {<br>
      <span style="color: #808080; ">+                    </span>reg =
      &lt;0x0&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                    </span>endpoint
      {<br>
      <span style="color: #808080; ">+                        </span>remote-endpoint
      = &lt;0xd&gt;;<br>
      <span style="color: #808080; ">+                        </span>linux,phandle
      = &lt;0x8&gt;;<br>
      <span style="color: #808080; ">+                        </span>phandle
      = &lt;0x8&gt;;<br>
      <span style="color: #808080; ">+                    </span>};<br>
      <span style="color: #808080; ">+                </span>};<br>
      +<br>
      <span style="color: #808080; ">+                </span>port@1 {<br>
      <span style="color: #808080; ">+                    </span>reg =
      &lt;0x1&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                    </span>endpoint
      {<br>
      <span style="color: #808080; ">+                        </span>remote-endpoint
      = &lt;0xe&gt;;<br>
      <span style="color: #808080; ">+                        </span>linux,phandle
      = &lt;0x9&gt;;<br>
      <span style="color: #808080; ">+                        </span>phandle
      = &lt;0x9&gt;;<br>
      <span style="color: #808080; ">+                    </span>};<br>
      <span style="color: #808080; ">+                </span>};<br>
      +<br>
      <span style="color: #808080; ">+                </span>port@2 {<br>
      <span style="color: #808080; ">+                    </span>reg =
      &lt;0x0&gt;;<br>
      +<br>
      <span style="color: #808080; ">+                    </span>endpoint
      {<br>
      <span style="color: #808080; ">+                        </span>slave-mode;<br>
      <span style="color: #808080; ">+                        </span>remote-endpoint
      = &lt;0xf&gt;;<br>
      <span style="color: #808080; ">+                        </span>linux,phandle
      = &lt;0xa&gt;;<br>
      <span style="color: #808080; ">+                        </span>phandle
      = &lt;0xa&gt;;<br>
      <span style="color: #808080; ">+                    </span>};<br>
      <span style="color: #808080; ">+                </span>};<br>
      <span style="color: #808080; ">+            </span>};<br>
      <span style="color: #808080; ">+        </span>};<br>
      +<br>
      <span style="color: #808080; ">+        </span>ptm0@F889C000 {<br>
      <span style="color: #808080; ">+            </span>compatible =
      "arm,coresight-etm3x", "arm,primecell";<br>
      <span style="color: #808080; ">+            </span>reg =
      &lt;0xf889c000 0x1000&gt;;<br>
      <span style="color: #808080; ">+            </span>cpu =
      &lt;0x10&gt;;<br>
      <span style="color: #808080; ">+            </span>clocks =
      &lt;&amp;clkc 47&gt;;<br>
      <span style="color: #808080; ">+            </span>clock-names =
      "apb_pclk";<br>
      +<br>
      <span style="color: #808080; ">+            </span>port {<br>
      +<br>
      <span style="color: #808080; ">+                </span>endpoint {<br>
      <span style="color: #808080; ">+                    </span>remote-endpoint
      = &lt;0x11&gt;;<br>
      <span style="color: #808080; ">+                    </span>linux,phandle
      = &lt;0xb&gt;;<br>
      <span style="color: #808080; ">+                    </span>phandle
      = &lt;0xb&gt;;<br>
      <span style="color: #808080; ">+                </span>};<br>
      <span style="color: #808080; ">+            </span>};<br>
      <span style="color: #808080; ">+        </span>};<br>
      +<br>
      <span style="color: #808080; ">+        </span>ptm1@F889D000 {<br>
      <span style="color: #808080; ">+            </span>compatible =
      "arm,coresight-etm3x", "arm,primecell";<br>
      <span style="color: #808080; ">+            </span>reg =
      &lt;0xf889d000 0x1000&gt;;<br>
      <span style="color: #808080; ">+            </span>cpu =
      &lt;0x12&gt;;<br>
      <span style="color: #808080; ">+            </span>clocks =
      &lt;&amp;clkc 47&gt;;<br>
      <span style="color: #808080; ">+            </span>clock-names =
      "apb_pclk";<br>
      +<br>
      <span style="color: #808080; ">+            </span>port {<br>
      +<br>
      <span style="color: #808080; ">+                </span>endpoint {<br>
      <span style="color: #808080; ">+                    </span>remote-endpoint
      = &lt;0x13&gt;;<br>
      <span style="color: #808080; ">+                    </span>linux,phandle
      = &lt;0xc&gt;;<br>
      <span style="color: #808080; ">+                    </span>phandle
      = &lt;0xc&gt;;<br>
      <span style="color: #808080; ">+                </span>};<br>
      <span style="color: #808080; ">+            </span>};<br>
      <span style="color: #808080; ">+        </span>};<br>
           };<br>
       };</p>
  </body>
</html>

--------------C23A167FEE54F5563FF2420A--
