From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 27 Jul 2017 13:22:24 -0700
Message-ID: <597A4B80.7000106@gmail.com>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501181931.1055.18.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

Keep in mind one of the reasons Linus says he is very direct is to
avoid leading a developer on, so that they don't waste a lot of time
trying to resolve the maintainer's issues instead of realizing that
the maintainer is saying "no". Please read my current answer as being
"no, not likely to ever be accepted", not "no, not in the current form".

My first reaction is: no, this is not a good idea for the Linux kernel.


On 07/27/17 11:58, Pantelis Antoniou wrote:
> On Thu, 2017-07-27 at 13:09 -0500, Rob Herring wrote:
>> On Thu, Jul 27, 2017 at 11:49 AM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Hi all,
>>>
>>> This is a project I've been working on lately and it's finally in a
>>> usuable form.
>>>
>>> I'm introducing yamldt.
>>>
>>> A YAML to DT blob generator/compiler, utilizing a YAML schema that is
>>> functionaly equivalent to DTS and supports all DTS features.
>>
>> What problem are you trying to solve?
>>
> 
> I am demonstrating that the DTS source format is not the only way to
> describe hardware and generate a DTB that is functionally equivalent.
> 
> I feel that the reliance on DTS has been holding progress back in
> expressing modern hardware and having a tool that generates DTB as well
> will allow me to experiment in ways that things like overlays and
> portable overlays can be defined.

That seems to be multiple things, that should be expressed as individual
issues and not lumped into a simple statement (and thus can be addressed
separately):

  1) DTS format is holding progress back in expressing modern hardware

What are the issues you have encountered?
How would yaml syntax solve those issues?
Why can't we solve those issues in DTS format?


  2) having a tool that generates DTB ... will allow me to experiment in ways
     that things like overlays and portable overlays can be defined.

Is this saying that it is difficult to
  - modify your own copy of dtc to experiment with different source formats?
  - experiment with changes to DTB format for overlays?
  - get patches to dtc accepted?

  I think I'm reading between the lines here, and probably not understanding
  what you intend, but instead putting words in your mouth.


>>> yamldl parses a device tree description (source) file in YAML format and
>>> outputs a (bit-exact if the -C option is used) device tree blob.
>>>
>>> A DT aware YAML schema is a good fit as a DTS syntax alternative.
>>>
>>> YAML is a human-readable data serialization language, and is expressive
>>> enough to cover all DTS source features.
>>>
>>> Simple YAML files are just key value pairs that are very easy to parse,
>>> even without using a formal YAML parser. For instance YAML in restricted
>>> environments may simple be appending a few lines of text in a given YAML
>>> file.
>>>
>>> The parsers of YAML are very mature, as it has been released in 2001. It
>>> is in wide-spread use and schema validation tools are available. YAML
>>> support is available for every major programming language.
>>>
>>> Data in YAML can easily be converted to/form other format that a
>>> particular tool that we may use in the future understands.
>>>
>>> More importantly YAML offers (an optional) type information for each
>>> data, which is IMHO crucial for thorough validation and checking against
>>> device tree bindings (when they will be converted to a machine readable
>>> format, preferably YAML).
>>
>> We have type information in dts. We can distinguish numbers, strings,
>> phandles, etc. The problem is we loose that information in the DTB and
>> this does nothing to help that problem.
>>
> 
> This is not enough information IMO. We not only need those scalar types
> but type information about references (what phandles really are) and
> use them to enforce type checking and promotion.

So is this a proposal to not just express the equivalent of DTS source,
but to instead add types and type checking into a YAML encoded source
file?  If so, that should have been a headline, or sub-headline of the
proposal.

If that is a key issue, could DTS format be extended in a reasonable
and acceptable manner to achieve the same result?


> And of course DTS throws away all type information away and has no
> way to be extended. In YAML this is a solved problem. 
> 
>>>
>>> For more take a look here.
>>>
>>> https://github.com/pantoniou/yamldt
>>
>> Looking at the example, I find the syntax harder to follow. Parsing
>> what are node names vs labels is one. Relying on indentation for tree
>> hierarchy is another.

I agree with Rob.

And I don't like the YAML feature that the same information can be
expressed in very different syntax (as shown in the example immediately
below in the email I am replying to), which can result in two functionally
equivalent YAML source files looking very different - that is a big usability
issue to me.  But now I'm getting to a much lower level of detail than I
want to - I want to stay mostly at the architectural level for my issues.


> This is really debatable. You can use curly braces if you don't like the
> indentation.
> 
> I.e.
> 
> foo:
>   bar: true
> 
> Can be written as
> foo: { bar: true }
> 
> YAML is a JSON superset which uses the curly braces as a map separator.
> 
> And frankly there are about x1000 more people aware of YAML syntax than
> DTS syntax.
> 
>> Does C preprocessing of the YAML files work? I'm surprised if it does.
>>
> 
> I think you should check the code out and see for yourself.
> 
> The complete set of C preprocessing of DTS is available, and works
> perfectly AFAIKT.
> 
>>>
>>> I am eagerly awaiting for your comments.
>>
>> I could see some uses here to extract data from dts files more easily.
>> For example, to extract all compatible strings for some set of dts
>> files. I did this by hacking dtc to dump them. Or as a starting point
>> to create YAML based DT binding schema. I wonder how Grant is coming
>> along with that.

But the proposal is not to process DTS format files with this new tool.
The proposal is to convert device tree source files to a YAML format
and have the new tool compile only YAML format source files.

Having a tool to convert DTS format to a YAML format within a validation
toll is something that has been proposed several times.  If I recall
correctly, Grant had a prototype that did that step in a handful of
lines.  (I'm not sure how complete that conversion process was in
his prototype form.)

-Frank

>>
>> Rob
> 
> 
> 
