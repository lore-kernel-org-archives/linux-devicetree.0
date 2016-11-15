From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 05/30] usb: dwc2: Add bindings to disable gadget DMA
 modes
Date: Mon, 14 Nov 2016 19:11:10 -0600
Message-ID: <20161115011110.b32eljlv42mhbocr@rob-hp-laptop>
References: <cover.1478748145.git.johnyoun@synopsys.com>
 <16733114b9252b8163c11cc7ca95b2b152b66e0e.1478748145.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <16733114b9252b8163c11cc7ca95b2b152b66e0e.1478748145.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 09, 2016 at 07:27:50PM -0800, John Youn wrote:
> Now that the gadget driver automatically detects DMA modes, we need to
> provide a way to disable them. Certain platforms may still have issues
> with DMA and require it to be disabled. It is also needed for IP
> validation purposes.

I don't think IP validation is reason enough for these properties. If 
there is IP that is broken and lies about it, then yes we should have 
these.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
