From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Thu, 20 Dec 2018 15:18:15 +0200
Message-ID: <87imzo72w8.fsf@purkki.adurom.net>
References: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
        <87d0r55ews.fsf@codeaurora.org>
        <6e831363962be4e28d7551e360ed4d46@codeaurora.org>
        <874lcg55at.fsf@codeaurora.org>
        <9f8bbfaa232c02bb33594207fa1f8821@codeaurora.org>
        <87y38ktnnm.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y38ktnnm.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
        of "Thu, 20 Dec 2018 13:58:53 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Govind Singh <govinds@codeaurora.org>
Cc: briannorris@chromium.org, andy.gross@linaro.org, ath10k@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-wireless@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Govind Singh <govinds@codeaurora.org> writes:
>
>> Hi Kalle,
>>
>> On 2018-11-17 16:39, Kalle Valo wrote:
>>> Govind Singh <govinds@codeaurora.org> writes:
>>>
>>>> On 2018-11-16 18:59, Kalle Valo wrote:
>>>>>
>>>>> Via which tree are these patches going? That's not clear for me.
>>>>
>>>> I guess sdm845 dtsi change should be going to
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git.
>>>> I need to send v5 to address one comment from Brian.
>>>
>>> Ok, I'll then drop these from my queue.
>>
>> Can you pls apply below changes to ath10k tree, i will send sdm845
>> dtsi change as separate patch after rebase.
>>
>>>>>>   dt: bindings: add missing dt properties for WCN3990 wifi node
>>>>>>   dt: bindings: add bindings for wifi iommu node
>
> Ok, these two are back in my queue:
>
> https://patchwork.kernel.org/patch/10668237/
>
> https://patchwork.kernel.org/patch/10668245/
>
> I'll just modify the titles to use ath10k prefix to make it more clear
> these are for ath10k:
>
>    dt: bindings: ath10k: .....

There were conflicts with this commit:

2b741a8aaa34 dt: bindings: add bindings for msa memory region

I fixed them in the pending branch, please double check carefully:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=5bb88d4d49783c75ac083e4ea19b7527bc115857

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=a6d53e207670eacd72a74277658bac1ab346fabd

-- 
Kalle Valo
