From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Tue, 5 Nov 2013 09:02:12 +0100
Message-ID: <20131105080212.GD24559@pengutronix.de>
References: <1383575773-7296-1-git-send-email-panto@antoniou-consulting.com>
 <20131104145342.GW24559@pengutronix.de>
 <53AA440E-7F33-4AC1-9323-7D109D4B5852@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53AA440E-7F33-4AC1-9323-7D109D4B5852-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 04, 2013 at 04:58:38PM +0200, Pantelis Antoniou wrote:
> Hi Sascha,
> 
> On Nov 4, 2013, at 4:53 PM, Sascha Hauer wrote:
> 
> > Hi Pantelis,
> > 
> > Thank you for working on this again. I would really appreciate seeing
> > this upstream.
> > 
> 
> Don't mention it. Let's try to make it happen then.
> 
> > On Mon, Nov 04, 2013 at 04:36:13PM +0200, Pantelis Antoniou wrote:
> >> +Notice that all the nodes that had a label have been recorded, and that
> >> +phandles have been generated for them.
> >> +
> >> +This blob can be used to boot the board normally, the __symbols__ node will
> >> +be safely ignored both by the bootloader and the kernel (the only loss will
> >> +be a few bytes of memory and disk space).
> >> +
> >> +3.b) The Device Tree fragments must be compiled with the same option but they
> >> +must also have a tag (/plugin/) that allows undefined references to labels
> >> +that are not present at compilation time to be recorded so that the runtime
> >> +loader can fix them.
> >> +
> >> +So the bar peripheral's DTS format would be of the form:
> >> +
> >> +/plugin/;	/* allow undefined label references and record them */
> >> +/ {
> >> +	....	/* various properties for loader use; i.e. part id etc. */
> >> +	fragment@0 {
> >> +		target = <&ocp>;
> >> +		__overlay__ {
> >> +			/* bar peripheral */
> >> +			bar {
> >> +				compatible = "corp,bar";
> >> +				... /* various properties and child nodes */
> >> +			}
> >> +		};
> >> +	};
> >> +};
> > 
> > When last looking at this patch I created the attached follow up. What
> > I didn't like about this patch is that we currently have to write dts
> > files explicitely as overlays. With the attached patch the above could
> > be written as:
> > 
> > &ocp: {
> > 	compatible = "corp,bar";
> > };
> > 
> > This is easier to write and more important a dts snippet could be either
> > compiled into a dtb or used as an overlay.
> > 
> 
> I see your point.
> 
> In my use case I always needed some out-of-band properties for the loader/manager 
> to track. Let me test your and see if it doesn't break my use-cases.

You mean for unloading an overlay afterwards?

> 
> If it's fine, then I have no objections in including it.

Thanks.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
