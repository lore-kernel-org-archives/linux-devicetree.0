From: Stepan Moskovchenko <stepanm@codeaurora.org>
Subject: Re: [PATCH v2] EDAC: Add ARM64 EDAC
Date: Thu, 22 Oct 2015 18:51:14 -0700
Message-ID: <56299292.5040408@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: brijeshkumar.singh@amd.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dougthompson@xmission.com, bp@alien8.de, mchehab@osg.samsung.com, devicetree@vger.kernel.org, guohanjun@huawei.com, andre.przywara@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

 >>> +++ b/drivers/edac/cortex_arm64_edac.c
 >>> @@ -0,0 +1,457 @@
 >>> +/*
 >>> + * Cortex ARM64 EDAC
 >>> + *
 >>> + * Copyright (c) 2015, Advanced Micro Devices
 >>> + * Author: Brijesh Singh <brijeshkumar.singh@amd.com>
 >>> + *

Hi Brijesh,

Your ARM64 EDAC driver seems rather similar to the existing driver that 
is linked below. If you have indeed based your driver on this one, can 
you please provide the appropriate attribution?

https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.14/tree/drivers/edac/cortex_arm64_edac.c?h=LA.HB.1.1.1_rb1.10

Thank you
Steve

-- 
  The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
  hosted by The Linux Foundation
