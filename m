From: William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v5 4/5] usb: dwc3: add dis_del_phy_power_chg_quirk[Involving
 remittance information, please pay attention to the safety of property]
Date: Fri, 01 Jul 2016 10:51:23 +0800
Message-ID: <5775DAAB.4020205@rock-chips.com>
References: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com> <1467285176-25222-5-git-send-email-william.wu@rock-chips.com> <20160701023825.GA27978@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160701023825.GA27978@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Rob,

On 07/01/2016 10:38 AM, Rob Herring wrote:
> On Thu, Jun 30, 2016 at 07:12:55PM +0800, William Wu wrote:
>> Add a quirk to clear the GUSB3PIPECTL.DELAYP1TRANS bit,
>> which specifies whether disable delay PHY power change
>> from P0 to P1/P2/P3 when link state changing from U0
>> to U1/U2/U3 respectively.
>>
>> Signed-off-by: William Wu <william.wu@rock-chips.com>
>> ---
>> Changes in v5:
>> - None
>>
>> Changes in v4:
>> - rebase on top of balbi testing/next, remove pdata (balbi)
>>
>> Changes in v3:
>> - None
>>
>> Changes in v2:
>> - None
>>
>>   Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>>   drivers/usb/dwc3/core.c                        | 5 +++++
>>   drivers/usb/dwc3/core.h                        | 3 +++
>>   3 files changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 34d13a5..bd5bef0 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -42,6 +42,8 @@ Optional properties:
>>    - snps,dis_u2_freeclk_exists_quirk: when set, clear the u2_freeclk_exists
>>   			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
>>   			a free-running PHY clock.
>> + - snps,dis_del_phy_power_chg_quirk: when set core will change PHY power
>> +			from P0 to P1/P2/P3 without delay.
> Use '-', not '_'.
OK, I'll fix it in next patch.
Thanks~:-)

Best regards,
         William Wu
>
>>    - snps,phyif_utmi_quirk: when set core will set phyif UTMI+ interface.
>>    - snps,phyif_utmi: the value to configure the core to support a UTMI+ PHY
>>   			with an 8- or 16-bit interface. Value 0 select 8-bit
>
>
>
