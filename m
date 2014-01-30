Return-Path: <santosh.shilimkar@ti.com>
From: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Subject: RE: [PATCH] ARM: keystone: dts: disable "msmcsram" clock
Date: Thu, 30 Jan 2014 13:25:59 +0000
Message-ID: <448912EABC71F84BBCADFD3C67C4BE52A0B4B6@DBDE04.ent.ti.com>
References: <1391082343-13371-1-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1391082343-13371-1-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_448912EABC71F84BBCADFD3C67C4BE52A0B4B6DBDE04entticom_"
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
Cc: "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_000_448912EABC71F84BBCADFD3C67C4BE52A0B4B6DBDE04entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Disable is not good idea since it conveys wrong info....

Hyperlink case was different.

Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Khoronzhuk, Ivan [ivan.khoronzhuk@ti.com]
Received: Thursday, 30 Jan 2014, 6:45am
To: robh+dt@kernel.org [robh+dt@kernel.org]; galak@codeaurora.org [galak@co=
deaurora.org]
CC: pawel.moll@arm.com [pawel.moll@arm.com]; mark.rutland@arm.com [mark.rut=
land@arm.com]; ijc+devicetree@hellion.org.uk [ijc+devicetree@hellion.org.uk=
]; linux@arm.linux.org.uk [linux@arm.linux.org.uk]; devicetree@vger.kernel.=
org [devicetree@vger.kernel.org]; linux-arm-kernel@lists.infradead.org [lin=
ux-arm-kernel@lists.infradead.org]; linux-kernel@vger.kernel.org [linux-ker=
nel@vger.kernel.org]; Shilimkar, Santosh [santosh.shilimkar@ti.com]; Khoron=
zhuk, Ivan [ivan.khoronzhuk@ti.com]
Subject: [PATCH] ARM: keystone: dts: disable "msmcsram" clock

At late init all unused clocks are disabled. So clocks that were not
get before will be gated. In Keysone 2 SoC we have at least one
necessary clock that is not used by any driver - "msmcsram". This
clock is necessary, because it supplies the Multicore Shared Memory
Controller (MSMC). The MSMC provides memory protection for accesses to
the MSMC SRAM and DDR3 memory from system masters. It also manages
traffic among mastering peripherals and the EMIF.

This means that MSMC clock is always needed by SoC and cannot be gated.
It is only one from necessary clocks that was not used by any driver.
So to avoid its gating at late init we have to disable it in DT.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 arch/arm/boot/dts/keystone-clocks.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/keystone-clocks.dtsi b/arch/arm/boot/dts/key=
stone-clocks.dtsi
index 2363593..e7aea2e 100644
--- a/arch/arm/boot/dts/keystone-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-clocks.dtsi
@@ -332,6 +332,7 @@ clocks {
                 compatible =3D "ti,keystone,psc-clock";
                 clocks =3D <&chipclk1>;
                 clock-output-names =3D "msmcsram";
+               status =3D "disabled";
                 reg =3D <0x02350038 0xb00>, <0x0235001c 0x400>;
                 reg-names =3D "control", "domain";
                 domain-id =3D <7>;
--
1.8.3.2


--_000_448912EABC71F84BBCADFD3C67C4BE52A0B4B6DBDE04entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Disable is not good idea since it conveys wrong info....<b=
r>
<br>
Hyperlink case was different.<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Khoronzhuk, Ivan [ivan.khoronzhuk@ti.com]<br>
<b>Received:</b> Thursday, 30 Jan 2014, 6:45am<br>
<b>To:</b> robh&#43;dt@kernel.org [robh&#43;dt@kernel.org]; galak@codeauror=
a.org [galak@codeaurora.org]<br>
<b>CC:</b> pawel.moll@arm.com [pawel.moll@arm.com]; mark.rutland@arm.com [m=
ark.rutland@arm.com]; ijc&#43;devicetree@hellion.org.uk [ijc&#43;devicetree=
@hellion.org.uk]; linux@arm.linux.org.uk [linux@arm.linux.org.uk]; devicetr=
ee@vger.kernel.org [devicetree@vger.kernel.org];
 linux-arm-kernel@lists.infradead.org [linux-arm-kernel@lists.infradead.org=
]; linux-kernel@vger.kernel.org [linux-kernel@vger.kernel.org]; Shilimkar, =
Santosh [santosh.shilimkar@ti.com]; Khoronzhuk, Ivan [ivan.khoronzhuk@ti.co=
m]<br>
<b>Subject:</b> [PATCH] ARM: keystone: dts: disable &quot;msmcsram&quot; cl=
ock<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">At late init all unused clocks are disabled. So cl=
ocks that were not<br>
get before will be gated. In Keysone 2 SoC we have at least one<br>
necessary clock that is not used by any driver - &quot;msmcsram&quot;. This=
<br>
clock is necessary, because it supplies the Multicore Shared Memory<br>
Controller (MSMC). The MSMC provides memory protection for accesses to<br>
the MSMC SRAM and DDR3 memory from system masters. It also manages<br>
traffic among mastering peripherals and the EMIF.<br>
<br>
This means that MSMC clock is always needed by SoC and cannot be gated.<br>
It is only one from necessary clocks that was not used by any driver.<br>
So to avoid its gating at late init we have to disable it in DT.<br>
<br>
Signed-off-by: Ivan Khoronzhuk &lt;ivan.khoronzhuk@ti.com&gt;<br>
---<br>
&nbsp;arch/arm/boot/dts/keystone-clocks.dtsi | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/arch/arm/boot/dts/keystone-clocks.dtsi b/arch/arm/boot/dts/key=
stone-clocks.dtsi<br>
index 2363593..e7aea2e 100644<br>
--- a/arch/arm/boot/dts/keystone-clocks.dtsi<br>
&#43;&#43;&#43; b/arch/arm/boot/dts/keystone-clocks.dtsi<br>
@@ -332,6 &#43;332,7 @@ clocks {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;ti,keystone,psc-clock&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; clocks =3D &lt;&amp;chipclk1&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; clock-output-names =3D &quot;msmcsram&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; status =3D &quot;disabled&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x02350038 0xb00&gt;, &lt;0x0235001c 0x40=
0&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; reg-names =3D &quot;control&quot;, &quot;domain&quot;=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; domain-id =3D &lt;7&gt;;<br>
-- <br>
1.8.3.2<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_448912EABC71F84BBCADFD3C67C4BE52A0B4B6DBDE04entticom_--
