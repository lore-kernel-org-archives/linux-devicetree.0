Return-Path: <SRS0=VjFt=AB=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170830182528.9479-1-s.abhisit@gmail.com>
References: <20170830182528.9479-1-s.abhisit@gmail.com>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Thu, 31 Aug 2017 13:31:54 +0700
Message-ID: <CAMV_pUYvikNp4H26MgXMsdVKD=OCBw0dDZsAJX-eJ9WN5aU8tg@mail.gmail.com>
Subject: Fwd: [PATCH 5/5] lmp92001: mfd: doc: Add support LMP92001
Content-Type: multipart/alternative; boundary="f403045ebaceec947e055806cc19"
To: Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, Rob Herring <robh@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, lukas@wunner.de, Adriana Reus <adi.reus@gmail.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--f403045ebaceec947e055806cc19
Content-Type: text/plain; charset="UTF-8"

Send all parts to all cc'd people to save your time tracking down all
patches of this.

---------- Forwarded message ----------
From: <s.abhisit@gmail.com>
Date: Thu, Aug 31, 2017 at 1:25 AM
Subject: [PATCH 5/5] lmp92001: mfd: doc: Add support LMP92001
To: linus.walleij@linaro.org
Cc: robh@kernel.org, lee.jones@linaro.org, Jonathan.Cameron@huawei.com,
pmeerw@pmeerw.net, jacopo@jmondi.org, linux-kernel@vger.kernel.org,
knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com,
akinobu.mita@gmail.com, marek.vasut+renesas@gmail.com,
jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se,
jeff.dagenais@gmail.com, linux-iio@vger.kernel.org,
linux-gpio@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
lukas@wunner.de, adi.reus@gmail.com, Abhisit Sangjan <s.abhisit@gmail.com>


From: Abhisit Sangjan <s.abhisit@gmail.com>

TI LMP92001 Analog System Monitor and Controller

8-bit GPIOs.
12 DACs with 12-bit resolution.

The GPIOs and DACs are shared port function with Cy function pin to
take control the pin suddenly from external hardware.
DAC's referance voltage selectable for Internal/External.

16 + 1 ADCs with 12-bit resolution.

