From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] PCI: qcom: add support to msm8996 PCIE controller
Date: Fri, 18 Nov 2016 08:35:49 -0600
Message-ID: <CAL_JsqJ+_mrwJkwDdbHirXcWiGXEAorE_46_gayTMYyQ9vK0FA@mail.gmail.com>
References: <1479219837-7868-1-git-send-email-srinivas.kandagatla@linaro.org>
 <20161116150858.343voujjg4p2zdhn@rob-hp-laptop> <50449970-74f5-1d73-4c78-323741b8a705@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50449970-74f5-1d73-4c78-323741b8a705-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 16, 2016 at 10:29 AM, Srinivas Kandagatla
<srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>
> On 16/11/16 15:08, Rob Herring wrote:
>>
>> On Tue, Nov 15, 2016 at 02:23:57PM +0000, Srinivas Kandagatla wrote:
>>>
>>> This patch adds support to msm8996/apq8096 pcie, MSM8996 supports
>>
>>
>> s/pcie/PCIe/
>
> Will fix two instances this and spin a next version.
>
>>
>>> Gen 1/2, One lane, 3 pcie root-complex with support to MSI and
>>> legacy interrupts and it conforms to PCI Express Base 2.1 specification.
>>>
>>> This patch adds post_init callback to qcom_pcie_ops, as this is pcie
>>
>>
>> s/pcie/PCIe/
>>
>>> pipe clocks are only setup after the phy is powered on.
>>> It also adds ltssm_enable callback as it is very much different to other
>>> supported SOCs in the driver.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Acked-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>
>>>  Changes since v4:
>>>         - removed duplicate define spotted by Stan.
>>>         - renamed halt register to remove msm8996 suggested by Stan.
>>>         - dropped simple-pm-bus and runtime pm patches as these can
>>>          potentially go into pm domain provider.
>>>
>>>  .../devicetree/bindings/pci/qcom,pcie.txt          |  67 +++++++-
>>>  drivers/pci/host/pcie-qcom.c                       | 175
>>> ++++++++++++++++++++-
>>>  2 files changed, 236 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>>> b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>>> index 4059a6f..141d8c3 100644
>>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>>> @@ -7,6 +7,7 @@
>>>                         - "qcom,pcie-ipq8064" for ipq8064
>>>                         - "qcom,pcie-apq8064" for apq8064
>>>                         - "qcom,pcie-apq8084" for apq8084
>>> +                       - "qcom,pcie-msm8996" for msm8996 or apq8096
>>>
>>>  - reg:
>>>         Usage: required
>>> @@ -92,6 +93,17 @@
>>>                         - "aux"         Auxiliary (AUX) clock
>>>                         - "bus_master"  Master AXI clock
>>>                         - "bus_slave"   Slave AXI clock
>>> +
>>> +- clock-names:
>>> +       Usage: required for msm8996/apq8096
>>> +       Value type: <stringlist>
>>> +       Definition: Should contain the following entries
>>> +                       - "pipe"        Pipe Clock driving internal
>>> logic.
>>> +                       - "aux"         Auxiliary (AUX) clock.
>>> +                       - "cfg"         Configuration clk.
>>> +                       - "bus_master"  Master AXI clock.
>>> +                       - "bus_slave"   Slave AXI clock.
>>> +
>>>  - resets:
>>>         Usage: required
>>>         Value type: <prop-encoded-array>
>>> @@ -115,7 +127,7 @@
>>>                         - "core" Core reset
>>>
>>>  - power-domains:
>>> -       Usage: required for apq8084
>>> +       Usage: required for apq8084 and msm8996/apq8096
>>>         Value type: <prop-encoded-array>
>>>         Definition: A phandle and power domain specifier pair to the
>>>                     power domain which is responsible for collapsing
>>> @@ -231,3 +243,56 @@
>>>                 pinctrl-0 = <&pcie0_pins_default>;
>>>                 pinctrl-names = "default";
>>>         };
>>> +
>>> +* Example for apq8096:
>>
>>
>> Do you really need an example for every chip?
>
>
> Yes, for consistency reasons, as there are two examples already in this
> document. Also having an example does not harm anyway.

You have the dts itself, and we don't need 2 copies of the same thing.
If anything, drop one of the 2 examples already there.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
