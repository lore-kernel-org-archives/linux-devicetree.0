Return-Path: <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 1/5] ARM: dts: rockchip: rk3288-veyron: rename pinctrl
 node reboot to reset
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <1447840246-19744-1-git-send-email-andy.yan@rock-chips.com>
 <564C88B9.3060109@cogentembedded.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <564D1CFE.7080802@rock-chips.com>
Date: Thu, 19 Nov 2015 08:51:10 +0800
MIME-Version: 1.0
In-Reply-To: <564C88B9.3060109@cogentembedded.com>
Content-Type: multipart/alternative;
 boundary="------------000301060001020205090200"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, heiko@sntech.de, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@linaro.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, benchan@google.com, sjg@chromium.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org, wxt@rock-chips.com
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000301060001020205090200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sergei:


On 2015年11月18日 22:18, Sergei Shtylyov wrote:
> Hello.
>
> On 11/18/2015 12:50 PM, Andy Yan wrote:
>
>> rename pinctrl node reboot to reset to match it's lable name
>
>    Label? BTW, I'm not seeing it on this node...
      Sorry, I mean "ap_warm_reset_h: ap-warm-reset-h" here
      Maybe it should be called subnode
>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> ---
>>
>> Changes in v3:
>>   - rename a pinctrl node in rk3288-veyron, the original name will be
>>     used in the incoming reboot notifier driver
>>
>> Changes in v2: None
>>
>>   arch/arm/boot/dts/rk3288-veyron.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi 
>> b/arch/arm/boot/dts/rk3288-veyron.dtsi
>> index 2fa7a0d..292aaaf 100644
>> --- a/arch/arm/boot/dts/rk3288-veyron.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
>> @@ -495,7 +495,7 @@
>>           };
>>       };
>>
>> -    reboot {
>> +    reset {
>>           ap_warm_reset_h: ap-warm-reset-h {
>>               rockchip,pins = <RK_GPIO0 13 RK_FUNC_GPIO 
>> &pcfg_pull_none>;
>>           };
>
> MBR, Sergei
>
>
>
>


--------------000301060001020205090200
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Sergei:<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2015年11月18日 22:18, Sergei Shtylyov
      wrote:<br>
    </div>
    <blockquote cite="mid:564C88B9.3060109@cogentembedded.com"
      type="cite">Hello.
      <br>
      <br>
      On 11/18/2015 12:50 PM, Andy Yan wrote:
      <br>
      <br>
      <blockquote type="cite">rename pinctrl node reboot to reset to
        match it's lable name
        <br>
      </blockquote>
      <br>
         Label? BTW, I'm not seeing it on this node...
      <br>
    </blockquote>
         Sorry, I mean "ap_warm_<big>reset</big>_h: ap-warm-<big>reset</big>-h"
    here<br>
         Maybe it should be called subnode<br>
    <blockquote cite="mid:564C88B9.3060109@cogentembedded.com"
      type="cite">
      <br>
      <blockquote type="cite">Signed-off-by: Andy Yan
        <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com">&lt;andy.yan@rock-chips.com&gt;</a>
        <br>
        <br>
        ---
        <br>
        <br>
        Changes in v3:
        <br>
          - rename a pinctrl node in rk3288-veyron, the original name
        will be
        <br>
            used in the incoming reboot notifier driver
        <br>
        <br>
        Changes in v2: None
        <br>
        <br>
          arch/arm/boot/dts/rk3288-veyron.dtsi | 2 +-
        <br>
          1 file changed, 1 insertion(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi
        b/arch/arm/boot/dts/rk3288-veyron.dtsi
        <br>
        index 2fa7a0d..292aaaf 100644
        <br>
        --- a/arch/arm/boot/dts/rk3288-veyron.dtsi
        <br>
        +++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
        <br>
        @@ -495,7 +495,7 @@
        <br>
                  };
        <br>
              };
        <br>
        <br>
        -    reboot {
        <br>
        +    reset {
        <br>
                  ap_warm_reset_h: ap-warm-reset-h {
        <br>
                      rockchip,pins = &lt;RK_GPIO0 13 RK_FUNC_GPIO
        &amp;pcfg_pull_none&gt;;
        <br>
                  };
        <br>
      </blockquote>
      <br>
      MBR, Sergei
      <br>
      <br>
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------000301060001020205090200--