Built-in internal Temperature Sensor on channel 17.
Window Comparator Function is supported on channel 1-3 and 9-11 for
monitoring with interrupt signal (pending to implement for interrupt).
ADC's referance voltage selectable for Internal/External.

Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-iio-lmp920001  | 65
++++++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-lmp92001.txt     | 22 ++++++++
 .../bindings/iio/adc/ti-lmp92001-adc.txt           | 20 +++++++
 .../bindings/iio/dac/ti-lmp92001-dac.txt           | 35 ++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-lmp920001
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-lmp92001-
adc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/dac/ti-lmp92001-
dac.txt

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-lmp920001
b/Documentation/ABI/testing/sysfs-bus-iio-lmp920001
new file mode 100644
index 000000000000..f0965e7d823f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-lmp920001
@@ -0,0 +1,65 @@
+What:           /sys/bus/iio/devices/iio:deviceX/gang
+Date:           August 2016
+KernelVersion:  4.12
+Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
+Description:
+                Controls the association of analog output channels OUTx
with
+                asynchronous control inputs Cy for DAC.
+                Can be either:
+                - "0"
+                - "1"
+
+                        Cy to OUTx Assignment
+                ----------------------------------
+                | Cy | CDAC:GANG=0 | CDAC:GANG=1 |
+                ----------------------------------
+                | C1 | OUT[1:4]    | OUT[1:3]    |
+                ----------------------------------
+                | C2 | OUT[5:6]    | OUT[4:6]    |
+                ----------------------------------
+                | C3 | OUT[7:8]    | OUT[7:9]    |
+                ----------------------------------
+                | C4 | OUT[9:12]   | OUT[10:12]  |
+                ----------------------------------
+
+What:           /sys/bus/iio/devices/iio:deviceX/outx
+Date:           August 2016
+KernelVersion:  4.12
+Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
+Description:
+                The pin output mode for DAC.
+                Can be either:
+                - "hiz" = High impedance state.
+                - "dac" = DAC output.
+                - "0" = Drive it to low.
+                - "1" = Drive it to high.
+
+What:           /sys/bus/iio/devices/iio:deviceX/vref
+Date:           August 2016
+KernelVersion:  4.12
+Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
+Description:
+                This is voltage reference source for DACs.
+                Can be either:
+                - "external"
+                - "internal"
+
+What:           /sys/devices/.../iio:deviceX/en
+Date:           August 2016
+KernelVersion:  4.12
+Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
+Description:
+                This is ADC Conversion Enable for each channel.
+                Can be either:
+                - "enable"
+                - "disable"
+
+What:           /sys/devices/.../iio:deviceX/vref
+Date:           August 2016
+KernelVersion:  4.12
+Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
+Description:
+                This is voltage reference source for ADCs.
+                Can be either:
+                - "external"
+                - "internal"
diff --git a/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
new file mode 100644
index 000000000000..f9a18c492145
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
@@ -0,0 +1,22 @@
+* Texas Instruments' LMP92001 GPIOs
+
+Required properties:
+ - compatible: Must be set to "ti,lmp92001-gpio".
+ - reg: i2c chip address for the device.
+ - gpio-controller: Marks the device node as a gpio controller.
+ - #gpio-cells : Should be two.  The first cell is the pin number and the
+  second cell is used to specify the gpio polarity:
+        0 = Active high
+        1 = Active low
+
+Example:
+lmp92001@20 {
+        compatible = "ti,lmp92001";
+        reg = <0x20>;
+
+        gpio-controller {
+                compatible = "ti,lmp92001-gpio";
+                gpio-controller;
+                #gpio-cells = <2>;
+        };
+};
diff --git a/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
new file mode 100644
index 000000000000..4565961bf511
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
@@ -0,0 +1,20 @@
+* Texas Instruments' LMP92001 ADCs
+
+Required properties:
+ - compatible: Must be set to "ti,lmp92001-adc".
+ - reg: i2c chip address for the device.
+ - ti,lmp92001-adc-mask: bit mask for which channel is enable.
+        0 = Off
+        1 = On
+
+Example:
+lmp92001@20 {
+        compatible = "ti,lmp92001";
+        reg = <0x20>;
+
+        lmp92001-adc {
+                compatible = "ti,lmp92001-adc";
+                ti,lmp92001-adc-mode = "continuous";
+                ti,lmp92001-adc-mask = <0x00000079>;
+        };
+};
diff --git a/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
new file mode 100644
index 000000000000..882db9ca92f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
@@ -0,0 +1,35 @@
+* Texas Instruments' LMP92001 DACs
+
+Required properties:
+ - compatible: Must be set to "ti,lmp92001-dac".
+ - reg: i2c chip address for the device.
+ - ti,lmp92001-dac-hiz: hi-impedance control,
+        1 = Forces all OUT[1:12] outputs to hi-z, 0 = normal
+ - ti,lmp92001-dac-outx:
+        Cy = 0, 1 = will force associated OUTx outputs to VDD
+        Cy = 0, 0 = will force associated OUTx outputs to GND
+ - ti,lmp92001-dac-gang: What group of Cy is governed to.
+        -----------------------------------------
+        |  Cy   | CDAC:GANG = 0 | CDAC:GANG = 1 |
+        -----------------------------------------
+        |  C1   |   OUT[1:4]    |    OUT[1:3]   |
+        -----------------------------------------
+        |  C2   |   OUT[5:6]    |    OUT[4:6]   |
+        -----------------------------------------
+        |  C3   |   OUT[7:8]    |    OUT[7:9]   |
+        -----------------------------------------
+        |  C4   |   OUT[9:12]   |    OUT[10:12] |
+        -----------------------------------------
+
+Example:
+lmp92001@20 {
+        compatible = "ti,lmp92001";
+        reg = <0x20>;
+
+        lmp92001-dac {
+                compatible = "ti,lmp92001-dac";
+                ti,lmp92001-dac-hiz  = /bits/ 8 <0>;
+                ti,lmp92001-dac-outx = /bits/ 8 <0>;
+                ti,lmp92001-dac-gang = /bits/ 8 <0>;
+        };
+};
--
2.13.0

