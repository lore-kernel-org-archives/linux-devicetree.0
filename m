From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Wed, 2 Aug 2017 23:04:14 +0100
Message-ID: <CACxGe6um3TC3URKa8NWbbQT-gc=AV5jgTxbQ3pYnSp4Xmu_Mfg@mail.gmail.com>
References: <1501174151.1055.8.camel@hp800z> <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z> <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat> <20170802150933.GG394@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170802150933.GG394-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I'll randomly choose this point in the thread to jump in...

On Wed, Aug 2, 2017 at 4:09 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jul 27, 2017 at 08:51:40PM -0400, Tom Rini wrote:
>> If the common dts source file was in yaml, binding docs would be written
>> so that we could use them as validation and hey, the above wouldn't ever
>> have happened.  And I'm sure this is not the only example that's in-tree
>> right now.  These kind of problems create an artificially high barrier
>> to entry in a rather important area of the kernel (you can't trust the
>> docs, you have to check around the code too, and of course the code
>> might have moved since the docs were written).
>
> Yeah, problems like that suck.  But I don't see that going to YAML
> helps avoid them.  It may have a number of neat things it can do, but
> yaml won't magically give you a way to match against bindings.  You'd
> still need to define a way of describing bindings (on top of yaml or
> otherwise) and implement the matching of DTs against bindings.

I'm going to try and apply a few constraints. I'm using the following
assumptions for my reply.
1) DTS files exist, will continue to exist, and new ones will be
created for the foreseeable future.
2) DTB is the format that the kernel and U-Boot consume
3) Therefore the DTS->DTB workflow is the important one. Anything that
falls outside of that may be interesting, but it distracts from the
immediate problem and I don't want to talk about it here.

For schema documentation and checking, I've been investigating how to
use JSON Schema to enforce DT bindings. Specifically, I've been using
the JSONSchema Python library which strictly speaking doesn't operate
on JSON or YAML, but instead operates directly on Python data
structures. If that data happens to be imported from a DTS or DTB, the
JSON Schema engine doesn't care.

The work Pantelis has done here is important because it defines a
specific data model for DT data. That data model must be defined
before schema files can be written, otherwise they'll be testing for
the wrong things. However, rather than defining a language specific
data model (ie. Python), specifying it in YAML means it doesn't depend
on any particular language.

g.
