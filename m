From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt.h: Define FDT_PATH_MAX
Date: Wed, 14 Jun 2017 22:24:01 +0300
Message-ID: <1497468241.28265.22.camel@hp800z>
References: <1497451908-15367-1-git-send-email-pantelis.antoniou@konsulko.com>
         <20170614150522.GE2614@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170614150522.GE2614@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Wed, 2017-06-14 at 23:05 +0800, David Gibson wrote:
> On Wed, Jun 14, 2017 at 05:51:48PM +0300, Pantelis Antoniou wrote:
> > Declare the maximum path size of an FDT node.
> > It is useful for manipulation methods that need to know a maximum value.
> > 
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> 
> Why do you need this.  I've really tried to avoid adding arbitrary
> size limits on things.
> 

The stacked overlay patch needs it; has to 'read' in a path into a
buffer and manipulate it. Otherwise it I would have to add a new method
that walks the path and returns the size of it so that I can allocate
the exact amount. This seems excessive IMO compared to a hard max limit.

It is similar to the way PATH_MAX works in *nix which makes things
somewhat familiar.

Regards

-- Pantelis

> > ---
> >  libfdt/libfdt.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index a248b1b..a5c93f6 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -139,6 +139,9 @@
> >  
> >  #define FDT_ERR_MAX		17
> >  
> > +/* Maximum path size of a node (similar to PATH_MAX in *nix) */
> > +#define FDT_PATH_MAX	4096
> > +
> >  /**********************************************************************/
> >  /* Low-level functions (you probably don't need these)                */
> >  /**********************************************************************/
> 
