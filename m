From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v5] media: platform: Renesas IMR driver
Date: Wed, 03 May 2017 00:17:03 +0300
Message-ID: <2382097.9ZIG3XAO0j@avalon>
References: <20170309200818.786255823@cogentembedded.com> <CAMuHMdV5-aMx4KuqShm47XtORJK8rMKzw6FUs2Hjsxia+jPfxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdV5-aMx4KuqShm47XtORJK8rMKzw6FUs2Hjsxia+jPfxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Wednesday 22 Mar 2017 10:34:16 Geert Uytterhoeven wrote:
> On Thu, Mar 9, 2017 at 9:08 PM, Sergei Shtylyov wrote:
> > --- /dev/null
> > +++ media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt
> > @@ -0,0 +1,27 @@
> > +Renesas R-Car Image Renderer (Distortion Correction Engine)
> > +-----------------------------------------------------------
> > +
> > +The image renderer, or the distortion correction engine, is a drawing
> > processor
> > +with a simple instruction system capable of referencing video capture
> > data or
> > +data in an external memory as 2D texture data and performing texture
> > mapping
> > +and drawing with respect to any shape that is split into triangular
> > objects.
> > +
> > +Required properties:
> > +
> > +- compatible: "renesas,<soctype>-imr-lx4", "renesas,imr-lx4" as a
> > fallback for
> > +  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3
> > SoCs,
> > +  where the examples with <soctype> are:
> > +  - "renesas,r8a7795-imr-lx4" for R-Car H3,
> > +  - "renesas,r8a7796-imr-lx4" for R-Car M3-W.
> 
> Laurent: what do you think about the need for SoC-specific compatible
> values for the various IM* blocks?

There's no documented IP core version register, but when dumping all 
configuration registers on H3 and M3-W I noticed that register 0x002c, not 
documented in the datasheet, reads 0x14060514 on all four IMR instances in H3, 
and 0x20150505 on both instances in M3-W.

This looks like a version register to me. If my assumption is correct, we 
could do without any SoC-specific compatible string.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
