Return-Path: <sdharia@codeaurora.org>
Subject: Re: [PATCH V5 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
 <1461801489-16254-5-git-send-email-sdharia@codeaurora.org>
 <20160428112859.GE21145@leverpostej>
From: Sagar Dharia <sdharia@codeaurora.org>
Message-ID: <eddf7d8e-c5f4-6ded-d094-567578b8a3cc@codeaurora.org>
Date: Fri, 6 May 2016 11:28:07 -0600
MIME-Version: 1.0
In-Reply-To: <20160428112859.GE21145@leverpostej>
Content-Type: multipart/alternative;
 boundary="------------55DC1556FECDCDAA5CE5B153"
To: Mark Rutland <mark.rutland@arm.com>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------55DC1556FECDCDAA5CE5B153
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/2016 5:28 AM, Mark Rutland wrote:
> On Wed, Apr 27, 2016 at 05:58:07PM -0600, Sagar Dharia wrote:
>
>> + - interrupts : Interrupt number used by this controller
>> + - clocks : Interface and core clocks used by this slimbus controller
>> + - clock-names : Required clock-name entries are:
>> +	"iface_clk" : Interface clock for this controller
>> +	"core_clk" : Interrupt for controller core's BAM
>> +
>> +Optional property:
>> + - reg entry for slew rate : If slew rate control register is provided, this
>> +	entry should be used.
>> + - reg-name for slew rate: "slimbus_slew_reg"
> Per the example below, this looks like an element in a separate system
> controller block, or part of some other controller that's not modelled
> here.
>
> What is this, exactly?
You are right, this entry is outside the controller block, but needs to 
be programmed by slimbus controller to make sure slew-rate of the clock 
line is controlled to be within spec.

I will incorporate other comments in the upcoming patch.

Thanks
Sagar
>
>> +
>> +Example:
>> +	slim@28080000 {
>> +		compatible = "qcom,slim-msm";
>> +		#address-cells = <4>;
>> +		#size-cells = <0>;
>> +		reg = <0x28080000 0x2000>, <0x80207C 4>;
>> +		reg-names = "slimbus_physical", "slimbus_slew_reg";
>> +		interrupts = <0 33 0>;
>> +		clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
>> +		clock-names = "iface_clk", "core_clk";
>> +
>> +		codec@0217.0060.01.00 {
>> +			compatible = "qcom,wcdv1", "slim";
> As mentioned on the generic binding, please drop the "slim" fallback
> here.
>
>> +			reg = <0x217 0x60 0x1 0x0>;
>> +		};
>> +	};
> Thanks,
> Mark.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation


--------------55DC1556FECDCDAA5CE5B153
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 4/28/2016 5:28 AM, Mark Rutland
      wrote:<br>
    </div>
    <blockquote cite="mid:20160428112859.GE21145@leverpostej"
      type="cite">
      <pre wrap="">On Wed, Apr 27, 2016 at 05:58:07PM -0600, Sagar Dharia wrote:
</pre>
      <br>
      <blockquote type="cite">
        <pre wrap="">+ - interrupts : Interrupt number used by this controller
+ - clocks : Interface and core clocks used by this slimbus controller
+ - clock-names : Required clock-name entries are:
+	"iface_clk" : Interface clock for this controller
+	"core_clk" : Interrupt for controller core's BAM
+
+Optional property:
+ - reg entry for slew rate : If slew rate control register is provided, this
+	entry should be used.
+ - reg-name for slew rate: "slimbus_slew_reg"
</pre>
      </blockquote>
      <pre wrap="">
Per the example below, this looks like an element in a separate system
controller block, or part of some other controller that's not modelled
here.

What is this, exactly?</pre>
    </blockquote>
    You are right, this entry is outside the controller block, but needs
    to be programmed by slimbus controller to make sure slew-rate of the
    clock line is controlled to be within spec.<br>
    <br>
    I will incorporate other comments in the upcoming patch.<br>
    <br>
    Thanks<br>
    Sagar<br>
    <blockquote cite="mid:20160428112859.GE21145@leverpostej"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+Example:
+	slim@28080000 {
+		compatible = "qcom,slim-msm";
+		#address-cells = &lt;4&gt;;
+		#size-cells = &lt;0&gt;;
+		reg = &lt;0x28080000 0x2000&gt;, &lt;0x80207C 4&gt;;
+		reg-names = "slimbus_physical", "slimbus_slew_reg";
+		interrupts = &lt;0 33 0&gt;;
+		clocks = &lt;&amp;lcc SLIMBUS_SRC&gt;, &lt;&amp;lcc AUDIO_SLIMBUS_CLK&gt;;
+		clock-names = "iface_clk", "core_clk";
+
+		<a class="moz-txt-link-abbreviated" href="mailto:codec@0217.0060.01.00">codec@0217.0060.01.00</a> {
+			compatible = "qcom,wcdv1", "slim";
</pre>
      </blockquote>
      <pre wrap="">
As mentioned on the generic binding, please drop the "slim" fallback
here.

</pre>
      <blockquote type="cite">
        <pre wrap="">+			reg = &lt;0x217 0x60 0x1 0x0&gt;;
+		};
+	};
</pre>
      </blockquote>
      <pre wrap="">
Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
the body of a message to <a class="moz-txt-link-abbreviated" href="mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a>
More majordomo info at  <a class="moz-txt-link-freetext" href="http://vger.kernel.org/majordomo-info.html">http://vger.kernel.org/majordomo-info.html</a>
</pre>
    </blockquote>
    <br>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation</pre>
  </body>
</html>

--------------55DC1556FECDCDAA5CE5B153--
