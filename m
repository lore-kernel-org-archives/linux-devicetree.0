From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: Re: [PATCH v2 2/6] libfdt: Add iterator over properties
Date: Mon, 11 Jul 2016 18:57:46 -0700 (PDT)
Message-ID: <alpine.LFD.2.20.1607111856210.14522@localhost.localdomain>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com> <20160711195623.12840-3-maxime.ripard@free-electrons.com> <20160712015335.GO16355@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160712015335.GO16355-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-15?Q?Antoine_T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Jul 2016, David Gibson wrote:

> On Mon, Jul 11, 2016 at 09:56:19PM +0200, Maxime Ripard wrote:
> > +/**
> > + * fdt_for_each_property - iterate over all properties of a node
> > + * @property_offset:	property offset (int)
> > + * @fdt:		FDT blob (const void *)
> > + * @node:		node offset (int)
> > + *
> > + * This is actually a wrapper around a for loop and would be used like so:
> > + *
> > + *	fdt_for_each_property(fdt, node, property) {
>
> Again, parameter order is out of date.

  also, when did kerneldoc content start specifying data types in the
comment? (int, const void*, ...). i don't think that's standard.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
