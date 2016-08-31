Return-Path: <caesar.upstream@gmail.com>
Message-ID: <57C676FA.6060700@gmail.com>
Date: Wed, 31 Aug 2016 14:19:38 +0800
From: Caesar Wang <caesar.upstream@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: support gmac for rk3399
References: <1472589008-7713-1-git-send-email-wxt@rock-chips.com> <1472589008-7713-4-git-send-email-wxt@rock-chips.com> <1912883.KWCSTxJEHB@diego>
In-Reply-To: <1912883.KWCSTxJEHB@diego>
Content-Type: multipart/alternative;
 boundary="------------090005010303030200060107"
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Xing Zheng <zhengxing@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, netdev@vger.kernel.org, dbasehore@chromium.org, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Shunqian Zheng <zhengsq@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, linux-arm-kernel@lists.infradead.org, David Wu <david.wu@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090005010303030200060107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Heiko,

Thanks the response quickly.

On 2016?08?31? 06:07, Heiko St�bner wrote:
> Am Mittwoch, 31. August 2016, 04:30:06 schrieb Caesar Wang:
>> This patch adds needed gamc information for rk3399,
>> also support the gmac pd.
>>
>> Signed-off-by: Roger Chen <roger.chen@rock-chips.com>
>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>> ---
>>
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 90
>> ++++++++++++++++++++++++++++++++ 1 file changed, 90 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index 32aebc8..53ac651 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -200,6 +200,26 @@
>>   		};
>>   	};
>>
>> +	gmac: eth@fe300000 {
>> +		compatible = "rockchip,rk3399-gmac";
>> +		reg = <0x0 0xfe300000 0x0 0x10000>;
>> +		rockchip,grf = <&grf>;
> should move below the reset-names .

Done.

>
>> +		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "macirq";
>> +		clocks = <&cru SCLK_MAC>, <&cru SCLK_MAC_RX>,
>> +			 <&cru SCLK_MAC_TX>, <&cru SCLK_MACREF>,
>> +			 <&cru SCLK_MACREF_OUT>, <&cru ACLK_GMAC>,
>> +			 <&cru PCLK_GMAC>;
>> +		clock-names = "stmmaceth", "mac_clk_rx",
>> +			      "mac_clk_tx", "clk_mac_ref",
>> +			      "clk_mac_refout", "aclk_mac",
>> +			      "pclk_mac";
>> +		resets = <&cru SRST_A_GMAC>;
>> +		reset-names = "stmmaceth";
>> +		power-domains = <&power RK3399_PD_GMAC>;
> The driver core should handle regular power-domain handling on device creation
> already, right? So I should be able to apply patches 3 and 4 even without the
> dwmac patches, right?

Yup,  the patches 3 and 4 needn't depand on the dwmac driver.

>
> Also if resending please move power-domains above resets

Done.

-
Caesar
>
>
> Heiko
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--------------090005010303030200060107
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Heiko,<br>
    <br>
    Thanks the response quickly.<br>
    <br>
    <div class="moz-cite-prefix">On 2016&#24180;08&#26376;31&#26085; 06:07, Heiko St&uuml;bner
      wrote:<br>
    </div>
    <blockquote cite="mid:1912883.KWCSTxJEHB@diego" type="cite">
      <pre wrap="">Am Mittwoch, 31. August 2016, 04:30:06 schrieb Caesar Wang:
</pre>
      <blockquote type="cite">
        <pre wrap="">This patch adds needed gamc information for rk3399,
also support the gmac pd.

Signed-off-by: Roger Chen <a class="moz-txt-link-rfc2396E" href="mailto:roger.chen@rock-chips.com">&lt;roger.chen@rock-chips.com&gt;</a>
Signed-off-by: Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a>
---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 90
++++++++++++++++++++++++++++++++ 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index 32aebc8..53ac651 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -200,6 +200,26 @@
 		};
 	};

+	gmac: eth@fe300000 {
+		compatible = "rockchip,rk3399-gmac";
+		reg = &lt;0x0 0xfe300000 0x0 0x10000&gt;;
+		rockchip,grf = &lt;&amp;grf&gt;;
</pre>
      </blockquote>
      <pre wrap="">
should move below the reset-names .</pre>
    </blockquote>
    <small><br>
      Done.</small><br>
    <br>
    <blockquote cite="mid:1912883.KWCSTxJEHB@diego" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+		interrupts = &lt;GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH&gt;;
+		interrupt-names = "macirq";
+		clocks = &lt;&amp;cru SCLK_MAC&gt;, &lt;&amp;cru SCLK_MAC_RX&gt;,
+			 &lt;&amp;cru SCLK_MAC_TX&gt;, &lt;&amp;cru SCLK_MACREF&gt;,
+			 &lt;&amp;cru SCLK_MACREF_OUT&gt;, &lt;&amp;cru ACLK_GMAC&gt;,
+			 &lt;&amp;cru PCLK_GMAC&gt;;
+		clock-names = "stmmaceth", "mac_clk_rx",
+			      "mac_clk_tx", "clk_mac_ref",
+			      "clk_mac_refout", "aclk_mac",
+			      "pclk_mac";
+		resets = &lt;&amp;cru SRST_A_GMAC&gt;;
+		reset-names = "stmmaceth";
+		power-domains = &lt;&amp;power RK3399_PD_GMAC&gt;;
</pre>
      </blockquote>
      <pre wrap="">
The driver core should handle regular power-domain handling on device creation 
already, right? So I should be able to apply patches 3 and 4 even without the 
dwmac patches, right?</pre>
    </blockquote>
    <br>
    <small>Yup,&nbsp; the patches 3 and 4 needn't depand on the dwmac driver.
    </small><br>
    <br>
    <blockquote cite="mid:1912883.KWCSTxJEHB@diego" type="cite">
      <pre wrap="">

Also if resending please move power-domains above resets</pre>
    </blockquote>
    <br>
    <small>Done.</small><br>
    <br>
    -<br>
    <small>Caesar</small><br>
    <blockquote cite="mid:1912883.KWCSTxJEHB@diego" type="cite">
      <pre wrap="">


Heiko

_______________________________________________
Linux-rockchip mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Linux-rockchip@lists.infradead.org">Linux-rockchip@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/listinfo/linux-rockchip</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090005010303030200060107--
