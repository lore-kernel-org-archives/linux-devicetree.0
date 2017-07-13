Return-Path: <SRS0=N64I=6Q=gmail.com=caesar.upstream@kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: update the thermal zones for
 RK3399 SoCs
References: <1499840971-20392-1-git-send-email-wxt@rock-chips.com>
 <1499840971-20392-5-git-send-email-wxt@rock-chips.com>
 <20170712173208.GA92073@google.com>
From: Caesar Wang <caesar.upstream@gmail.com>
Message-ID: <d77c3aa9-b002-a72c-fdd2-d08880cd38f8@gmail.com>
Date: Thu, 13 Jul 2017 09:01:42 +0800
MIME-Version: 1.0
In-Reply-To: <20170712173208.GA92073@google.com>
Content-Type: multipart/alternative;
 boundary="------------C9A18D10008F253D4627DA97"
Content-Language: en-US
To: Brian Norris <briannorris@chromium.org>, Caesar Wang <wxt@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Kever Yang <kever.yang@rock-chips.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, William wu <wulf@rock-chips.com>, rocky.hao@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------C9A18D10008F253D4627DA97
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit

Hi Brian,

�� 2017��07��13�� 01:32, Brian Norris д��:
> Hi Caesar,
>
> On Wed, Jul 12, 2017 at 02:29:30PM +0800, Caesar Wang wrote:
>> As RK3399 had used the Power allocator thermal governor by default,
>> enabled this to manage thermals by dynamically allocating and limiting
>> power to devices.
>>
>> Also, this patch supported the dynamic-power-coefficient/sustainable_power
>> and GPU's power model for needed parameters with thermal IPA.
>>
>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>>
>> ---
>>
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 62 +++++++++++++++-----------------
>>   1 file changed, 29 insertions(+), 33 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 8c6438b..139f58c 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -147,7 +147,7 @@
>>   			enable-method = "psci";
>>   			#cooling-cells = <2>; /* min followed by max */
>>   			clocks = <&cru ARMCLKB>;
>> -			dynamic-power-coefficient = <100>;
>> +			dynamic-power-coefficient = <436>;
>>   		};
>>   
>>   		cpu_b1: cpu@101 {
>> @@ -156,7 +156,7 @@
>>   			reg = <0x0 0x101>;
>>   			enable-method = "psci";
>>   			clocks = <&cru ARMCLKB>;
>> -			dynamic-power-coefficient = <100>;
>> +			dynamic-power-coefficient = <436>;
> There are 6 of these properties (1 for each core now; not just 1 for
> each cluster), and you're only changing 2 of them.
>
> BTW, are these values determined from measurement this time? And heavily
> tested? The previous values were suspiciously round, but they'd been
> heavily tested so I didn't mind :)
*

*

The coefficient is used to calulate the dynamic power as below -
Pdyn= dynamic-power-coefficient * V^2 * f

The value was tested on rockchip inside, that should be resonable for me.
As the PLT tested the little cpu power comsumption Pl = 0.9mw, but big 
cpu power comsumption Pb= 0.28mw

-Caesar
>
>>   		};
>>   	};
>>   
> ...
>
> Brian
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--------------C9A18D10008F253D4627DA97
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Brian,<br>
    <br>
    <div class="moz-cite-prefix">�� 2017��07��13�� 01:32, Brian Norris д��:<br>
    </div>
    <blockquote type="cite" cite="mid:20170712173208.GA92073@google.com">
      <pre wrap="">Hi Caesar,

On Wed, Jul 12, 2017 at 02:29:30PM +0800, Caesar Wang wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">As RK3399 had used the Power allocator thermal governor by default,
enabled this to manage thermals by dynamically allocating and limiting
power to devices.

Also, this patch supported the dynamic-power-coefficient/sustainable_power
and GPU's power model for needed parameters with thermal IPA.

Signed-off-by: Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a>

---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 62 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 8c6438b..139f58c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -147,7 +147,7 @@
 			enable-method = "psci";
 			#cooling-cells = &lt;2&gt;; /* min followed by max */
 			clocks = &lt;&amp;cru ARMCLKB&gt;;
-			dynamic-power-coefficient = &lt;100&gt;;
+			dynamic-power-coefficient = &lt;436&gt;;
 		};
 
 		cpu_b1: cpu@101 {
@@ -156,7 +156,7 @@
 			reg = &lt;0x0 0x101&gt;;
 			enable-method = "psci";
 			clocks = &lt;&amp;cru ARMCLKB&gt;;
-			dynamic-power-coefficient = &lt;100&gt;;
+			dynamic-power-coefficient = &lt;436&gt;;
</pre>
      </blockquote>
      <pre wrap="">
There are 6 of these properties (1 for each core now; not just 1 for
each cluster), and you're only changing 2 of them.

BTW, are these values determined from measurement this time? And heavily
tested? The previous values were suspiciously round, but they'd been
heavily tested so I didn't mind :)</pre>
    </blockquote>
    <div align="left"><b style="font-weight:normal;"
        id="docs-internal-guid-eb87eabe-396c-b97b-4cc8-8dfc96dc5aeb">
        <p dir="ltr"
style="line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt;margin-left:
          36pt;text-align: justify;"><span style="font-size:10pt;font-family:Verdana;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;"></span></p>
      </b></div>
    <br>
    <font face="Arial">The coefficient is used to calulate the dynamic
      power as below -<br>
      Pdyn= dynamic-power-coefficient * V^2 * f<br>
      <br>
      The value was tested on rockchip inside, that should be resonable
      for me.<br>
      As the PLT tested the little cpu power comsumption Pl = 0.9mw, but
      big cpu power comsumption Pb= 0.28mw<br>
    </font>
    <style type="text/css">
		body,div,table,thead,tbody,tfoot,tr,th,td,p { font-family:"Droid Sans Fallback"; font-size:x-small }
		a.comment-indicator:hover + comment { background:#ffd; position:absolute; display:block; border:1px solid black; padding:0.5em;  } 
		a.comment-indicator { background:red; display:inline-block; border:1px solid black; width:0.5em; height:0.5em;  } 
		comment { display:none; </style><br>
    -Caesar<br>
    <blockquote type="cite" cite="mid:20170712173208.GA92073@google.com">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap=""> 		};
 	};
 
</pre>
      </blockquote>
      <pre wrap="">
...

Brian

_______________________________________________
Linux-rockchip mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Linux-rockchip@lists.infradead.org">Linux-rockchip@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/listinfo/linux-rockchip</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C9A18D10008F253D4627DA97--
