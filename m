Return-Path: <SRS0=Ux/M=X7=rock-chips.com=zhengxing@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add clk-480m for ehci and ohci
 of rk3399
References: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com>
 <991221a4-3962-1bcb-7863-72f5553eba40@rock-chips.com>
 <CAD=FV=XKQaqRS4jUM7NpN2KEV8USj_cVWbh7q4274n3jBtwORg@mail.gmail.com>
 <2526685.VC5cUs58On@phil>
From: Xing Zheng <zhengxing@rock-chips.com>
Message-ID: <5853903D.8030605@rock-chips.com>
Date: Fri, 16 Dec 2016 14:57:01 +0800
MIME-Version: 1.0
In-Reply-To: <2526685.VC5cUs58On@phil>
Content-Type: multipart/alternative;
 boundary="------------060209070700060806030409"
To: Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@google.com>
Cc: Frank Wang <frank.wang@rock-chips.com>, Brian Norris <briannorris@chromium.org>, William wu <wulf@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Caesar Wang <wxt@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "daniel.meng" <daniel.meng@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, =?UTF-8?B?6YOR5YW0?= <xing.zheng@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060209070700060806030409
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Heiko, Doug,

On 2016年12月16日 02:18, Heiko Stuebner wrote:
> Am Donnerstag, 15. Dezember 2016, 08:34:09 CET schrieb Doug Anderson:
>
>> I still need to digest all of the things that were added to this
>> thread overnight, but nothing I've seen so far indicates that you need
>> the post-gated clock.  AKA I still think you need to redo your patch
>> to replace:
>>
>>                clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
>>                         <&cru SCLK_USBPHY0_480M_SRC>;
>>
>> with:
>>
>>                clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
>>                          <&u2phy0>;
>>
>> Can you please comment on that?
> Also, with the change, the ehci will keep the clock (and thus the phy) always
> on. Does the phy-autosuspend even save anything now?
>
> In any case, could we make the clock-names entry sound nicer than usbphy0_480m
> please? bindings/usb/atmel-usb.txt calls its UTMI clock simply "usb_clk", but
> something like "utmi" should also work.
> While at it you could also fix up the other clock names to something like
> "host" and "arbiter" or so?.
>
>
> Heiko
>

The usbphy related clock tress like this:


Actually, at drivers/phy/phy-rockchip-inno-usb2.c, we can only 
enable/disable the master gate via GRF is PHY_PLL, not UTMI_CLK.

And the naming style of the "hclk_host0" keep the name "hclk_host0" on 
the clcok tree diagram:


Therefore, could we rename the clock name like this:
----
for usb_host0_ehci and usb_host0_ohci:
         clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
              <&cru SCLK_U2PHY0>;
         clock-names = "hclk_host0", "hclk_host0_arb",
                   "sclk_u2phy0";

for usb_host1_ehci and usb_host1_ohci:
         clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
              <&cru SCLK_U2PHY1>;
         clock-names = "hclk_host1", "hclk_host1_arb",
                   "sclk_u2phy1";
----

BTW, the "arb" is an abbreviation for arbiter.

Thanks.

-- 
- Xing Zheng


--------------060209070700060806030409
Content-Type: multipart/related;
 boundary="------------080508060503090207050000"


--------------080508060503090207050000
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Heiko, Doug,<br>
    <br>
    <div class="moz-cite-prefix">On 2016年12月16日 02:18, Heiko Stuebner
      wrote:<br>
    </div>
    <blockquote cite="mid:2526685.VC5cUs58On@phil" type="cite">
      <pre wrap="">Am Donnerstag, 15. Dezember 2016, 08:34:09 CET schrieb Doug Anderson:
</pre>
      <br>
      <blockquote type="cite">
        <pre wrap="">
I still need to digest all of the things that were added to this
thread overnight, but nothing I've seen so far indicates that you need
the post-gated clock.  AKA I still think you need to redo your patch
to replace:

              clocks = &lt;&amp;cru HCLK_HOST0&gt;, &lt;&amp;cru HCLK_HOST0_ARB&gt;,
                       &lt;&amp;cru SCLK_USBPHY0_480M_SRC&gt;;

with:

              clocks = &lt;&amp;cru HCLK_HOST0&gt;, &lt;&amp;cru HCLK_HOST0_ARB&gt;,
                        &lt;&amp;u2phy0&gt;;

Can you please comment on that?
</pre>
      </blockquote>
      <pre wrap="">
Also, with the change, the ehci will keep the clock (and thus the phy) always 
on. Does the phy-autosuspend even save anything now?

In any case, could we make the clock-names entry sound nicer than usbphy0_480m 
please? bindings/usb/atmel-usb.txt calls its UTMI clock simply "usb_clk", but 
something like "utmi" should also work.
While at it you could also fix up the other clock names to something like 
"host" and "arbiter" or so?.


Heiko

</pre>
    </blockquote>
    <br>
    The usbphy related clock tress like this:<br>
    <img src="cid:part1.00000701.04010709@rock-chips.com" alt=""><br>
    <br>
    Actually, at drivers/phy/phy-rockchip-inno-usb2.c, we can only
    enable/disable the master gate via GRF is PHY_PLL, not UTMI_CLK.<br>
    <br>
    And the naming style of the "hclk_host0" keep the name "hclk_host0"
    on the clcok tree diagram:<br>
    <img src="cid:part2.05010702.07020508@rock-chips.com" alt=""><br>
    <br>
    Therefore, could we rename the clock name like this:<br>
    ----<br>
    for usb_host0_ehci and usb_host0_ohci:<br>
            clocks = &lt;&amp;cru HCLK_HOST0&gt;, &lt;&amp;cru
    HCLK_HOST0_ARB&gt;,<br>
                 &lt;&amp;cru SCLK_U2PHY0&gt;;<br>
            clock-names = "hclk_host0", "hclk_host0_arb",<br>
                      "sclk_u2phy0";<br>
    <br>
    for usb_host1_ehci and usb_host1_ohci:<br>
            clocks = &lt;&amp;cru HCLK_HOST1&gt;, &lt;&amp;cru
    HCLK_HOST1_ARB&gt;,<br>
                 &lt;&amp;cru SCLK_U2PHY1&gt;;<br>
            clock-names = "hclk_host1", "hclk_host1_arb",<br>
                      "sclk_u2phy1";<br>
    ----<br>
    <br>
    BTW, the "arb" is an abbreviation for arbiter.<br>
    <br>
    Thanks.<br>
    <pre class="moz-signature" cols="72">-- 
- Xing Zheng</pre>
  </body>
</html>

--------------080508060503090207050000
Content-Type: image/png;
 name="iajadige.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.00000701.04010709@rock-chips.com>
Content-Disposition: inline;
 filename="iajadige.png"

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
80HRePrsmWAAAAAASUVORK5CYII=
--------------080508060503090207050000
Content-Type: image/png;
 name="egdfjghh.png"
Content-Transfer-Encoding: base64
Content-ID: <part2.05010702.07020508@rock-chips.com>
Content-Disposition: inline;
 filename="egdfjghh.png"

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
3jg+pMAqEe8AAAAASUVORK5CYII=
--------------080508060503090207050000--

--------------060209070700060806030409--
