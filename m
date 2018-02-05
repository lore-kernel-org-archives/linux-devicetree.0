From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 08/15] usb: dwc3: Make TX/RX threshold configurable
Date: Mon, 5 Feb 2018 00:08:51 -0600
Message-ID: <20180205060851.5j7bsuq2cmsarcpg@rob-hp-laptop>
References: <cover.1517428812.git.thinhn@synopsys.com>
 <c42923b000093b7fc77a27e64d51b60fb28d3312.1517428812.git.thinhn@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c42923b000093b7fc77a27e64d51b60fb28d3312.1517428812.git.thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 01:16:38PM -0800, Thinh Nguyen wrote:
> DWC_usb31 periodic transfer at 48K+ bytes per interval may need
> modification to the TX/RX packet threshold to achieve optimal result.
> Add properties to make it configurable.
> 
> By default, periodic ESS TX and RX threshold are not enabled. To enable
> TX or RX threshold (host mode only), both packet threshold count and max
> burst size properties must be set to a valid non-zero value 1-16.
> 
> DWC_usb31 programming guide section 1.2.3 and 1.2.4.
> 
> Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
