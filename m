From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: chosen: Document linux,initrd-{start,end}
Date: Fri, 15 Dec 2017 15:01:47 -0600
Message-ID: <20171215210147.w3xqs3di2vbbvv5p@rob-hp-laptop>
References: <20171209153305.11012-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171209153305.11012-1-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 09, 2017 at 04:33:02PM +0100, Jonathan Neuschäfer wrote:
> These properties have been in use for a very long time (at least since
> 2005), but were never documented in chosen.txt.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/chosen.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Applied.

I'm inclined to say to document these in the DT spec, but I'm assuming 
there was some reason why they weren't put into the spec (ePAPR at the 
time) originally.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
