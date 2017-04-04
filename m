From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC PATCH 4/5] dt-bindings: soc/fsl: Update reserved memory
 binding for QBMan
Date: Mon, 03 Apr 2017 19:32:33 -0500
Message-ID: <1491265953.2944.78.camel@buserror.net>
References: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com>
         <1490822037-6752-5-git-send-email-roy.pledge@nxp.com>
         <20170403154229.mf63zeiwv5naxyrr@rob-hp-laptop>
         <VI1PR04MB32166AA6361CD6F24DBC3AAF86080@VI1PR04MB3216.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <VI1PR04MB32166AA6361CD6F24DBC3AAF86080-mr6QIVyDiCHPlBEOArXH089NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Madalin-Cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-04-03 at 19:49 +0000, Roy Pledge wrote:
> On 4/3/2017 11:42 AM, Rob Herring wrote:
> > 
> > On Wed, Mar 29, 2017 at 05:13:56PM -0400, Roy Pledge wrote:
> > > 
> > > Updates the QMan and BMan device tree bindings for reserved memory
> > > nodes. This makes the reserved memory allocation compatiable with
> > s/compatiable/compatible/
> > 
> > > 
> > > the shared-dma-pool usage.
> > This change is not backwards compatible. Please state that and explain 
> > why that is okay. If PPC needs to not change, then the old strings and 
> > properties should remain, but deprecated.
> I think I can make the old device trees compatible since the
> "compatible" string changed without too much effort or ifdefery in the
> code.  However I would like to eventually see all PPC users move to the
> new mode as I do believe it is more in alignment with the spirit of the
> reserved-memory framework that is in the kernel.

How much benefit is there to changing PPC if you have to retain the old method
anyway for compatibility?  Whereas if you don't convert, you retain test
coverage for the old device trees, and don't have to worry about
the memblock_end_of_DRAM() questions.

>   Do I need to mention the old mode in the binding.txt file? 

Yes.

>  I'm trying to keep things clean
> so someone reading the binding doesn't get a headache and trying to
> preserve my own sanity as we move forward with adding new features to
> this driver.

If they're sufficiently different then just describe the new and old nodes
separately rather than putting a bunch of if/else clauses in there.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
