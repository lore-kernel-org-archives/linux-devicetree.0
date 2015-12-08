Return-Path: <yankejian@huawei.com>
Subject: Re: [PATCH RESEND net-next 3/3] arm64: hip05-d02: Document devicetree
 bindings for Hisilicon D02 Board
References: <1449302088-53037-1-git-send-email-yankejian@huawei.com>
 <1449302088-53037-4-git-send-email-yankejian@huawei.com>
 <20151207131617.GA25170@rob-hp-laptop>
From: "Yankejian (Hackim Yim)" <yankejian@huawei.com>
Message-ID: <56663261.8050101@huawei.com>
Date: Tue, 8 Dec 2015 09:29:05 +0800
MIME-Version: 1.0
In-Reply-To: <20151207131617.GA25170@rob-hp-laptop>
Content-Type: multipart/alternative;
	boundary="------------040504000407030303050402"
To: Rob Herring <robh@kernel.org>
Cc: davem@davemloft.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, wangkefeng.wang@huawei.com, dingtianhong@huawei.com, liguozhu@huawei.com, Yisen.Zhuang@huawei.com, sboyd@codeaurora.org, haojian.zhuang@linaro.org, wangzhou1@hisilicon.com, bintian.wang@huawei.com, long.wanglong@huawei.com, leo.yan@linaro.org, haifeng.wei@huawei.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linuxarm@huawei.com
List-ID: <devicetree@vger.kernel.org>

--------------040504000407030303050402
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



On 2015/12/7 21:16, Rob Herring wrote:
> On Sat, Dec 05, 2015 at 03:54:48PM +0800, yankejian wrote:
>> This patch adds documentation for the devicetree bindings used by the
>> DT files of Hisilicon Hip05-D02 development board.
>>
>> Signed-off-by: yankejian <yankejian@huawei.com>
>> ---
>>  .../devicetree/bindings/arm/hisilicon/hisilicon.txt      | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> index 6ac7c00..5318d78 100644
>> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> @@ -187,6 +187,22 @@ Example:
>>  		reg = <0xb0000000 0x10000>;
>>  	};
>>  
>> +Hisilicon HiP05 PERISUB system controller
>> +
>> +Required properties:
>> +- compatible : "hisilicon,peri-c-subctrl", "syscon";
> This should be more specific and have the SOC name in it.
Hi Rob,
the design is recommended to be used for hip05 and later SOCs, so we try to use hisilicon instead.
thanks for your suggestions.

Best Regards,
yankejian


>> +- reg : Register address and size
>> +
>> +The HiP05 PERISUB system controller is shared by peripheral controllers in
>> +HiP05 Soc to implement some basic configurations. the peripheral
>> + controllers include mdio, ddr, iic, uart, timer and so on.
>> +
>> +Example:
>> +	/* for HiP05 PCIe-SAS system */
>> +	pcie_sas: system_controller@0xb0000000 {
>> +		compatible = "hisilicon,pcie-sas-subctrl", "syscon";
> The example doesn't match.

Thanks for this. I have changed this in PATCH V2 already floated.

Best Regards
yankejian

>> +		reg = <0xb0000000 0x10000>;
>> +	};
>>  -----------------------------------------------------------------------
>>  Hisilicon CPU controller
>>  
>> -- 
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> .
>


--------------040504000407030303050402
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 2015/12/7 21:16, Rob Herring wrote:<br>
    </div>
    <blockquote cite="mid:20151207131617.GA25170@rob-hp-laptop"
      type="cite">
      <pre wrap="">On Sat, Dec 05, 2015 at 03:54:48PM +0800, yankejian wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">This patch adds documentation for the devicetree bindings used by the
DT files of Hisilicon Hip05-D02 development board.

Signed-off-by: yankejian <a class="moz-txt-link-rfc2396E" href="mailto:yankejian@huawei.com">&lt;yankejian@huawei.com&gt;</a>
---
 .../devicetree/bindings/arm/hisilicon/hisilicon.txt      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 6ac7c00..5318d78 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -187,6 +187,22 @@ Example:
 		reg = &lt;0xb0000000 0x10000&gt;;
 	};
 
+Hisilicon HiP05 PERISUB system controller
+
+Required properties:
+- compatible : "hisilicon,peri-c-subctrl", "syscon";
</pre>
      </blockquote>
      <pre wrap="">
This should be more specific and have the SOC name in it.
</pre>
    </blockquote>
    Hi Rob,<br>
    <span id="im-content_1449454073269" class="im-content"><font
        style="FONT-SIZE: 14px" face="微软雅黑">the design is recommended to
        be used for hip05 and later SOCs, so we try to use hisilicon
        instead.<br>
        thanks for your suggestions.<br>
        <br>
        Best Regards,<br>
        yankejian<br>
      </font></span><br>
    <br>
    <blockquote cite="mid:20151207131617.GA25170@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+- reg : Register address and size
+
+The HiP05 PERISUB system controller is shared by peripheral controllers in
+HiP05 Soc to implement some basic configurations. the peripheral
+ controllers include mdio, ddr, iic, uart, timer and so on.
+
+Example:
+	/* for HiP05 PCIe-SAS system */
+	pcie_sas: system_controller@0xb0000000 {
+		compatible = "hisilicon,pcie-sas-subctrl", "syscon";
</pre>
      </blockquote>
      <pre wrap="">
The example doesn't match.
</pre>
    </blockquote>
    <br>
    Thanks for this. I have changed this in PATCH V2 already floated.
    <br>
    <br>
    Best Regards
    <br>
    yankejian<br>
    <br>
    <blockquote cite="mid:20151207131617.GA25170@rob-hp-laptop"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+		reg = &lt;0xb0000000 0x10000&gt;;
+	};
 -----------------------------------------------------------------------
 Hisilicon CPU controller
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to <a class="moz-txt-link-abbreviated" href="mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a>
More majordomo info at  <a class="moz-txt-link-freetext" href="http://vger.kernel.org/majordomo-info.html">http://vger.kernel.org/majordomo-info.html</a>
</pre>
      </blockquote>
      <pre wrap="">--
To unsubscribe from this list: send the line "unsubscribe netdev" in
the body of a message to <a class="moz-txt-link-abbreviated" href="mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a>
More majordomo info at  <a class="moz-txt-link-freetext" href="http://vger.kernel.org/majordomo-info.html">http://vger.kernel.org/majordomo-info.html</a>

.

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040504000407030303050402--
