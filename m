Return-Path: <SRS0=Vvkr=IM=gmx.de=FrankWu@kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-63c216a4-492c-4250-934a-37dc10d0cb56-1527263229587@3c-app-gmx-bs69>
From: "Frank Wunderlich" <FrankWu@gmx.de>
Subject: fix green/blue pio-led on bpi-r2
Content-Type: text/html; charset=UTF-8
Date: Fri, 25 May 2018 17:47:09 +0200
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<div>Hi,</div>

<div>&nbsp;</div>

<div>i&#39;ve tested LEDs on bananapi-r2 and see that they stay on at boot-time and can be switched off by &quot;echo 0&quot;, as this behaviour is not logical i changed that. Also green and blue are swapped by access their names in sysfs.</div>

<div>&nbsp;</div>

<div>http://forum.banana-pi.org/t/control-on-board-leds/4287/33</div>

<div>&nbsp;</div>

<div>hoping everything is alright with the patch (it&#39;s my first on here)</div>

<div>&nbsp;</div>

<div>to test it:</div>

<div>&nbsp;</div>

<div>[16:08] root@bpi-r2:~# L=/sys/class/leds/bpi-r2&#92;:isink</div>

<div>[17:41] root@bpi-r2:~# L2=/sys/class/leds/bpi-r2&#92;:pio<br/>
[17:42] root@bpi-r2:~# echo 1 &gt; &#36;L2:green/brightness<br/>
[17:42] root@bpi-r2:~# echo 1 &gt; &#36;L2:blue/brightness<br/>
[17:42] root@bpi-r2:~# echo 0 &gt; &#36;L2:green/brightness<br/>
[17:42] root@bpi-r2:~# echo 0 &gt; &#36;L2:blue/brightness</div>

<div>&nbsp;</div>

<div>at least options needed:</div>

<div>CONFIG_SYSFS=y</div>

<div>CONFIG_GPIO_SYSFS=y</div>

<div>CONFIG_LEDS_CLASS=y</div>

<div>CONFIG_LEDS_MT6323=y</div>

<div>CONFIG_LEDS_GPIO=y</div>

<div>&nbsp;</div>

<div>regards Frank</div>

<div>&nbsp;</div>

<div>From 850977bdb8cf05b1212c69232f03fd55293fe21a Mon Sep 17 00:00:00 2001<br/>
From: Frank Wunderlich &lt;frank-w@public-files.de&gt;<br/>
Date: Mon, 21 May 2018 21:38:53 +0200<br/>
Subject: [PATCH] [DTS] fix green/blue pio-led on bpi-r2</div>

<div>Signed-off-by: Frank Wunderlich &lt;frank-w@public-files.de&gt;<br/>
---<br/>
&nbsp;arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts &#124; 14 +++++++-------<br/>
&nbsp;1 file changed, 7 insertions(+), 7 deletions(-)</div>

<div>diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts<br/>
index 024bdb7d6cca5..6fa37a2764110 100644<br/>
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts<br/>
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts<br/>
@@ -80,21 +80,21 @@<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;pinctrl-names = &quot;default&quot;;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;pinctrl-0 = &lt;&amp;led_pins_a&gt;;<br/>
&nbsp;<br/>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;blue {<br/>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;label = &quot;bpi-r2:pio:blue&quot;;<br/>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpios = &lt;&amp;pio 241 GPIO_ACTIVE_HIGH&gt;;<br/>
+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;green {<br/>
+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;label = &quot;bpi-r2:pio:green&quot;;<br/>
+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpios = &lt;&amp;pio 241 GPIO_ACTIVE_LOW&gt;;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;default-state = &quot;off&quot;;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;};<br/>
&nbsp;<br/>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;green {<br/>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;label = &quot;bpi-r2:pio:green&quot;;<br/>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpios = &lt;&amp;pio 240 GPIO_ACTIVE_HIGH&gt;;<br/>
+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;blue {<br/>
+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;label = &quot;bpi-r2:pio:blue&quot;;<br/>
+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpios = &lt;&amp;pio 240 GPIO_ACTIVE_LOW&gt;;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;default-state = &quot;off&quot;;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;};<br/>
&nbsp;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;red {<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;label = &quot;bpi-r2:pio:red&quot;;<br/>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpios = &lt;&amp;pio 239 GPIO_ACTIVE_HIGH&gt;;<br/>
+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpios = &lt;&amp;pio 239 GPIO_ACTIVE_LOW&gt;;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;default-state = &quot;off&quot;;<br/>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;};<br/>
&nbsp;&nbsp;&nbsp; &nbsp;};</div>
</div></div></body></html>
