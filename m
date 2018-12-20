From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Thu, 20 Dec 2018 13:58:53 +0200
Message-ID: <87y38ktnnm.fsf@kamboji.qca.qualcomm.com>
References: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
        <87d0r55ews.fsf@codeaurora.org>
        <6e831363962be4e28d7551e360ed4d46@codeaurora.org>
        <874lcg55at.fsf@codeaurora.org>
        <9f8bbfaa232c02bb33594207fa1f8821@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f8bbfaa232c02bb33594207fa1f8821@codeaurora.org> (Govind Singh's
        message of "Wed, 19 Dec 2018 21:11:25 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Govind Singh <govinds@codeaurora.org>
Cc: briannorris@chromium.org, andy.gross@linaro.org, ath10k@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-wireless@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Govind Singh <govinds@codeaurora.org> writes:

> Hi Kalle,
>
> On 2018-11-17 16:39, Kalle Valo wrote:
>> Govind Singh <govinds@codeaurora.org> writes:
>>
>>> On 2018-11-16 18:59, Kalle Valo wrote:
>>>> Govind Singh <govinds@codeaurora.org> writes:
>>>>
>>>>> This series enables ath10k wifi driver support for WCN3990 target
>>>>> on sdm845 SOC. This series also updates the missing dt binding
>>>>> documentation
>>>>> and adds optional iommu property.
>>>>>
>>>>> Changes since v3:
>>>>>     Moved interrupt/reg/reg-name to required property.
>>>>>     Removed unused clocks.
>>>>>     Corrected interrupt no's.
>>>>>
>>>>> Changes since v2:
>>>>>     dropped [v2,4/4] dts: arm64/sdm845: Enable iommu for WCN3990
>>>>> wifi module
>>>>>     device node patch from the series as dependent patch is not yet
>>>>> merged.
>>>>>     Enabled status flag from sdm845-mtp.dts.
>>>>>
>>>>> Changes since v1:
>>>>>     Listed no of interrupts/clocks for each set of compatible.
>>>>>     Added missing 'wifi' label to sdm845.dtsi.
>>>>>
>>>>> Govind Singh (3):
>>>>>   dt: bindings: add missing dt properties for WCN3990 wifi node
>>>>>   dts: arm64/sdm845: Add WCN3990 WLAN module device node
>>>>>   dt: bindings: add bindings for wifi iommu node
>>>>>
>>>>>  .../bindings/net/wireless/qcom,ath10k.txt          | 62
>>>>> ++++++++++++++--------
>>>>>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  8 +++
>>>>>  arch/arm64/boot/dts/qcom/sdm845.dtsi               | 26 +++++++++
>>>>>  3 files changed, 74 insertions(+), 22 deletions(-)
>>>>
>>>> Via which tree are these patches going? That's not clear for me.
>>>
>>> I guess sdm845 dtsi change should be going to
>>> git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git.
>>> I need to send v5 to address one comment from Brian.
>>
>> Ok, I'll then drop these from my queue.
>
> Can you pls apply below changes to ath10k tree, i will send sdm845
> dtsi change as separate patch after rebase.
>
>>>>>   dt: bindings: add missing dt properties for WCN3990 wifi node
>>>>>   dt: bindings: add bindings for wifi iommu node

Ok, these two are back in my queue:

https://patchwork.kernel.org/patch/10668237/

https://patchwork.kernel.org/patch/10668245/

I'll just modify the titles to use ath10k prefix to make it more clear
these are for ath10k:

   dt: bindings: ath10k: .....

-- 
Kalle Valo
