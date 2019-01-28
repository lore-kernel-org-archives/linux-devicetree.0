From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 04/13] dt-bindings: mailbox: qcom: Add clock-name optional
 property
Date: Mon, 28 Jan 2019 18:46:53 +0100
Message-ID: <be1a6252-2854-c095-e8aa-05b3e35c83c4@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-5-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190117064411.GK25498@builder>
 <83e77b69-9a22-641f-ada9-7dac565160e1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <83e77b69-9a22-641f-ada9-7dac565160e1@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/28/19 17:57, Jorge Ramirez wrote:
> On 1/17/19 07:44, Bjorn Andersson wrote:
>> On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:
>>
>>> When the APCS clock is registered (platform dependent), it retrieves
>>> its parent names from hardcoded values in the driver.
>>>
>>> The following commit allows the DT node to provide such clock names to
>>> the platform data based clock driver therefore avoiding having to
>>> explicitly embed those names in the clock driver source code.
>>>
>>> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
>>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>>> ---
>>>  .../bindings/mailbox/qcom,apcs-kpss-global.txt      | 21 +++++++++++++++++++++
>>>  1 file changed, 21 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>>> index 1232fc9..f252439 100644
>>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>>> @@ -23,6 +23,10 @@ platforms.
>>>  	Value type: <phandle>
>>>  	Definition: phandle to the input PLL, which feeds the APCS mux/divider
>>>  
>>> +       Usage: required if #clock-names property is present
>>> +       Value type: <phandle array>
>>> +	Definition: phandles to the two parent clocks of the clock driver.
>>
>> I presume you meant to replace the existing definition of "clocks"?
> 
> I am sorry didn't reply to this earlier. Yes this is not very clear.
> 
> This is required as an extension to the apcs-msm8916.c driver also used
> on the qcs404; since it is an extension, the previous definition should
> still be applicable.
> 
> In the case of the msm8916 the #clock-names property is NOT necessary
> (it would be ignored by the driver), so having it should not mean that
> we need to have #clocks.
> 
> In the case of the qcs404, having clock-names means that we do need to
> have #clocks (hence the additional if)
> 
> and not quite sure how to word this condition in the bindings..
> 
> I am going to post v2 with some updates and if required will post a v3
> with more clarifications.

In the version that I am about to post I ended up following your
suggestion:  replaced the existing definition (and the apcs mailbox node
msm8916.dts) but  kept bacwards compatibility in the driver (so old
bindings will still work).

That should enable migration to the new bindings -as per the
documentation - for new platforms (something that IIRC sboyd also asked for)

> 
>>
>> I think the purpose of "required if #clock-cells" comes from that
>> meaning that it represents a clock-controller if #clock-cells is
>> specified, in which case it requires the upstream clock(s).
>>
>> Regards,
>> Bjorn
>>
>>> +
>>>  - #mbox-cells:
>>>  	Usage: required
>>>  	Value type: <u32>
>>> @@ -33,6 +37,12 @@ platforms.
>>>  	Value type: <u32>
>>>  	Definition: as described in clock.txt, must be 0
>>>  
>>> +- clock-names:
>>> +	Usage: required if the platform data based clock driver needs to
>>> +	retrieve the parent clock names from device tree.
>>> +	This will requires two mandatory clocks to be defined.
>>> +	Value type: <string-array>
>>> +	Definition: must be "aux" and "pll"
>>>  
>>>  = EXAMPLE
>>>  The following example describes the APCS HMSS found in MSM8996 and part of the
>>> @@ -65,3 +75,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
>>>  		clocks = <&a53pll>;
>>>  		#clock-cells = <0>;
>>>  	};
>>> +
>>> +Below is another example of the APCS binding on QCS404 platforms:
>>> +
>>> +	apcs_glb: mailbox@b011000 {
>>> +		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
>>> +		reg = <0x0b011000 0x1000>;
>>> +		#mbox-cells = <1>;
>>> +		clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
>>> +		clock-names = "aux", "pll";
>>> +		#clock-cells = <0>;
>>> +	};
>>> -- 
>>> 2.7.4
>>>
>>
> 
