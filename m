From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/3] PCI: qcom: add support to msm8996 PCIE controller
Date: Tue, 15 Nov 2016 17:08:33 +0200
Message-ID: <ea5858f3-19d6-c746-2e95-a64d6a436b38@mm-sol.com>
References: <1479122155-13393-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1479122155-13393-3-git-send-email-srinivas.kandagatla@linaro.org>
 <aa135735-4ff4-06e3-7899-1255a21edfb4@mm-sol.com>
 <f0d9884c-b5f6-e9a8-e814-6dfd632466fc@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f0d9884c-b5f6-e9a8-e814-6dfd632466fc-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Srini,

On 11/15/2016 03:22 PM, Srinivas Kandagatla wrote:
> 
> 
> On 15/11/16 12:24, Stanimir Varbanov wrote:
>> Hi Srini,
>>
>> On 11/14/2016 01:15 PM, Srinivas Kandagatla wrote:
>>> This patch adds support to msm8996/apq8096 pcie, MSM8996 supports
>>> Gen 1/2, One lane, 3 pcie root-complex with support to MSI and
>>> legacy interrupts and it conforms to PCI Express Base 2.1 specification.
>>>
>>> This patch adds post_init callback to qcom_pcie_ops, as this is pcie
>>> pipe clocks are only setup after the phy is powered on.
>>> It also adds ltssm_enable callback as it is very much different to other
>>> supported SOCs in the driver.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> With below comments addressed:
>>
>> Acked-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> Thanks for the ack.
>>
>>> ---
>>>  .../devicetree/bindings/pci/qcom,pcie.txt          |  67 +++++++-
>>>  drivers/pci/host/pcie-qcom.c                       | 177
>>> ++++++++++++++++++++-
>>>  2 files changed, 238 insertions(+), 6 deletions(-)
>>>
>>
>> <snip>
>>
>>> diff --git a/drivers/pci/host/pcie-qcom.c b/drivers/pci/host/pcie-qcom.c
>>> index 3593640..03ba6b1 100644
>>> --- a/drivers/pci/host/pcie-qcom.c
>>> +++ b/drivers/pci/host/pcie-qcom.c
>>> @@ -36,11 +36,19 @@
>>>
>>>  #include "pcie-designware.h"
>>>
>>> +#define PCIE20_PARF_DBI_BASE_ADDR    0x168
>>
>> This is already defined few rows below, please drop it.
>>
> Yep, will remove this.
>>> +
>>> +#define PCIE20_PARF_SYS_CTRL            0x00
>>>  #define PCIE20_PARF_PHY_CTRL            0x40
>>>  #define PCIE20_PARF_PHY_REFCLK            0x4C
>>>  #define PCIE20_PARF_DBI_BASE_ADDR        0x168
>>>  #define PCIE20_PARF_SLV_ADDR_SPACE_SIZE        0x16c
>>> +#define PCIE20_PARF_MHI_CLOCK_RESET_CTRL    0x174
>>>  #define PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT    0x178
>>> +#define MSM8996_PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT   0x1A8
>>
>> I don't like MSM8996_ prefix. Could you invent a macro which depending
>> on controller selects proper offset?
> 
> maybe some like this ??
> 
> #define PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT_V2    0x1A8

No, I wanted to preserve the name of the register offset. By that way in
the next pcie controller version we do not need to have
PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT_V3.

I was thinking for something like

PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT(ver)	\
		((ver) == VERSION_1 ? 0x178 : 0x1A8)

But you will need to extend qcom_pcie_ops with new member to store the
version.

It's up to you ... or we can fix it when new version of the controller
appear.

regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
