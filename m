From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] usb: dwc3: add disable u2mac linestate check quirk
Date: Fri, 28 Apr 2017 08:41:20 -0500
Message-ID: <20170428134120.deqjesvinuoskem7@rob-hp-laptop>
References: <1492603898-25070-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1492603898-25070-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 19, 2017 at 08:11:38PM +0800, William Wu wrote:
> This patch adds a quirk to disable USB 2.0 MAC linestate check
> during HS transmit. Refer the dwc3 databook, we can use it for
> some special platforms if the linestate not reflect the expected
> line state(J) during transmission.
> 
> When use this quirk, the controller implements a fixed 40-bit
> TxEndDelay after the packet is given on UTMI and ignores the
> linestate during the transmit of a token (during token-to-token
> and token-to-data IPGAP).
> 
> On some rockchip platforms (e.g. rk3399), it requires to disable
> the u2mac linestate check to decrease the SSPLIT token to SETUP
> token inter-packet delay from 566ns to 466ns, and fix the issue
> that FS/LS devices not recognized if inserted through USB 3.0 HUB.
> 
> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v3:
> - change quirk name
> - only read and write GUCTL1 if dwc3 version >= 2.50a
> 
> Changes in v2:
> - fix coding style
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt |  2 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 

>  drivers/usb/dwc3/core.c                        | 20 ++++++++++++++------
>  drivers/usb/dwc3/core.h                        |  4 ++++
>  3 files changed, 20 insertions(+), 6 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
