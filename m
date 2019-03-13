Return-Path: <SRS0=qg7P=RQ=davidjohnsummers.uk=beagleboard@kernel.org>
Subject: Re: [PATCH v3 3/3] arm: dts: rk3288-tinker.dtsi: Add outline
 Bluetooth support
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-3-beagleboard@davidjohnsummers.uk>
 <4537885.W6WcYDDAQ4@diego>
From: David Summers <beagleboard@davidjohnsummers.uk>
Message-ID: <c0300b4b-1989-1589-6583-2a4184d15a2b@davidjohnsummers.uk>
Date: Wed, 13 Mar 2019 19:57:55 +0000
MIME-Version: 1.0
In-Reply-To: <4537885.W6WcYDDAQ4@diego>
Content-Type: multipart/alternative;
 boundary="------------BA0D7C907A85883C1C2A6345"
Content-Language: en-PH
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: robh+dt@kernel.org, frowand.list@gmail.com, marcel@holtmann.org, johan.hedberg@gmail.com, anarsoul@gmail.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------BA0D7C907A85883C1C2A6345
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/03/2019 10:56, Heiko Stübner wrote:
> Hi David,
>
> Am Samstag, 9. März 2019, 16:39:23 CET schrieb David Summers:
>> This patch is an outline for bluetooth on the ASUS Tinker Board (S).
>>
>> Bluetooth is provided my RTL8723BS on these machine, and this is wired
>> into UART0.
>>
>> Here this is performed as a SerDev device.
>>
>> Now as presented, this does not give functioning bluetooth. The
>> updates needed to the device driver:
>>
>> https://www.spinics.net/lists/linux-bluetooth/msg78661.html
>>
>> Haven't yet been accepted. So this device tree hook doesn't yet have
>> "realtek,rtl8723bs-bt" compatible flag.
>>
>> It is however still submitted as a patch, as it sets the UART up
>> correctly. And so basic communciation can be had with the device. This
>> has been confirmed by Tony McKahan @ Armbian, in particular that the
>> CTS/RTS is needed.
>>
>> When Vasily patch is accepted, this will be added as a minor patch on
>> top of this patch; as this patch gives the pins needed.
>>
>> The one oddity, is the RESET pin, it is labeled this way on the
>> schematic. However the hci_h5.c driver calls this ENABLE. Here we have
>> stuck with the schematic name.
>>
>> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
>> ---
>>   arch/arm/boot/dts/rk3288-tinker.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi
>> b/arch/arm/boot/dts/rk3288-tinker.dtsi index 0ffab1b7c940..d29f5b34d7e6
>> 100644
>> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
>> @@ -486,6 +486,17 @@
>>
>>   &uart0 {
>>   	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>, <&uart0_rts>;
>> +
>> +	bluetooth {
>> +		clocks = <&rk808 RK808_CLKOUT1>;
>> +		reset-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
>> +		device-wake-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
>> +		host-wake-gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
>> +		vcc-18-supply = <&vcc_18>;
>> +		vcc-io-supply = <&vcc_io>;
>> +	};
> As this is supposed to work as serial attached device it should follow a
> dt-binding, so first of all definitly needs a compatible and a binding
> specifying all the properties declared above.
>
> See for example Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> for a similar device.
>
> Heiko
>
>
Heiko,

Yes I understand. Means I'll need to take care not to loose these email, 
as getting all the pins right took some time ...

I'll probably follow 
https://www.spinics.net/lists/linux-bluetooth/msg78654.html if it gets 
accepted. That is the main problem here, at the moment there is no 
compatible that can be used, as none yet accepted.

Rob H, Question for you, before you said [1]:

> There's no interrupts, GPIO control lines, power supplies, etc. for
> these chips? The binding should be complete even if your platform
> doesn't need these.
Now its clear that so far the driver for bluetooth doesn't know about 
supply, and clocks etc.

So should these be included in the dts, as a correct description as how 
its wired; even if not used in the current driver, they may be used in 
future.

Am happy to do whatever best.

Regards,

David.

[1] https://www.spinics.net/lists/linux-bluetooth/msg78545.html



--------------BA0D7C907A85883C1C2A6345
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 13/03/2019 10:56, Heiko Stübner
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4537885.W6WcYDDAQ4@diego">
      <pre class="moz-quote-pre" wrap="">Hi David,

Am Samstag, 9. März 2019, 16:39:23 CET schrieb David Summers:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch is an outline for bluetooth on the ASUS Tinker Board (S).

Bluetooth is provided my RTL8723BS on these machine, and this is wired
into UART0.

Here this is performed as a SerDev device.

Now as presented, this does not give functioning bluetooth. The
updates needed to the device driver:

<a class="moz-txt-link-freetext" href="https://www.spinics.net/lists/linux-bluetooth/msg78661.html">https://www.spinics.net/lists/linux-bluetooth/msg78661.html</a>

Haven't yet been accepted. So this device tree hook doesn't yet have
"realtek,rtl8723bs-bt" compatible flag.

It is however still submitted as a patch, as it sets the UART up
correctly. And so basic communciation can be had with the device. This
has been confirmed by Tony McKahan @ Armbian, in particular that the
CTS/RTS is needed.

When Vasily patch is accepted, this will be added as a minor patch on
top of this patch; as this patch gives the pins needed.

The one oddity, is the RESET pin, it is labeled this way on the
schematic. However the hci_h5.c driver calls this ENABLE. Here we have
stuck with the schematic name.

Signed-off-by: David Summers <a class="moz-txt-link-rfc2396E" href="mailto:beagleboard@davidjohnsummers.uk">&lt;beagleboard@davidjohnsummers.uk&gt;</a>
---
 arch/arm/boot/dts/rk3288-tinker.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi
b/arch/arm/boot/dts/rk3288-tinker.dtsi index 0ffab1b7c940..d29f5b34d7e6
100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -486,6 +486,17 @@

 &amp;uart0 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = &lt;&amp;uart0_xfer&gt;, &lt;&amp;uart0_cts&gt;, &lt;&amp;uart0_rts&gt;;
+
+	bluetooth {
+		clocks = &lt;&amp;rk808 RK808_CLKOUT1&gt;;
+		reset-gpios = &lt;&amp;gpio4 RK_PD5 GPIO_ACTIVE_HIGH&gt;;
+		device-wake-gpios = &lt;&amp;gpio4 RK_PD2 GPIO_ACTIVE_HIGH&gt;;
+		host-wake-gpios = &lt;&amp;gpio4 RK_PD7 GPIO_ACTIVE_HIGH&gt;;
+		vcc-18-supply = &lt;&amp;vcc_18&gt;;
+		vcc-io-supply = &lt;&amp;vcc_io&gt;;
+	};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As this is supposed to work as serial attached device it should follow a
dt-binding, so first of all definitly needs a compatible and a binding
specifying all the properties declared above.

See for example Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
for a similar device.

Heiko


</pre>
    </blockquote>
    <p>Heiko,</p>
    <p>Yes I understand. Means I'll need to take care not to loose these
      email, as getting all the pins right took some time ...</p>
    <p>I'll probably follow
      <a class="moz-txt-link-freetext" href="https://www.spinics.net/lists/linux-bluetooth/msg78654.html">https://www.spinics.net/lists/linux-bluetooth/msg78654.html</a> if it
      gets accepted. That is the main problem here, at the moment there
      is no compatible that can be used, as none yet accepted.</p>
    <p>Rob H, Question for you, before you said [1]:</p>
    <p>
      <blockquote type="cite">
        <pre>There's no interrupts, GPIO control lines, power supplies, etc. for 
these chips? The binding should be complete even if your platform 
doesn't need these.</pre>
      </blockquote>
      Now its clear that so far the driver for bluetooth doesn't know
      about supply, and clocks etc.</p>
    <p>So should these be included in the dts, as a correct description
      as how its wired; even if not used in the current driver, they may
      be used in future.<br>
    </p>
    <p>Am happy to do whatever best.</p>
    <p>Regards,</p>
    <p>David.<br>
    </p>
    <p>[1] <a class="moz-txt-link-freetext" href="https://www.spinics.net/lists/linux-bluetooth/msg78545.html">https://www.spinics.net/lists/linux-bluetooth/msg78545.html</a><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------BA0D7C907A85883C1C2A6345--
