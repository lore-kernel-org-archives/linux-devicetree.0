From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC usb-next v8 1/3] dt-bindings: usb: add the documentation
 for USB HCDs
Date: Tue, 30 Jan 2018 11:12:49 -0600
Message-ID: <20180130171249.d2svzedtnxc4pxyp@rob-hp-laptop>
References: <20180125000053.9387-1-martin.blumenstingl@googlemail.com>
 <20180125000053.9387-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180125000053.9387-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 25, 2018 at 01:00:51AM +0100, Martin Blumenstingl wrote:
> A USB HCD may have several PHYs which need to be configured before the
> the HCD starts working.
> This adds the documentation for such a USB HCD as well as a reference to
> the new "usb-hcd.txt" from all bindings that implement a USB HCD which
> support one USB PHY per port.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 5 ++++-
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.txt     | 5 ++++-
>  Documentation/devicetree/bindings/usb/usb-ehci.txt          | 6 ++++--
>  Documentation/devicetree/bindings/usb/usb-hcd.txt           | 9 +++++++++
>  Documentation/devicetree/bindings/usb/usb-ohci.txt          | 6 ++++--
>  Documentation/devicetree/bindings/usb/usb-uhci.txt          | 3 +++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt          | 5 +++++
>  7 files changed, 33 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-hcd.txt

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
