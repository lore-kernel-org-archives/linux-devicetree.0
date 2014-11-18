From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 4/5] rtc: s5m: Add the support for S2MPS13 RTC
Date: Tue, 18 Nov 2014 09:55:08 +0900
Message-ID: <546A98EC.8090009@samsung.com>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-5-git-send-email-cw00.choi@samsung.com>
 <012401d002c8$04efe610$0ecfb230$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <012401d002c8$04efe610$0ecfb230$@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: lee.jones@linaro.org, broonie@kernel.org, mturquette@linaro.org, a.zummo@towertech.it, lgirdwood@gmail.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Sangbeom,

On 11/18/2014 09:38 AM, Sangbeom Kim wrote:
> Hi,
> On Monday, November 17, 2014 9:43 AM, Chanwoo Choi wrote:
>> This patch adds only the compatible string for S2MPS13 clock which is identical
>> with S2MPS14 clock driver.
> 
> What's the relation of S2MPS14 RTC and clock driver?

I checked the difference between S2MPS13 and S2MPS14.
But, all register (RTC) of both PMICs was the same completely.
So, I just add S2MPS13 type to use existing S2MPS14 RTC feature for S2MPS13 RTC.

Best Regards,
Chanwoo Choi
