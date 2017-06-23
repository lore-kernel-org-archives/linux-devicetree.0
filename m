From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] overlay: Documentation for the overlay sugar syntax
Date: Fri, 23 Jun 2017 09:39:27 +0300
Message-ID: <1498199967.5656.4.camel@hp800z>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
         <1497451986-15515-2-git-send-email-pantelis.antoniou@konsulko.com>
         <594C36F9.1070405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <594C36F9.1070405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Thu, 2017-06-22 at 14:30 -0700, Frank Rowand wrote:
> Hi David, Pantelis,
> 
> On 06/14/17 07:53, Pantelis Antoniou wrote:
> > There exists a syntactic sugar version of overlays which
> > make them simpler to write for the trivial case of a single target.
> > 
> > Document it in the device tree object internals.
> > 
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/dt-object-internal.txt | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object-internal.txt
> > index 51d68ab..624aa43 100644
> > --- a/Documentation/dt-object-internal.txt
> > +++ b/Documentation/dt-object-internal.txt
> > @@ -308,3 +308,20 @@ the run time loader must apply an offset to each phandle in every dynamic
> >  DT object loaded. The __local_fixups__ node records the offset relative to the
> >  start of every local reference within that property so that the loader can apply
> >  the offset.
> > +
> > +There is an alternative syntax to the expanded form for overlays with phandle
> > +targets which makes the format similar to the one using in .dtsi include files.
> > +
> > +So for the &ocp target example above one can simply write:
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +&ocp {
> > +	/* bar peripheral */
> > +	bar {
> > +		compatible = "corp,bar";
> > +		... /* various properties and child nodes */
> > +	}
> > +};
> > +
> > +The resulting dtb object is identical.
> 
> 
> Ignoring the fact that this file describes the device tree internals
> instead of the device tree source format -- did we decide that we can
> deprecate specifying nodes __symbols__,  __overlay__, __fixups__, and
> __local_fixups__ (any node name beginning with an underscore) in
> device tree source.  Then at a future date make node names beginning
> with an underscore an error (maybe with a command line flag to override
> the error?)?
> 

There are a few things in mind about this. In my TODO list is a patch
that completely deprecates the manual overlay crafting.

My goal is to have the overlay format be source identical to a .dtsi
file that usually is included when crafting the single dtb blob we're
booting with. That is a format that most are familiar with.

For that to work, we need to handle transformations of the form
/foo -> <&/foo> -> runtime phandle insertion of <&/foo> if it doesn't
work.

This patch is a prerequisite, and we can take it from there. 

> -Frank

Regards

-- Pantelis


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
