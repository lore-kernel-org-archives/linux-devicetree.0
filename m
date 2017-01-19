From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] Documentation: usb: fix wrong documentation paths
Date: Thu, 19 Jan 2017 07:11:02 -0600
Message-ID: <20170119131102.lzieqp3dsew3w6at@rob-hp-laptop>
References: <20170115121428.3255-1-yegorslists@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170115121428.3255-1-yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 15, 2017 at 01:14:28PM +0100, Yegor Yefremov wrote:
> Fixes wrong spelled "pinctrl-bindings.txt" and "qcom-dwc3-usb-phy.txt"
> file names as also wrong specified "mt8173-mtu3.txt" file name.
> 
> Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
> Changes:
> 	v1 -> v2: add changelog text (Greg Kroah-Hartman)
> 
>  Documentation/devicetree/bindings/usb/dwc3-st.txt     | 4 ++--
>  Documentation/devicetree/bindings/usb/ehci-st.txt     | 2 +-
>  Documentation/devicetree/bindings/usb/mt8173-mtu3.txt | 2 +-
>  Documentation/devicetree/bindings/usb/mt8173-xhci.txt | 4 ++--
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt   | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
