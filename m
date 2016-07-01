From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 2/5] usb: dwc3: add
 dis_u2_freeclk_exists_quirk[Involving
 remittance information, please pay attention to the safety of property]
Date: Fri, 01 Jul 2016 10:49:19 +0800
Message-ID: <5775DA2F.8080609@rock-chips.com>
References: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com>
 <1467285176-25222-3-git-send-email-william.wu@rock-chips.com>
 <20160701023237.GA18701@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160701023237.GA18701@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Rob,

On 07/01/2016 10:32 AM, Rob Herring wrote:
> On Thu, Jun 30, 2016 at 07:12:53PM +0800, William Wu wrote:
>> Add a quirk to clear the GUSB2PHYCFG.U2_FREECLK_EXISTS bit,
>> which specifies whether the USB2.0 PHY provides a free-running
>> PHY clock, which is active when the clock control input is active.
>>
>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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
>>   Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>>   drivers/usb/dwc3/core.c                        | 5 +++++
>>   drivers/usb/dwc3/core.h                        | 5 +++++
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 7d7ce08..1ada121 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -39,6 +39,9 @@ Optional properties:
>>   			disabling the suspend signal to the PHY.
>>    - snps,dis_rxdet_inp3_quirk: when set core will disable receiver detection
>>   			in PHY P3 power state.
>> + - snps,dis_u2_freeclk_exists_quirk: when set, clear the u2_freeclk_exists
> Use '-', not '_'.
OK, I'll fix them in next patch.
Thanks very much for your help.
>
>> +			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
>> +			a free-running PHY clock.
>>    - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
>>   			utmi_l1_suspend_n, false when asserts utmi_sleep_n
>>    - snps,hird-threshold: HIRD threshold
>
>
