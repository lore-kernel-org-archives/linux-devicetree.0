Return-Path: <SRS0=+Swc=2E=broadcom.com=steven.lin1@kernel.org>
MIME-Version: 1.0
In-Reply-To: <68373798-376d-43d9-85cb-c6af7c6fa302@gmail.com>
References: <1487798092-8631-1-git-send-email-steven.lin1@broadcom.com> <68373798-376d-43d9-85cb-c6af7c6fa302@gmail.com>
From: Steve Lin <steven.lin1@broadcom.com>
Date: Thu, 23 Feb 2017 08:30:53 -0500
Message-ID: <CA+Jmh7EvDxxu3vtNXxPUOwxrt6uMb59pFEUn7OaVFhb7hp=5VA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: BCM953012HR: Initial Checkin
Content-Type: multipart/alternative; boundary=001a1147e2c8884034054932a0c6
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: hauke@hauke-m.de, Jon Mason <jon.mason@broadcom.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

--001a1147e2c8884034054932a0c6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Rafal & Rob,

I will spin a v2 with the cleanups Rob suggested and the uart/nand changes
Rafal suggested.  Thanks!

Rafal, to answer your question about having similar partitions on both
flash devices, that is something that I believe we do on our reference
platforms to demonstrate to customers using either flash for storing their
kernel image, rootfs, etc.  See for example bcm958625k.dts where we also
have similar partition names for nand and spi flash.

Steve


On Thu, Feb 23, 2017 at 4:37 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:

