From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Thu, 13 Jul 2017 13:08:30 -0700
Message-ID: <5967D33E.9050404@gmail.com>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box> <5967CAA6.6010801@gmail.com>
 <CAPhXvM4NzU61dENLeJ2Xt=arKqYFjXaPBvzrjxAJ7h3Y-gT4Nw@mail.gmail.com>
 <5967D2F7.60303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5967D2F7.60303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/13/17 13:07, Frank Rowand wrote:
> On 07/13/17 12:38, Phil Elwell wrote:
> 
> (I moved Phil's reply to after the email he replied to.)
> 
>> On 13 Jul 2017 8:32 pm, "Frank Rowand" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> On 07/03/17 02:06, David Gibson wrote:
>>>> On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
>>>>> This patch enables an overlay to refer to a previous overlay's
>>>>> labels by performing a merge of symbol information at application
>>>>> time.
>>>>
>>>> This seems to be doing things the hard way.
>>>>
>>>> You're essentially extending the semantics of overlay application to
>>>> add the symbol merging.  You've implemented these extended semantics
>>>> in libfdt, which is all very well, but that's not the only overlay
>>>> application implementation.
>>>>
>>>>
>>>> It seems to me a better approach would be to change dtc's -@
>>>> implementation, so that in /plugin/ mode instead of making a global
>>>> __symbols__ node, it puts it into the individual fragments.  That way
>>>> the existing overlay application semantics will update the __symbols__
>>>> node.
>>>
>>> If the __symbols__ node was inside a fragment, then the existing
>>> code would add (or update) a __symbols__ node located at the location
>>> pointed to by the fragment's target path, instead of updating the
>>> node /__symbols__.
>>>
>>> It makes sense to me to have only one global __symbols__ node instead
>>> of several.
>>>
>>> If there is a global __symbols__ node then we have a single name
>>> space for symbols.
>>>
>>> If there are multiple __symbols__ nodes spread throughout the tree,
>>> then to me that would imply different name spaces spread throughout
>>> the tree, where namespaces are determined by fragments.  This sounds
>>> confusing to me.  Or if the intent is to have a single name space
>>> then the __symbols__ information would be scattered throughout the
>>> tree instead of located in a single node.
>>>
>>> My current patch (under review), targeted for Linux 4.13-rc1, puts
>>> an overlay's __symbols__ node properties into the overlay's
>>> changeset, so they get added when the overlay is loaded and
>>> removed when the overlay is unloaded.
> 
>> Can we also consider a mechanism for overlay-local symbols, i.e. symbols
>> that are used purely to create links within an overlay - perhaps using a
>> particular naming convention? This would make it easier to instantiate an
>> overlay multiple times without having to uniquify all symbols, and it would
>> avoid polluting the global namespace without reason.
>>
>> Phil
> 
> That is essentially the result you get if you compile the overlay dts
> without '-@'.  There will be no __sympls__ node created even if there

                                  ^^^^^^^^^^^ __symbols__

> are symbols within the overlay.
> 
> This is important if the overlay is for an add-on board which might
> have several instances plugged into different sockets on the base
> system.
> 
> But Phil does bring up an interesting use case.  If the add-on board
> ("level one add-on") in turn has a socket that an additional board
> ("level two add-on") can be plugged into, then the level two add-on
> overlay might have a need to reference a symbol from the overlay
> for the level one add-on.  And since there may be multiple level one
> add-on cards in the system, the overlay for each of the level one
> add-ons would need to export its symbols in a name space only
> visible to the level two add-on plugged into that specific level
> on add-on.
> 
> -Frank
> 
