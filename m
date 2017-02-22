From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH v2 0/2] add multiple clock handling for dwc2 driver
Date: Wed, 22 Feb 2017 20:19:29 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE300772909021B42BA1C@US01WEMBX2.internal.synopsys.com>
References: <1486695987-7280-1-git-send-email-frank.wang@rock-chips.com>
 <706482a7-7d07-a902-9b47-1a791f9a8185@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2/21/2017 5:30 PM, Frank Wang wrote:
> Hi John and Greg,
>
> Friendly ping... :-)
>

Hi Frank,

We'll take a look at this and get back to you soon.

Regards,
John


> On 2017/2/10 11:06, Frank Wang wrote:
>> Resend this series to involve device tree maintainer and add 'Reviewed-by' tag for driver.
>>
>> The Current default dwc2 just handle one clock named otg, however, it may have
>> two or more clock need to manage for some new SoCs(such as RK3328), so this
>> adds change clk to clk's array of dwc2_hsotg to handle more clocks operation.
>>
>> Changes in v2:
>>   - amend dwc2 clocks property in DT.
>>   - change DWC2_MAX_CLKS to 5 and amend commit message.
>>
>> Frank Wang (2):
>>    Documentation: dt: dwc2: amend clocks property
>>    usb: dwc2: add multiple clocks handling
>>
>>   Documentation/devicetree/bindings/usb/dwc2.txt | 13 +++++++--
>>   drivers/usb/dwc2/core.h                        |  5 +++-
>>   drivers/usb/dwc2/platform.c                    | 39 +++++++++++++++++---------
>>   3 files changed, 40 insertions(+), 17 deletions(-)
>>
>
> BR.
> Frank
>
>
