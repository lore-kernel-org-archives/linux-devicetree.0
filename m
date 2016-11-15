From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/3] PCI: qcom: add support to msm8996 PCIE controller
Date: Tue, 15 Nov 2016 18:30:10 +0200
Message-ID: <3fc1b0b1-5f48-ebce-e7f1-d4c06e9ee28d@mm-sol.com>
References: <1479122155-13393-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1479122155-13393-3-git-send-email-srinivas.kandagatla@linaro.org>
 <aa135735-4ff4-06e3-7899-1255a21edfb4@mm-sol.com>
 <f0d9884c-b5f6-e9a8-e814-6dfd632466fc@linaro.org>
 <ea5858f3-19d6-c746-2e95-a64d6a436b38@mm-sol.com>
 <8d0e9b19-5d6f-8be5-84be-d102817a6b21@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8d0e9b19-5d6f-8be5-84be-d102817a6b21-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 11/15/2016 06:10 PM, Srinivas Kandagatla wrote:
> 
> 
> On 15/11/16 15:08, Stanimir Varbanov wrote:
>>>> I don't like MSM8996_ prefix. Could you invent a macro which depending
>>>> >> on controller selects proper offset?
>>> >
>>> > maybe some like this ??
>>> >
>>> > #define PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT_V2    0x1A8
>> No, I wanted to preserve the name of the register offset. By that way in
>> the next pcie controller version we do not need to have
>> PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT_V3.
>>
>> I was thinking for something like
>>
>> PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT(ver)    \
>>         ((ver) == VERSION_1 ? 0x178 : 0x1A8)
>>
>> But you will need to extend qcom_pcie_ops with new member to store the
>> version.
>>
>> It's up to you ... or we can fix it when new version of the controller
>> appear.
> TBH, I don't want to add this just for this one case, looks bit over do.
> So I skipped to using V2 Suffix.
> We can fix later if required.

OK, sounds good.

regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
