From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 5/5] usb: dwc3: rockchip: add devicetree bindings
 documentation
Date: Mon, 11 Jul 2016 10:13:32 -0500
Message-ID: <20160711151332.GA28672@rob-hp-laptop>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
 <1467860324-15341-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467860324-15341-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 10:58:44AM +0800, William Wu wrote:
> This patch adds the devicetree documentation required for Rockchip
> USB3.0 core wrapper consisting of USB3.0 IP from Synopsys.
> 
> It supports DRD mode, and could operate in device mode (SS, HS, FS)
> and host mode (SS, HS, FS, LS).
> 
> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v6:
> - rename bus_clk, and add usbdrd3_1 node as an example (Heiko)
> 
> Changes in v5:
> - rename clock-names, and remove unnecessary clocks (Heiko)
> 
> Changes in v4:
> - modify commit log, and add phy documentation location (Sergei)
> 
> Changes in v3:
> - add dwc3 address (balbi)
> 
> Changes in v2:
> - add rockchip,dwc3.txt to Documentation/devicetree/bindings/ (balbi, Brian)
> 
>  .../devicetree/bindings/usb/rockchip,dwc3.txt      | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
