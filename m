From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 2/2] nvmem: Add Spreadtrum SC27XX efuse support
Date: Mon, 9 Jul 2018 18:30:35 +0800
Message-ID: <CAMz4kuKBxxJwbezu6RY23HBQG7jBCFPPVvb5nAkYnKZTT=r44w@mail.gmail.com>
References: <a469ed55cb7c43901eaa8881cdd2a8845616d987.1529908086.git.baolin.wang@linaro.org>
 <d49c27421b2166dc5d535fb448e6cc11475a2a79.1529908086.git.baolin.wang@linaro.org>
 <CAMz4kuLWAT0aXy=xNPaeBDdixZCxUoE+joWsLMXb6MrmRiBr1Q@mail.gmail.com> <068e3671-2624-7e16-7387-185e688cb6ed@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <068e3671-2624-7e16-7387-185e688cb6ed@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, freeman.liu@spreadtrum.com, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 9 July 2018 at 17:41, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
> On 09/07/18 10:26, Baolin Wang wrote:
>>
>> Hi Srinivas,
>>
>> On 25 June 2018 at 14:31, Baolin Wang<baolin.wang@linaro.org>  wrote:
>>>
>>> From: Freeman Liu<freeman.liu@spreadtrum.com>
>>>
>>> This patch add the efuse driver which is embeded in Spreadtrum SC27XX
>>> series PMICs. The sc27xx efuse contains 32 blocks and each block's
>>> data width is 16 bits.
>>>
>>> Signed-off-by: Freeman Liu<freeman.liu@spreadtrum.com>
>>> Signed-off-by: Baolin Wang<baolin.wang@linaro.org>
>>> ---
>>> Changes since v1:
>>>   - Fix one typo.
>>> ---
>>
>> Do you have any comments for this patch set? Thanks.
>
> Thanks for your patience!
>
> These patches look good!, Normally I tend to send nvmem patches to Greg K.H
> just before rc5! I will queue them by end of this week!

Thanks.

-- 
Baolin Wang
Best Regards
