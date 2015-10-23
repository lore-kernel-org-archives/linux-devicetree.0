From: "Singh, Brijeshkumar" <Brijeshkumar.Singh@amd.com>
Subject: RE: [PATCH v2] EDAC: Add ARM64 EDAC
Date: Fri, 23 Oct 2015 03:07:35 +0000
Message-ID: <D506FF644BBE48498B87295D58C770F82D632096@satlexdag03.amd.com>
References: <56299292.5040408@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56299292.5040408@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stepan Moskovchenko <stepanm@codeaurora.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "guohanjun@huawei.com" <guohanjun@huawei.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Steve,

Thanks for pointing the link, I have not seen that driver before; I was mainly looking at driver/edac/xgene_edac.c and some other arm edac drivers.  My first attempt was to do AMD specific edac driver to log correctable L1/L2 error but based on feedback I worked on v2 generic driver which now looks very similar to your driver, are you planning to upstream your driver ? I can work with you to verify it on my current hardware setup. It seems your driver also handles single-bit and double-bit error which I have no way to test in my current hardware setup. On Seattle platform most of error handling is done through firmware APEI except correctable L1/L2.  Let me know your thoughts. 

-Brijesh
________________________________________
From: Stepan Moskovchenko [stepanm@codeaurora.org]
Sent: Thursday, October 22, 2015 8:51 PM
To: Singh, Brijeshkumar
Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com; ijc+devicetree@hellion.org.uk; galak@codeaurora.org; dougthompson@xmission.com; bp@alien8.de; mchehab@osg.samsung.com; devicetree@vger.kernel.org; guohanjun@huawei.com; andre.przywara@arm.com; arnd@arndb.de; linux-kernel@vger.kernel.org; linux-edac@vger.kernel.org
Subject: Re: [PATCH v2] EDAC: Add ARM64 EDAC

 >>> +++ b/drivers/edac/cortex_arm64_edac.c
 >>> @@ -0,0 +1,457 @@
 >>> +/*
 >>> + * Cortex ARM64 EDAC
 >>> + *
 >>> + * Copyright (c) 2015, Advanced Micro Devices
 >>> + * Author: Brijesh Singh <brijeshkumar.singh@amd.com>
 >>> + *

>Hi Brijesh,

>Your ARM64 EDAC driver seems rather similar to the existing driver that
>is linked below. If you have indeed based your driver on this one, can
>you please provide the appropriate attribution?

>https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.14/tree/drivers/edac/cortex_arm64_edac.c?h=LA.HB.1.1.1_rb1.10
