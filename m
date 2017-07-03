From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Mon, 03 Jul 2017 15:41:14 +0300
Message-ID: <1499085674.4225.17.camel@hp800z>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
         <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
         <20170703090648.GV13989@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170703090648.GV13989-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Mon, 2017-07-03 at 19:06 +1000, David Gibson wrote:
> On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> > This patch enables an overlay to refer to a previous overlay's
> > labels by performing a merge of symbol information at application
> > time.
> 
> This seems to be doing things the hard way.
> 

It is the minimal implementation to get things to work, with the current
overlay implementation. I do have plans for a version 2 with fixes to
a number of areas.
 
> You're essentially extending the semantics of overlay application to
> add the symbol merging.  You've implemented these extended semantics
> in libfdt, which is all very well, but that's not the only overlay
> application implementation.
> 
> 

This is a port of the same patch that's against the linux kernel.
As far as I know there's no other implementations, or at least none
that are open source.

> It seems to me a better approach would be to change dtc's -@
> implementation, so that in /plugin/ mode instead of making a global
> __symbols__ node, it puts it into the individual fragments.  That way
> the existing overlay application semantics will update the __symbols__
> node.
> 

A lot of things can be made better, on the next version. These are
minimally intrusive patches to address user requests for the current
implementation.

Why don't we start by making a list, and work towards that goal?

Care to start about what you want addressed and how?

Regards

-- Pantelis
