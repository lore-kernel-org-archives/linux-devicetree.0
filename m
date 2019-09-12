From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH 1/2] venus: use on-chip interconnect API
Date: Thu, 12 Sep 2019 18:11:55 +0300
Message-ID: <345e7450-b3af-92c5-4e83-bccaf0a98a0b@linaro.org>
References: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
 <20190814084701.25455-2-stanimir.varbanov@linaro.org>
 <cc85f55c-3d21-c3b2-6848-e48513263e39@linaro.org>
 <20190904042203.GC3081@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904042203.GC3081@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, Aniket Masule <amasule@codeaurora.org>, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 9/4/19 07:22, Bjorn Andersson wrote:
> On Tue 20 Aug 02:34 PDT 2019, Georgi Djakov wrote:
> 
>> Hi Stan,
>>
>> On 8/14/19 11:47, Stanimir Varbanov wrote:
>>> This aims to add a requests for bandwidth scaling depending
>>> on the resolution and framerate (macroblocks per second). The
>>> exact value ff the requested bandwidth is get from a
>>
>> s/ff/of/
>>
>>> pre-calculated tables for encoder and decoder.
>>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
>>>  drivers/media/platform/qcom/venus/core.h    | 14 +++++
>>>  drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
>>>  3 files changed, 114 insertions(+), 1 deletion(-)
>>
>> It looks like venus can be built-in, so how about the case when venus is
>> built-in and the interconnect provider is a module? Maybe add a dependency in
>> Kconfig to depend on INTERCONNECT || !INTERCONNECT?
>>
> 
> I've been struggling down this road for remoteproc et al for a long
> time, I strongly suggest that you make the INTERCONNECT config bool, to
> ensure that we don't see this problem for every client.

Thanks for the comment. Well, i was expecting that we will have to make it bool
one day. Viresh actually already sent a patch [1]. Maybe you can add an Ack?

> 
> The interconnect framework should hide the fact that the provider is
> module.
> 

Correct.

> 
> But with this in place is there actually a dependency? Won't the include
> file provide stubs in the case of !INTERCONNECT?

There are stubs, so we are fine.

Thanks,
Georgi

[1]
https://lore.kernel.org/linux-pm/b789cce388dd1f2906492f307dea6780c398bc6a.1567065991.git.viresh.kumar@linaro.org/
