From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v4 2/7] phy: qcom-qmp: Enable pipe_clk before PHY
 initialization
Date: Fri, 13 Apr 2018 12:30:09 +0530
Message-ID: <e978fa34-d9a6-281c-6620-c9d10c7b54ae@codeaurora.org>
References: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
 <1522321466-21755-3-git-send-email-mgautam@codeaurora.org>
 <CAD=FV=XtviSYq=2w=Ld1xq5U2VPy=u=q6a3+4qd2zVGB+f9P8A@mail.gmail.com>
 <CAD=FV=WGEKy98De_zH9rp+g-tE2YuVK2vRxLJrjeeSx=ijBAww@mail.gmail.com>
 <19c66b02-4f8e-902a-9397-21e7690db7b8@codeaurora.org>
 <CAD=FV=XqH69_LXcCyTS1nF5fHpen=PnRxd-WTz=y3dKvMsRtuw@mail.gmail.com>
 <152338515540.180276.4273344163431724770@swboyd.mtv.corp.google.com>
 <f8f47dc2-74ab-96c6-b3bd-a476bd19514d@codeaurora.org>
 <152356552631.37499.9860530043266211290@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152356552631.37499.9860530043266211290@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Doug Anderson <dianders@chromium.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, linux-arm-msm@vger.kernel.org, Varadarajan Narayanan <varada@codeaurora.org>, Wei Yongjun <weiyongjun1@huawei.com>, Fengguang Wu <fengguang.wu@intel.com>
List-Id: devicetree@vger.kernel.org

Hi,


On 4/13/2018 2:08 AM, Stephen Boyd wrote:
> Quoting Manu Gautam (2018-04-11 08:37:38)
>>> I ask because it may be easier to never expose these clks in Linux, hit
>>> the enable bits in the branches during clk driver probe, and then act
>>> like they never exist because we don't really use them.
>> This sounds better idea. Let me check if I can get a patch for same in msm8996
>> and sdm845 clock drivers.
>>
> Ok! Presumably the PHY has a way to tell if it failed to turn on right?
> Put another way, I'm hoping these branch bits aren't there to help us
> debug and figure out when the PHY PLL fails to lock.

Yes, PHY has a PCS_STATUS3 register that indicates whether pipe_clk got enabled or
not.


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
