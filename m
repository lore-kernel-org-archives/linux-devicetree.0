From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RESEND PATCH v2 0/2] add multiple clock handling for dwc2 driver
Date: Wed, 22 Feb 2017 09:29:43 +0800
Message-ID: <706482a7-7d07-a902-9b47-1a791f9a8185@rock-chips.com>
References: <1486695987-7280-1-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486695987-7280-1-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi John and Greg,

Friendly ping... :-)

On 2017/2/10 11:06, Frank Wang wrote:
> Resend this series to involve device tree maintainer and add 'Reviewed-by' tag for driver.
>
> The Current default dwc2 just handle one clock named otg, however, it may have
> two or more clock need to manage for some new SoCs(such as RK3328), so this
> adds change clk to clk's array of dwc2_hsotg to handle more clocks operation.
>
> Changes in v2:
>   - amend dwc2 clocks property in DT.
>   - change DWC2_MAX_CLKS to 5 and amend commit message.
>
> Frank Wang (2):
>    Documentation: dt: dwc2: amend clocks property
>    usb: dwc2: add multiple clocks handling
>
>   Documentation/devicetree/bindings/usb/dwc2.txt | 13 +++++++--
>   drivers/usb/dwc2/core.h                        |  5 +++-
>   drivers/usb/dwc2/platform.c                    | 39 +++++++++++++++++---------
>   3 files changed, 40 insertions(+), 17 deletions(-)
>

BR.
Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
