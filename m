From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Sat, 17 Nov 2018 13:09:30 +0200
Message-ID: <874lcg55at.fsf@codeaurora.org>
References: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
        <87d0r55ews.fsf@codeaurora.org>
        <6e831363962be4e28d7551e360ed4d46@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6e831363962be4e28d7551e360ed4d46-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (Govind Singh's
        message of "Fri, 16 Nov 2018 21:36:57 +0530")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:

> On 2018-11-16 18:59, Kalle Valo wrote:
>> Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>>
>>> This series enables ath10k wifi driver support for WCN3990 target
>>> on sdm845 SOC. This series also updates the missing dt binding
>>> documentation
>>> and adds optional iommu property.
>>>
>>> Changes since v3:
>>>     Moved interrupt/reg/reg-name to required property.
>>>     Removed unused clocks.
>>>     Corrected interrupt no's.
>>>
>>> Changes since v2:
>>>     dropped [v2,4/4] dts: arm64/sdm845: Enable iommu for WCN3990
>>> wifi module
>>>     device node patch from the series as dependent patch is not yet
>>> merged.
>>>     Enabled status flag from sdm845-mtp.dts.
>>>
>>> Changes since v1:
>>>     Listed no of interrupts/clocks for each set of compatible.
>>>     Added missing 'wifi' label to sdm845.dtsi.
>>>
>>> Govind Singh (3):
>>>   dt: bindings: add missing dt properties for WCN3990 wifi node
>>>   dts: arm64/sdm845: Add WCN3990 WLAN module device node
>>>   dt: bindings: add bindings for wifi iommu node
>>>
>>>  .../bindings/net/wireless/qcom,ath10k.txt          | 62
>>> ++++++++++++++--------
>>>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  8 +++
>>>  arch/arm64/boot/dts/qcom/sdm845.dtsi               | 26 +++++++++
>>>  3 files changed, 74 insertions(+), 22 deletions(-)
>>
>> Via which tree are these patches going? That's not clear for me.
>
> I guess sdm845 dtsi change should be going to
> git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git.
> I need to send v5 to address one comment from Brian.

Ok, I'll then drop these from my queue.

-- 
Kalle Valo