--f403045ebaceec947e055806cc19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Send all parts to all cc&=
#39;d people to save your time=C2=A0</span><span style=3D"font-size:12.8px"=
>tracking down all patches of this.</span><div><span style=3D"font-size:12.=
8px"><br></span><div class=3D"gmail_quote">---------- Forwarded message ---=
-------<br>From: <b class=3D"gmail_sendername"></b> <span dir=3D"ltr">&lt;<=
a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;</span><br=
>Date: Thu, Aug 31, 2017 at 1:25 AM<br>Subject: [PATCH 5/5] lmp92001: mfd: =
doc: Add support LMP92001<br>To: <a href=3D"mailto:linus.walleij@linaro.org=
">linus.walleij@linaro.org</a><br>Cc: <a href=3D"mailto:robh@kernel.org">ro=
bh@kernel.org</a>, <a href=3D"mailto:lee.jones@linaro.org">lee.jones@linaro=
.org</a>, <a href=3D"mailto:Jonathan.Cameron@huawei.com">Jonathan.Cameron@h=
uawei.com</a>, <a href=3D"mailto:pmeerw@pmeerw.net">pmeerw@pmeerw.net</a>, =
<a href=3D"mailto:jacopo@jmondi.org">jacopo@jmondi.org</a>, <a href=3D"mail=
to:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>, <a href=
=3D"mailto:knaack.h@gmx.de">knaack.h@gmx.de</a>, <a href=3D"mailto:lars@met=
afoo.de">lars@metafoo.de</a>, <a href=3D"mailto:fabrice.gasnier@st.com">fab=
rice.gasnier@st.com</a>, <a href=3D"mailto:akinobu.mita@gmail.com">akinobu.=
mita@gmail.com</a>, <a href=3D"mailto:marek.vasut%2Brenesas@gmail.com">mare=
k.vasut+renesas@gmail.com</a>, <a href=3D"mailto:jacopo%2Brenesas@jmondi.or=
g">jacopo+renesas@jmondi.org</a>, <a href=3D"mailto:mike.looijmans@topic.nl=
">mike.looijmans@topic.nl</a>, <a href=3D"mailto:peda@axentia.se">peda@axen=
tia.se</a>, <a href=3D"mailto:jeff.dagenais@gmail.com">jeff.dagenais@gmail.=
com</a>, <a href=3D"mailto:linux-iio@vger.kernel.org">linux-iio@vger.kernel=
.org</a>, <a href=3D"mailto:linux-gpio@vger.kernel.org">linux-gpio@vger.ker=
nel.org</a>, <a href=3D"mailto:mark.rutland@arm.com">mark.rutland@arm.com</=
a>, <a href=3D"mailto:devicetree@vger.kernel.org">devicetree@vger.kernel.or=
g</a>, <a href=3D"mailto:lukas@wunner.de">lukas@wunner.de</a>, <a href=3D"m=
ailto:adi.reus@gmail.com">adi.reus@gmail.com</a>, Abhisit Sangjan &lt;<a hr=
ef=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br><br><br>Fr=
om: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gm=
ail.com</a>&gt;<br>
<br>
TI LMP92001 Analog System Monitor and Controller<br>
<br>
8-bit GPIOs.<br>
12 DACs with 12-bit resolution.<br>
<br>
The GPIOs and DACs are shared port function with Cy function pin to<br>
take control the pin suddenly from external hardware.<br>
DAC&#39;s referance voltage selectable for Internal/External.<br>
<br>
16 + 1 ADCs with 12-bit resolution.<br>
<br>
Built-in internal Temperature Sensor on channel 17.<br>
Window Comparator Function is supported on channel 1-3 and 9-11 for<br>
monitoring with interrupt signal (pending to implement for interrupt).<br>
ADC&#39;s referance voltage selectable for Internal/External.<br>
<br>
Signed-off-by: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s=
.abhisit@gmail.com</a>&gt;<br>
---<br>
=C2=A0Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001=C2=A0 | 65 +++=
+++++++++++++++++++<br>
=C2=A0.../devicetree/bindings/gpio/<wbr>gpio-lmp92001.txt=C2=A0 =C2=A0 =C2=
=A0| 22 ++++++++<br>
=C2=A0.../bindings/iio/adc/ti-<wbr>lmp92001-adc.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 20 +++++++<br>
=C2=A0.../bindings/iio/dac/ti-<wbr>lmp92001-dac.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 35 ++++++++++++<br>
=C2=A04 files changed, 142 insertions(+)<br>
=C2=A0create mode 100644 Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp92=
0001<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/gpio/gpio-l=
mp92001.<wbr>txt<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/iio/adc/ti-=
lmp92001-<wbr>adc.txt<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/iio/dac/ti-=
lmp92001-<wbr>dac.txt<br>
<br>
diff --git a/Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001 b/Docum=
entation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001<br>
new file mode 100644<br>
index 000000000000..f0965e7d823f<br>
--- /dev/null<br>
+++ b/Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001<br>
@@ -0,0 +1,65 @@<br>
+What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/iio:<wb=
r>deviceX/gang<br>
+Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0August 2016<br>
+KernelVersion:=C2=A0 4.12<br>
+Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"mailto:=
s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
+Description:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Controls the assoc=
iation of analog output channels OUTx with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asynchronous contr=
ol inputs Cy for DAC.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;0&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;1&quot;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Cy to OUTx Assignment<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------=
------------<wbr>----<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Cy | CDAC:GANG=
=3D0 | CDAC:GANG=3D1 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------=
------------<wbr>----<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | C1 | OUT[1:4]=C2=
=A0 =C2=A0 | OUT[1:3]=C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------=
------------<wbr>----<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | C2 | OUT[5:6]=C2=
=A0 =C2=A0 | OUT[4:6]=C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------=
------------<wbr>----<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | C3 | OUT[7:8]=C2=
=A0 =C2=A0 | OUT[7:9]=C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------=
------------<wbr>----<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | C4 | OUT[9:12]=
=C2=A0 =C2=A0| OUT[10:12]=C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------=
------------<wbr>----<br>
+<br>
+What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/iio:<wb=
r>deviceX/outx<br>
+Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0August 2016<br>
+KernelVersion:=C2=A0 4.12<br>
+Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"mailto:=
s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
+Description:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The pin output mod=
e for DAC.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;hiz&quot; =
=3D High impedance state.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;dac&quot; =
=3D DAC output.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;0&quot; =
=3D Drive it to low.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;1&quot; =
=3D Drive it to high.<br>
+<br>
+What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/iio:<wb=
r>deviceX/vref<br>
+Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0August 2016<br>
+KernelVersion:=C2=A0 4.12<br>
+Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"mailto:=
s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
+Description:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is voltage re=
ference source for DACs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;external&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;internal&q=
uot;<br>
+<br>
+What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/.../iio:deviceX=
/<wbr>en<br>
+Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0August 2016<br>
+KernelVersion:=C2=A0 4.12<br>
+Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"mailto:=
s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
+Description:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is ADC Conver=
sion Enable for each channel.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;enable&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;disable&qu=
ot;<br>
+<br>
+What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/.../iio:deviceX=
/<wbr>vref<br>
+Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0August 2016<br>
+KernelVersion:=C2=A0 4.12<br>
+Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"mailto:=
s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
+Description:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is voltage re=
ference source for ADCs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;external&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;internal&q=
uot;<br>
diff --git a/Documentation/devicetree/<wbr>bindings/gpio/gpio-lmp92001.<wbr=
>txt b/Documentation/devicetree/<wbr>bindings/gpio/gpio-lmp92001.<wbr>txt<b=
r>
new file mode 100644<br>
index 000000000000..f9a18c492145<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/gpio/gpio-lmp92001.<wbr>txt<br=
>
@@ -0,0 +1,22 @@<br>
+* Texas Instruments&#39; LMP92001 GPIOs<br>
+<br>
+Required properties:<br>
+ - compatible: Must be set to &quot;ti,lmp92001-gpio&quot;.<br>
+ - reg: i2c chip address for the device.<br>
+ - gpio-controller: Marks the device node as a gpio controller.<br>
+ - #gpio-cells : Should be two.=C2=A0 The first cell is the pin number and=
 the<br>
