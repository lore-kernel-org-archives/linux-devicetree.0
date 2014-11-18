From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/5] regulator: s2mps11: Add support S2MPS13 regulator
 device
Date: Tue, 18 Nov 2014 17:41:15 +0900
Message-ID: <546B062B.3060406@samsung.com>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-3-git-send-email-cw00.choi@samsung.com>
 <20141118081757.GS24004@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20141118081757.GS24004@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: broonie@kernel.org, mturquette@linaro.org, a.zummo@towertech.it, lgirdwood@gmail.com, sbkim73@samsung.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Lee,

On 11/18/2014 05:17 PM, Lee Jones wrote:
> On Mon, 17 Nov 2014, Chanwoo Choi wrote:
> 
>> This patch adds S2MPS13 regulator device to existing S2MPS11 device driver.
>> The S2MPS13 has just different number of regulators from S2MPS14.
>> The S2MPS13 regulator device includes LDO[1-40] and BUCK[1-10].
>>
>> Cc: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>>  drivers/mfd/sec-core.c              |  13 +++
>>  drivers/regulator/Kconfig           |  10 +-
>>  drivers/regulator/s2mps11.c         | 102 +++++++++++++++++++-
>>  include/linux/mfd/samsung/core.h    |   1 +
>>  include/linux/mfd/samsung/s2mps13.h | 186 ++++++++++++++++++++++++++++++++++++
> 
> For my reference:
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> I does this set need to go in all at once, or can it be broken up?

If possible, I think that this patchset would be better to apply it on same git-repo at once.

Best Regards,
Chanwoo Choi

> 
>>  5 files changed, 304 insertions(+), 8 deletions(-)
>>  create mode 100644 include/linux/mfd/samsung/s2mps13.h
> 
> [...]
> 
