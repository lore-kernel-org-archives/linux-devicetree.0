From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC 0/1] Platform driver support for 'amd5536udc' driver
Date: Thu, 05 Jan 2017 23:03:08 +0100
Message-ID: <1861880.7pouM4E6RB@wuerfel>
References: <1483604597-26160-1-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483604597-26160-1-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday, January 5, 2017 1:53:16 PM CET Raviteja Garimella wrote:
> The UDC is based on Synopsys Designware core USB (2.0) Device controller
> IP.
...
> This is a request for comments from maintainers/others regarding approach
> on whether to have 2 different drivers (one each for AMD and Broadcom)
> with a common library (3 files in total), or have a single driver like
> it's done in this patch and have the driver filename changed to some
> common name based on ther underlying IP, like snps_udc.c.

I have not looked at the code at all, so sorry for my ignorance, but
isn't the IP block you describe the one that drivers/usb/dwc2/ is for?
Could you add support for the Broadcom hardware there instead?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