+=C2=A0 second cell is used to specify the gpio polarity:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D Active high<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D Active low<br>
+<br>
+Example:<br>
+lmp92001@20 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-controller {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &qu=
ot;ti,lmp92001-gpio&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-controller;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #gpio-cells =3D &l=
t;2&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+};<br>
diff --git a/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp92001-<wb=
r>adc.txt b/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp92001-<wbr=
>adc.txt<br>
new file mode 100644<br>
index 000000000000..4565961bf511<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp92001-<wbr>adc.t=
xt<br>
@@ -0,0 +1,20 @@<br>
+* Texas Instruments&#39; LMP92001 ADCs<br>
+<br>
+Required properties:<br>
+ - compatible: Must be set to &quot;ti,lmp92001-adc&quot;.<br>
+ - reg: i2c chip address for the device.<br>
+ - ti,lmp92001-adc-mask: bit mask for which channel is enable.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D Off<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D On<br>
+<br>
+Example:<br>
+lmp92001@20 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001-adc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &qu=
ot;ti,lmp92001-adc&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-adc-mo=
de =3D &quot;continuous&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-adc-ma=
sk =3D &lt;0x00000079&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+};<br>
diff --git a/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp92001-<wb=
r>dac.txt b/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp92001-<wbr=
>dac.txt<br>
new file mode 100644<br>
index 000000000000..882db9ca92f5<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp92001-<wbr>dac.t=
xt<br>
@@ -0,0 +1,35 @@<br>
+* Texas Instruments&#39; LMP92001 DACs<br>
+<br>
+Required properties:<br>
+ - compatible: Must be set to &quot;ti,lmp92001-dac&quot;.<br>
+ - reg: i2c chip address for the device.<br>
+ - ti,lmp92001-dac-hiz: hi-impedance control,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D Forces all OUT[1:12] outputs to hi-z, 0 =
=3D normal<br>
+ - ti,lmp92001-dac-outx:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 1 =3D will force associated OUTx out=
puts to VDD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 0 =3D will force associated OUTx out=
puts to GND<br>
+ - ti,lmp92001-dac-gang: What group of Cy is governed to.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>-----------=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 Cy=C2=A0 =C2=A0| CDAC:GANG =3D 0 | CDA=
C:GANG =3D 1 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>-----------=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C1=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[1:4]=
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[1:3]=C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>-----------=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C2=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[5:6]=
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[4:6]=C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>-----------=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C3=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[7:8]=
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[7:9]=C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>-----------=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C4=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[9:12]=
=C2=A0 =C2=A0|=C2=A0 =C2=A0 OUT[10:12] |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>-----------=
<br>
+<br>
+Example:<br>
+lmp92001@20 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001-dac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &qu=
ot;ti,lmp92001-dac&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-dac-hi=
z=C2=A0 =3D /bits/ 8 &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-dac-ou=
tx =3D /bits/ 8 &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-dac-ga=
ng =3D /bits/ 8 &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+};<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
</font></span></div><br></div></div>

--f403045ebaceec947e055806cc19--
