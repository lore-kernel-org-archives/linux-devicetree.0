From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: Add binding for Ilitek ILI9225
 display panels
Date: Fri, 10 Nov 2017 15:31:45 -0600
Message-ID: <20171110213145.6gt4odpd5yctxfry@rob-hp-laptop>
References: <1510113136-6788-1-git-send-email-david@lechnology.com>
 <1510113136-6788-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510113136-6788-2-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 07, 2017 at 09:52:15PM -0600, David Lechner wrote:
> This adds a new binding for display panels that use an Ilitek ILI9225
> controller.
> 
> The "generic,2.2in-176x220-ili9225-tft" device listed has no identification
> markings whatsoever and an hour of googling turned up nothing, hence the use
> of "generic".

Just use ilitek then. I would do "ilitek,ili9225-2.2in-176x220" and 
hopefully there aren't others that size. I'm guessing you would have 
found them if so.

Otherwise, looks fine.

> An example of this nameless device can be found at:
> https://github.com/Nkawu/TFT_22_ILI9225
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>  .../devicetree/bindings/display/ilitek,ili9225.txt | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9225.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
