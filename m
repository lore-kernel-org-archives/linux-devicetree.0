From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH v2 4/5] PCI: qcom: Add Qualcomm PCIe controller driver
Date: Mon, 9 Nov 2015 18:56:57 +0200
Message-ID: <5640D059.3000805@mm-sol.com>
References: <1430743338-10441-1-git-send-email-svarbanov@mm-sol.com>
 <1430743338-10441-5-git-send-email-svarbanov@mm-sol.com>
 <20151106205033.GH24668@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20151106205033.GH24668@usrtlx11787.corpusers.net>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Mathieu Olivari <mathieu@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 11/06/2015 10:50 PM, Bjorn Andersson wrote:
> On Mon 04 May 05:42 PDT 2015, Stanimir Varbanov wrote:
> 
>> The PCIe driver reuse the Designware common code for host
>> and MSI initialization, and also program the Qualcomm
>> application specific registers.
>>
> 
> I want to get the ethernet on the ifc6410 running and this seems like
> the last patchset for the PCIe.
> 
>> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> [..]
>> diff --git a/drivers/pci/host/pcie-qcom.c b/drivers/pci/host/pcie-qcom.c
>> new file mode 100644
>> index 0000000..4f083c6
>> --- /dev/null
>> +++ b/drivers/pci/host/pcie-qcom.c
>> @@ -0,0 +1,677 @@
>> +/*
>> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> 
> Bump the year, it's the future now :)

yep, thanks for the valuable comments I will address all of them on next
version.

I will probably restart the work on the driver this week.

-- 
regards,
Stan
