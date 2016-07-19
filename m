From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 01/10] Documentation: DT: qcom_hidma: update binding for
 MSI
Date: Tue, 19 Jul 2016 08:42:20 -0400
Message-ID: <02522721-6213-82c3-310f-22313f69e7b7@codeaurora.org>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
 <1468867177-15007-2-git-send-email-okaya@codeaurora.org>
 <20160719103755.GC27022@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160719103755.GC27022@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 7/19/2016 6:37 AM, Mark Rutland wrote:
>>  Required properties:
>> > -- compatible: must contain "qcom,hidma-1.0"
>> > +- compatible: must contain "qcom,hidma-1.0" for initial HW or "qcom,hidma-1.1"
>> > +for MSI capable HW.
> Don't we need properties to describe the MSI details (e.g. sideband data
> like DeviceID)?
> 
> Thanks,
> Mark.
> 

You are right. I forgot to copy those.

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
