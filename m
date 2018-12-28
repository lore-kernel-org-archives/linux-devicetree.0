From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add Qualcomm USB Super-Speed PHY
 bindings
Date: Fri, 28 Dec 2018 13:38:59 +0100
Message-ID: <2a007a91-e709-c9f1-f634-ddcf707e954d@linaro.org>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1544176558-7946-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20181220170531.GA19862@bogus>
 <20181220173633.GA19912@jackp-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220173633.GA19912@jackp-linux.qualcomm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jack Pham <jackp@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org, Manu Gautam <mgautam@codeaurora.org>, Sriharsha Allenki <sallenki@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 12/20/18 18:37, Jack Pham wrote:
> Hi Rob, Jorge,
> 
> On Thu, Dec 20, 2018 at 11:05:31AM -0600, Rob Herring wrote:
>> On Fri, Dec 07, 2018 at 10:55:57AM +0100, Jorge Ramirez-Ortiz wrote:
>>> Binding description for Qualcomm's Synopsys 1.0.0 super-speed PHY
>>> controller embedded in QCS404.
>>>
>>> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
>>> definitions.
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>> ---
>>>   .../devicetree/bindings/usb/qcom,usb-ssphy.txt     | 78 ++++++++++++++++++++++
>>>   1 file changed, 78 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
>>> new file mode 100644
>>> index 0000000..fcf4e01
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
>>> @@ -0,0 +1,78 @@
>>> +Qualcomm Synopsys 1.0.0 SS phy controller
>>> +===========================================
>>> +
>>> +Synopsys 1.0.0 ss phy controller supports SS usb connectivity on Qualcomm
>>> +chipsets
>>> +
>>> +Required properties:
>>> +
>>> +- compatible:
>>> +    Value type: <string>
>>> +    Definition: Should contain "qcom,usb-ssphy".
>>
>> What is "qcom,dwc3-ss-usb-phy" which already exists then?
> 
> Uh, apparently only the bindings doc is there but the driver never
> landed. I guess it fell through the cracks nearly 4 years ago.
> 
> https://lore.kernel.org/patchwork/patch/499502/
> 
> Jorge, does Andy's version of this driver at all resemble what can be
> used for QCS404?

on close inspection I cant see any similitudes between the drivers. 
Unfortunately I don't have access to documentation yet but the control 
register offsets and the control bits in the drivers do not match.

because of the above I'd like to go ahead with our separate drivers 
-already tested and validated- for HS (Shawn's) and SS (mine).

if that is acceptable, should we reuse the upstream bindings for  our 
implementation? or perhaps Shawn Guo will do for his HS version of the 
driver and I go ahead and create a new one? what would you suggest?





> 
> Jack
> 
