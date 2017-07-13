From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Thu, 13 Jul 2017 12:31:50 -0700
Message-ID: <5967CAA6.6010801@gmail.com>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170703090648.GV13989-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/03/17 02:06, David Gibson wrote:
> On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
>> This patch enables an overlay to refer to a previous overlay's
>> labels by performing a merge of symbol information at application
>> time.
> 
> This seems to be doing things the hard way.
> 
> You're essentially extending the semantics of overlay application to
> add the symbol merging.  You've implemented these extended semantics
> in libfdt, which is all very well, but that's not the only overlay
> application implementation.
> 
> 
> It seems to me a better approach would be to change dtc's -@
> implementation, so that in /plugin/ mode instead of making a global
> __symbols__ node, it puts it into the individual fragments.  That way
> the existing overlay application semantics will update the __symbols__
> node.

If the __symbols__ node was inside a fragment, then the existing
code would add (or update) a __symbols__ node located at the location
pointed to by the fragment's target path, instead of updating the
node /__symbols__.

It makes sense to me to have only one global __symbols__ node instead
of several.

If there is a global __symbols__ node then we have a single name
space for symbols.

If there are multiple __symbols__ nodes spread throughout the tree,
then to me that would imply different name spaces spread throughout
the tree, where namespaces are determined by fragments.  This sounds
confusing to me.  Or if the intent is to have a single name space
then the __symbols__ information would be scattered throughout the
tree instead of located in a single node.

My current patch (under review), targeted for Linux 4.13-rc1, puts
an overlay's __symbols__ node properties into the overlay's
changeset, so they get added when the overlay is loaded and
removed when the overlay is unloaded.

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
