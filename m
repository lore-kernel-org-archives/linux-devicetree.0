From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Tue, 5 Nov 2013 08:46:30 +0100
Message-ID: <20131105074630.GB24559@pengutronix.de>
References: <1383575773-7296-1-git-send-email-panto@antoniou-consulting.com>
 <1383599845.10624.3.camel@linux-builds1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383599845.10624.3.camel@linux-builds1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 04, 2013 at 03:17:25PM -0600, Dinh Nguyen wrote:
> On Mon, 2013-11-04 at 16:36 +0200, Pantelis Antoniou wrote:
> > Enable the generation of symbol & fixup information for
> > usage with dynamic DT loading.
> > 
> > Passing the -@ option generates a __symbols__ node at the
> > root node of the resulting blob for any node labels used.
> > 
> > When using the /plugin/ tag all unresolved label references
> > be tracked in the __fixups__ node, while all local phandle
> > references will the tracked in the __local_fixups__ node.
> > 
> > This is sufficient to implement a dynamic DT object loader.
> > 
> > Changes since v1:
> > 
> > * Forward ported to 1.4 version
> > * Added manual entries for the -@ option
> > 
> > Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> > ---
> 
> Can I ask what repo/branch this is based on? It did not apply cleanly
> for me on 1.4.

Try harder ;)

The patch applies cleanly on v1.4.0 here.

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