> On 02/22/2017 10:14 PM, Steve Lin wrote:
>
>> Initial version of DTS to support Broadcom BCM953012HR Northstar
>> HR platform, similar to, but not the same as existing 953012K.
>>
>> Signed-off-by: Steve Lin <steven.lin1@broadcom.com>
>> ---
>>  arch/arm/boot/dts/Makefile        |   1 +
>>  arch/arm/boot/dts/bcm953012hr.dts | 115 ++++++++++++++++++++++++++++++
>> ++++++++
>>  2 files changed, 116 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/bcm953012hr.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 01d178a..c64ca3d 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) +=3D \
>>         bcm94708.dtb \
>>         bcm94709.dtb \
>>         bcm953012er.dtb \
>> +       bcm953012hr.dtb \
>>         bcm953012k.dtb
>>  dtb-$(CONFIG_ARCH_BCM_53573) +=3D \
>>         bcm47189-tenda-ac9.dtb
>> diff --git a/arch/arm/boot/dts/bcm953012hr.dts
>> b/arch/arm/boot/dts/bcm953012hr.dts
>> new file mode 100644
>> index 0000000..c332277
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/bcm953012hr.dts
>> @@ -0,0 +1,115 @@
>> +/*
>> + *  BSD LICENSE
>> + *
>> + *  Copyright(c) 2017 Broadcom
>> + *
>> + *  Redistribution and use in source and binary forms, with or without
>> + *  modification, are permitted provided that the following conditions
>> + *  are met:
>> + *
>> + *    * Redistributions of source code must retain the above copyright
>> + *      notice, this list of conditions and the following disclaimer.
>> + *    * Redistributions in binary form must reproduce the above copyrig=
ht
>> + *      notice, this list of conditions and the following disclaimer in
>> + *      the documentation and/or other materials provided with the
>> + *      distribution.
>> + *    * Neither the name of Broadcom nor the names of its contributors
>> + *      may be used to endorse or promote products derived from this
>> + *      software without specific prior written permission.
>> + *
>> + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>> + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>> + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS F=
OR
>> + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGH=
T
>> + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTA=
L,
>> + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>> + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF US=
E,
>> + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON A=
NY
>> + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>> + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE
>> + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE=
.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "bcm4708.dtsi"
>> +
>> +/ {
>> +       model =3D "NorthStar HR (BCM953012HR)";
>> +       compatible =3D "brcm,bcm953012hr", "brcm,brcm53012", "brcm,bcm47=
08";
>> +
>> +       aliases {
>> +               serial0 =3D &uart0;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path =3D "serial0:115200n8";
>> +       };
>> +
>> +       memory {
>> +               reg =3D <0x80000000 0x10000000>;
>> +       };
>> +};
>> +
>> +&uart0 {
>> +       status =3D "okay";
>> +};
>>
>
> You don't need this.
> 7b790d3b2943 ("ARM: dts: BCM5301X: Enable UART by default for BCM4708(1),
> BCM4709(4) & BCM53012")
>
>
> +&nand {
>> +       nandcs@0 {
>> +               compatible =3D "brcm,nandcs";
>> +               reg =3D <0>;
>> +               nand-on-flash-bbt;
>> +
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <1>;
>> +
>> +               nand-ecc-strength =3D <4>;
>> +               nand-ecc-step-size =3D <512>;
>>
>
> Can you just include bcm5301x-nand-cs0-bch4.dtsi?
>
>
> +
>> +               partition@0 {
>> +                       label =3D "nboot";
>> +                       reg =3D <0x00000000 0x00200000>;
>> +                       read-only;
>> +               };
>> +               partition@200000 {
>> +                       label =3D "nenv";
>> +                       reg =3D <0x00200000 0x00400000>;
>> +               };
>> +               partition@600000 {
>> +                       label =3D "nsystem";
>> +                       reg =3D <0x00600000 0x00a00000>;
>> +               };
>> +               partition@1000000 {
>> +                       label =3D "nrootfs";
>> +                       reg =3D <0x01000000 0x07000000>;
>> +               };
>>
>
> These could go to &nandcs with above dtsi include.
>
>
> +       };
>> +};
>> +
>> +&spi_nor {
>> +       status =3D "okay";
>> +       spi-max-frequency =3D <62500000>;
>> +       m25p,default-addr-width =3D <3>;
>> +
>> +       #address-cells =3D <1>;
>> +       #size-cells =3D <1>;
>> +
>> +       partition@0 {
>> +               label =3D "boot";
>> +               reg =3D <0x00000000 0x000d0000>;
>> +       };
>> +       partition@d000 {
>> +               label =3D "env";
>> +               reg =3D <0x000d0000 0x00030000>;
>> +       };
>> +       partition@100000 {
>> +               label =3D "system";
>> +               reg =3D <0x00100000 0x00600000>;
>> +       };
>> +       partition@700000 {
>> +               label =3D "rootfs";
>> +               reg =3D <0x00700000 0x00900000>;
>> +       };
>> +};
>>
>
> This is a bit uncommon for me to have the same partitions on both flash
> device.
> Can you provide some extra description of this setup, please?
>
>

--001a1147e2c8884034054932a0c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rafal &amp; Rob,<div><br></div><div>I will spin a v2 with =
the cleanups Rob suggested and the uart/nand changes Rafal suggested.=C2=A0=
 Thanks!</div><div><br></div><div>Rafal, to answer your question about havi=
ng similar partitions on both flash devices, that is something that I belie=
ve we do on our reference platforms to demonstrate to customers using eithe=
r flash for storing their kernel image, rootfs, etc.=C2=A0 See for example =
bcm958625k.dts where we also have similar partition names for nand and spi =
flash.</div><div><br></div><div>Steve</div><div><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Feb 23, 2017 at 4:3=
7 AM, Rafa=C5=82 Mi=C5=82ecki <span dir=3D"ltr">&lt;<a href=3D"mailto:zajec=
5@gmail.com" target=3D"_blank">zajec5@gmail.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On 02/22/2017 10:14 PM, Steve Lin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Initial version of DTS to support Broadcom BCM953012HR Northstar<br>
HR platform, similar to, but not the same as existing 953012K.<br>
<br>
Signed-off-by: Steve Lin &lt;<a href=3D"mailto:steven.lin1@broadcom.com" ta=
rget=3D"_blank">steven.lin1@broadcom.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01=
 +<br>
=C2=A0arch/arm/boot/dts/<wbr>bcm953012hr.dts | 115 ++++++++++++++++++++++++=
++++++<wbr>++++++++<br>
=C2=A02 files changed, 116 insertions(+)<br>
=C2=A0create mode 100644 arch/arm/boot/dts/bcm953012hr.<wbr>dts<br>
<br>
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile<br>
index 01d178a..c64ca3d 100644<br>
--- a/arch/arm/boot/dts/Makefile<br>
+++ b/arch/arm/boot/dts/Makefile<br>
@@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bcm94708.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bcm94709.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bcm953012er.dtb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bcm953012hr.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bcm953012k.dtb<br>
=C2=A0dtb-$(CONFIG_ARCH_BCM_53573) +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bcm47189-tenda-ac9.dtb<br>
diff --git a/arch/arm/boot/dts/bcm953012h<wbr>r.dts b/arch/arm/boot/dts/bcm=
953012h<wbr>r.dts<br>
new file mode 100644<br>
index 0000000..c332277<br>
--- /dev/null<br>
+++ b/arch/arm/boot/dts/bcm953012h<wbr>r.dts<br>
@@ -0,0 +1,115 @@<br>
+/*<br>
+ *=C2=A0 BSD LICENSE<br>
+ *<br>
+ *=C2=A0 Copyright(c) 2017 Broadcom<br>
+ *<br>
+ *=C2=A0 Redistribution and use in source and binary forms, with or withou=
t<br>
+ *=C2=A0 modification, are permitted provided that the following condition=
s<br>
+ *=C2=A0 are met:<br>
+ *<br>
+ *=C2=A0 =C2=A0 * Redistributions of source code must retain the above cop=
yright<br>
+ *=C2=A0 =C2=A0 =C2=A0 notice, this list of conditions and the following d=
isclaimer.<br>
+ *=C2=A0 =C2=A0 * Redistributions in binary form must reproduce the above =
copyright<br>
+ *=C2=A0 =C2=A0 =C2=A0 notice, this list of conditions and the following d=
isclaimer in<br>
+ *=C2=A0 =C2=A0 =C2=A0 the documentation and/or other materials provided w=
ith the<br>
+ *=C2=A0 =C2=A0 =C2=A0 distribution.<br>
+ *=C2=A0 =C2=A0 * Neither the name of Broadcom nor the names of its contri=
butors<br>
+ *=C2=A0 =C2=A0 =C2=A0 may be used to endorse or promote products derived =
from this<br>
+ *=C2=A0 =C2=A0 =C2=A0 software without specific prior written permission.=
<br>
+ *<br>
+ *=C2=A0 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTO=
RS<br>
+ *=C2=A0 &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDIN=
G, BUT NOT<br>
+ *=C2=A0 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS=
 FOR<br>
+ *=C2=A0 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRI=
GHT<br>
+ *=C2=A0 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDEN=
TAL,<br>
+ *=C2=A0 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT<=
br>
+ *=C2=A0 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF =
USE,<br>
+ *=C2=A0 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON=
 ANY<br>
+ *=C2=A0 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TO=
RT<br>
+ *=C2=A0 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE=
 USE<br>
+ *=C2=A0 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMA=
GE.<br>
+ */<br>
+<br>
+/dts-v1/;<br>
+<br>
+#include &quot;bcm4708.dtsi&quot;<br>
+<br>
+/ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;NorthStar HR (BCM953012HR)&quot=
;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;brcm,bcm953012hr&quot;, &q=
uot;brcm,brcm53012&quot;, &quot;brcm,bcm4708&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &amp;ua=
rt0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &qu=
ot;serial0:115200n8&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memory {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x80000=
000 0x10000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;uart0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
</blockquote>
<br>
You don&#39;t need this.<br>
7b790d3b2943 (&quot;ARM: dts: BCM5301X: Enable UART by default for BCM4708(=
1), BCM4709(4) &amp; BCM53012&quot;)<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+&amp;nand {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nandcs@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;brcm,nandcs&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand-on-flash-bbt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D =
&lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt=
;1&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand-ecc-strength =
=3D &lt;4&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand-ecc-step-size =
=3D &lt;512&gt;;<br>
</blockquote>
<br>
Can you just include bcm5301x-nand-cs0-bch4.dtsi?<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0label =3D &quot;nboot&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x00000000 0x00200000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0read-only;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition@200000 {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0label =3D &quot;nenv&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x00200000 0x00400000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition@600000 {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0label =3D &quot;nsystem&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x00600000 0x00a00000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition@1000000 {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0label =3D &quot;nrootfs&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x01000000 0x07000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
</blockquote>
<br>
These could go to &amp;nandcs with above dtsi include.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;spi_nor {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =3D &lt;62500000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0m25p,default-addr-width =3D &lt;3&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;1&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;boo=
t&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x00000=
000 0x000d0000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition@d000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;env=
&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x000d0=
000 0x00030000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition@100000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;sys=
tem&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x00100=
000 0x00600000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition@700000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;roo=
tfs&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x00700=
000 0x00900000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
</blockquote>
<br>
This is a bit uncommon for me to have the same partitions on both flash dev=
ice.<br>
Can you provide some extra description of this setup, please?<br>
<br>
</blockquote></div><br></div>

--001a1147e2c8884034054932a0c6--
