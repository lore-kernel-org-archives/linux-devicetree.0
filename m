From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 10/10] dmaengine: qcom_hidma: add MSI support for
 interrupts
Date: Thu, 4 Aug 2016 09:59:43 -0400
Message-ID: <497ddb6c-0233-657f-72c6-b844b798ff11@codeaurora.org>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
 <1468867177-15007-11-git-send-email-okaya@codeaurora.org>
 <20160724064256.GA9681@localhost>
 <e6560c8b-e18e-9e32-5b51-c1c12d8551ce@codeaurora.org>
 <20160804124641.GE9681@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160804124641.GE9681@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "timur@codeaurora.org" <timur@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cov@codeaurora.org" <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, "eric.auger@linaro.org" <eric.auger@linaro.org>, "agross@codeaurora.org" <agross@codeaurora.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Williams, Dan J" <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/4/2016 8:46 AM, Vinod Koul wrote:
>> > Yes, I do have a new device ID for platforms with MSI capability. 
>> > 
>> > Which new binding are you referring to?
> If you have "QCOM8062" why do you need DT to tell hidma-1.1 ?

Unfortunately, DT cannot do a binding with the ACPI names. Similarly, ACPI
cannot do a binding with the DT name. 

The structure of binding name is also subject to different kind of rules
for DT and ACPI.

This driver supports both device tree and ACPI. That's why, two different
names are required.

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
