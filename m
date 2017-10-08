From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Sun, 8 Oct 2017 16:08:03 -0700
Message-ID: <59DAAFD3.9070900@gmail.com>
References: <1506628736.28192.9.camel@hp800z>
 <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
 <1506973580.17981.5.camel@hp800z>
 <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
 <1507039989.17981.25.camel@hp800z>
 <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
 <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
 <4D25319A-34A8-4FE6-8B14-616686D2192A@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D25319A-34A8-4FE6-8B14-616686D2192A-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/07/17 03:23, Pantelis Antoniou wrote:
> Hi Rob,
> 
>> On Oct 6, 2017, at 16:55 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Hi Rob,

< snip >

>>> eBPF is portable, can be serialized after compiling in the schema file
>>> and can be executed in the kernel.
>>
>> Executing in the kernel is a non-goal for me.

Executing in the kernel is an anti-goal for me.

We are trying to reduce the device tree footprint inside the kernel,
not increase it.

99.99% of the validation should be possible statically, in the compile
phase.


>>> By stripping out all documentation related properties and nodes keeping
>>> only the compiled filters you can generate a dtb blob that passed to
>>> kernel can be used for verification of all runtime changes in the
>>> kernel's live tree. eBPF is enforcing an execution model that is 'safe'
>>> so we can be sure that no foul play is possible.

Run time changes can be assumed correct (short of bugs in the overlay
application code), if the base tree is validated, the overlay is validated,
and the interface between the live tree and the overlay is a connector.
 

>> Humm, if you wanted to ensure dtb's are safe, I'd think that we just
>> sign them like you would for the kernel or modules.
>>
> 
> That’s a problem when deploying; the runtime validation is for making sure
> developers don’t get bogged down chasing problems when working on their
> own platforms/drivers.
> 
> We have absolutely zero checks for stopping badly configured DT blobs
> hanging the kernel. With runtime validation a bug that might take a few
> days to figure out can be cut down to a few minutes.

Same reply as above.


>>> That means that you can a) run it at boot-time, verifying the dtb blob
>>> passed by the bootloader for errors (potentially disabling devices
>>> that their nodes fail) and b) run it when applying overlays to reject
>>> any that result in an invalid tree.
>>
>> Let's get verification at build time working first, then we can worry
>> about something like this.

< snip >

-Frank
