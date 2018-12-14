From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH 01/10] dt-bindings: usb: add support for dwc3 controller
 on HiSilicon SoCs
Date: Fri, 14 Dec 2018 16:05:03 +0800
Message-ID: <8bd2e47a-5766-3236-2c89-a4eaf343991c@huawei.com>
References: <20181027095820.40056-1-chenyu56@huawei.com>
 <20181027095820.40056-2-chenyu56@huawei.com> <20181112160241.GA14074@bogus>
 <9fce6a58-d986-25e4-1791-ba375e4f075e@huawei.com>
 <CAL_JsqKObFGdf5tPdv=Ss2ZWCPBgimbEUn72rkR2+L7uRbAirg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKObFGdf5tPdv=Ss2ZWCPBgimbEUn72rkR2+L7uRbAirg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: liuyu712@hisilicon.com, Wangbinghui <wangbinghui@hisilicon.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, kongfei@hisilicon.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2018/12/4 0:01, Rob Herring wrote:
> On Fri, Nov 16, 2018 at 8:29 PM Chen Yu <chenyu56@huawei.com> wrote:
>>
>> Hi,
>>
>> On 2018/11/13 0:02, Rob Herring wrote:
>>> On Sat, Oct 27, 2018 at 05:58:11PM +0800, Yu Chen wrote:
>>>> This patch adds binding descriptions to support the dwc3 controller
>>>> on HiSilicon SoCs and boards like the HiKey960.
>>>>
>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>> Cc: John Stultz <john.stultz@linaro.org>
>>>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>>>> ---
>>>>  .../devicetree/bindings/usb/dwc3-hisi.txt          | 53 ++++++++++++++++++++++
>>>>  1 file changed, 53 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/usb/dwc3-hisi.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3-hisi.txt b/Documentation/devicetree/bindings/usb/dwc3-hisi.txt
>>>> new file mode 100644
>>>> index 000000000000..e715e7b1c324
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3-hisi.txt
>>>> @@ -0,0 +1,53 @@
>>>> +HiSilicon DWC3 USB SoC controller
>>>> +
>>>> +This file documents the parameters for the dwc3-hisi driver.
>>>> +
>>>> +Required properties:
>>>> +- compatible:       should be "hisilicon,hi3660-dwc3"
>>>> +- clocks:   A list of phandle + clock-specifier pairs for the
>>>> +            clocks listed in clock-names
>>>> +- clock-names:      Specify clock names
>>>> +- resets:   list of phandle and reset specifier pairs.
>>>> +
>>>> +Sub-nodes:
>>>> +The dwc3 core should be added as subnode to HiSilicon DWC3 as shown in the
>>>> +example below. The DT binding details of dwc3 can be found in:
>>>> +Documentation/devicetree/bindings/usb/dwc3.txt
>>>
>>> If you only have clocks and resets and no glue registers, then you
>>> don't need a sub-node. Just make the controller one node.
>>>
>>
>> In dwc3 glue driver，the controller driver usually probed by call of_platform_populate
>> which will search the child node of glue driver.
>> The code of function of_platform_populate is as below:
>>
>>         for_each_child_of_node(root, child) {
>>                  rc = of_platform_bus_create(child, matches, lookup, parent, true);
>>                  if (rc) {
>>                          of_node_put(child);
>>                          break;
>>                  }
>>          }
>>
>> So I think the controller node should be a sub-node.
> 
> It was done that way, but has changed. See commit fe8abf332b8f ("usb:
> dwc3: support clocks and resets for DWC3 core").
> 
I have read the commit and there is a question. If I make the controller one node,
how can the pm suspend of the glue driver be guaranteed to be called after the pm suspend
of dwc3 controller? And also the order of pm resume.
There are some reset registers that should be configured before the initialization
of dwc3 controller on Hi3660 platform.

> Rob
> 
> .
> 
