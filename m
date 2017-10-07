From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Sat, 7 Oct 2017 13:23:01 +0300
Message-ID: <4D25319A-34A8-4FE6-8B14-616686D2192A@konsulko.com>
References: <1506628736.28192.9.camel@hp800z>
 <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
 <1506973580.17981.5.camel@hp800z>
 <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
 <1507039989.17981.25.camel@hp800z>
 <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
 <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Oct 6, 2017, at 16:55 , Rob Herring <robherring2@gmail.com> wrote:
>=20
> On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> Hi Rob,
>>=20
>> On Tue, 2017-10-03 at 12:13 -0500, Rob Herring wrote:
>>> On Tue, Oct 3, 2017 at 9:13 AM, Pantelis Antoniou
>>> <pantelis.antoniou@konsulko.com> wrote:
>>>> Hi Rob,
>>>>=20
>>>> On Tue, 2017-10-03 at 08:18 -0500, Rob Herring wrote:
>>>>> On Mon, Oct 2, 2017 at 2:46 PM, Pantelis Antoniou
>>>>> <pantelis.antoniou@konsulko.com> wrote:
>>>>>> Hi Rob,
>>>>>>=20
>>>>>> On Sun, 2017-10-01 at 17:00 -0500, Rob Herring wrote:
>>>>>>> On Thu, Sep 28, 2017 at 2:58 PM, Pantelis Antoniou
>>>>>>> <pantelis.antoniou@konsulko.com> wrote:
>>>>>>>> Hello again,
>>>>>>>>=20
>>>>>>>> Significant progress has been made on yamldt and is now capable =
of
>>>>>>>> not only generating yaml from DTS source but also compiling DTS =
sources
>>>>>>>> and being almost fully compatible with DTC.
>>>>>>>=20
>>>>>>> Can you quantify "almost"?
>>>>>>>=20
>>>>>>>> Compiling the kernel's DTBs using yamldt is as simple as using =
a
>>>>>>>> DTC=3Dyamldt.
>>>>>>>=20
>>>>>>> Good.
>>>>>>>=20
>>>>>>>>=20
>>>>>>>> Error reporting is accurate and validation against a YAML based =
schema
>>>>>>>> works as well. In a short while I will begin posting patches =
with
>>>>>>>> fixes on bindings and DTS files in the kernel.
>>>>>>>=20
>>>>>>> What I would like to see is the schema format posted for review.
>>>>>>>=20
>>>>>>=20
>>>>>> I'm including the skeleton.yaml binding which is the template for
>>>>>> the bindings and a board-example.yaml binding for a top level =
binding.
>>>>>>=20
>>>>>>> I would also like to see the bindings for top-level compatible =
strings
>>>>>>> (aka boards) as an example. That's something that's simple =
enough that
>>>>>>> I'd think we could agree on a format and start moving towards =
defining
>>>>>>> board bindings that way.
>>>>>>>=20
>>>>>>=20
>>>>>> Note there is some line wrapping I'm including a link
>>>>>> to the github repo of the files:
>>>>>>=20
>>>>>>=20
>>>>>> The skeleton.yaml
>>>>>>=20
>>>>>> =
https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/binding=
s/skeleton.yaml
>>>>>>=20
>>>>>> %YAML 1.1
>>>>>> ---
>>>>>> # The name of the binding is first
>>>>>> # The anchor is put there for use by others
>>>>>> skeleton: &skeleton
>>>>>=20
>>>>> This and "id" seem redundant.
>>>>>=20
>>>>=20
>>>> Indeed.
>>>=20
>>> One other thing, "skeleton" is a bit weird as a key. It can't be
>>> validated. All the other keys are standard words. I could write
>>> "skeloton" by mistake and I guess I'd only find the mistake when
>>> something inherits it. That's somewhat true with id, but we can at
>>> least check "id" is present and that it's value is unique among all
>>> other id values.
>>>=20
>>=20
>> We can keep id and check that it matches the name of the enclosing =
node.
>> That way you can be sure that there's no error.
>>=20
>> But it's a bit weird cause this is similar to declaring a function =
name
>> with a typo. You won't find out until you use it.
>>=20
>>>>=20
>>>>>>  version: 1
>>>>>>=20
>>>>>>  id: skel-device
>>>>>>=20
>>>>>>  title: >
>>>>>>    Skeleton Device
>>>>>>=20
>>>>>>  maintainer:
>>>>>>    name: Skeleton Person <skel@kernel.org>
>>>>>>=20
>>>>>>  description: >
>>>>>>    The Skeleton Device binding represents the SK11 device =
produced by
>>>>>>    the Skeleton Corporation. The binding can also support =
compatible
>>>>>>    clones made by second source vendors.
>>>>>>=20
>>>>>>  # The class is an optional property that declares this
>>>>>>  # binding as part of a larger set
>>>>>>  # Multiple definitions are possible
>>>>>>  class: [ device, spi-device ]
>>>>>>=20
>>>>>>  # This binding inherits property characteristics from the =
generic
>>>>>>  # spi-slave binding
>>>>>>  # Note that the notation is standard yaml reference
>>>>>>  inherits: *spi-slave
>>>>>>=20
>>>>>>  # virtual bindings do not generate checkers
>>>>>>  virtual: true
>>>>>=20
>>>>> virtual is an overloaded term.
>>>>>=20
>>>>=20
>>>> OK, what term should I use that this binding should not be =
instantiated
>>>> as a checker, only be used by other bindings when inherited?
>>>=20
>>> checks: true?
>>>=20
>>> I'd really like to avoid having to decide and drop this, but I don't
>>> really get why it is needed.
>>>=20
>>=20
>> It is needed because otherwise checker filters will be generated for
>> the template bindings that while they won't be executed they will be
>> compiled and take up space in the schema.
>=20
> Size is not a problem I have. That can come later if needed.
>=20
>>>>>>  # each property is defined by each name
>>>>>>  properties:
>>>>>>=20
>>>>>>    # The compatible property is a reserved name. The type is =
always
>>>>>> "string"
>>>>>>    # and should not be repeated device binding.
>>>>>>    compatible:
>>>>>>      category: required        # required property
>>>>>>      type: strseq              # is a sequence of strings
>>>>>>=20
>>>>>>      description: >
>>>>>>        FX11 is a clone of the original SK11 device
>>>>>>=20
>>>>>>      # v is always the name of the value of the property
>>>>>>      # np is passed to the checker and is the current
>>>>>>      # node pointer. We can access properties and call
>>>>>>      # methods that operate on them.
>>>>>>      # There can be multiple constraints, just put them
>>>>>>      # into a sequence.
>>>>>>      # Note that the BASE("skel,sk11") form from the previous
>>>>>>      # binding will have to be reworked.
>>>>>>      constraint: |
>>>>>>        anystreq(v, "skel,sk11") ||
>>>>>>        anystreq(v, "faux,fx11")
>>>>>=20
>>>>> Constraints and logic ops were certainly not decided in the last
>>>>> attempt and I think will be the hardest part to define. I see you =
are
>>>>> using eBPF in the checker. Is that where anystreq comes from?
>>>>>=20
>>>>=20
>>>> Yes. The ebpf environment declares a number of methods that are =
executed
>>>> outside the ebpf sandbox. Check out
>>>>=20
>>>> =
https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/schema/=
codegen.yaml
>>>> https://github.com/pantoniou/yamldt/blob/master/ebpf_dt.c
>>>=20
>>> I looked at this some a while back. It wasn't clear to me what eBPF
>>> gives us and what you have defined on top of it. What I'm really =
after
>>> is documentation of the syntax and keywords here.
>>>=20
>>=20
>> eBPF is portable, can be serialized after compiling in the schema =
file
>> and can be executed in the kernel.
>=20
> Executing in the kernel is a non-goal for me.
>=20
>> By stripping out all documentation related properties and nodes =
keeping
>> only the compiled filters you can generate a dtb blob that passed to
>> kernel can be used for verification of all runtime changes in the
>> kernel's live tree. eBPF is enforcing an execution model that is =
'safe'
>> so we can be sure that no foul play is possible.
>=20
> Humm, if you wanted to ensure dtb's are safe, I'd think that we just
> sign them like you would for the kernel or modules.
>=20

That=E2=80=99s a problem when deploying; the runtime validation is for =
making sure
developers don=E2=80=99t get bogged down chasing problems when working =
on their
own platforms/drivers.

We have absolutely zero checks for stopping badly configured DT blobs
hanging the kernel. With runtime validation a bug that might take a few
days to figure out can be cut down to a few minutes.

>> That means that you can a) run it at boot-time, verifying the dtb =
blob
>> passed by the bootloader for errors (potentially disabling devices
>> that their nodes fail) and b) run it when applying overlays to reject
>> any that result in an invalid tree.
>=20
> Let's get verification at build time working first, then we can worry
> about something like this.
>=20
>> One other use that I'm thinking that might be possible too, like
>> binding version check between what the driver is compiled against and
>> what the passed blob is without using an explicit version property.
>>=20
>> The constraint format ofcourse is plain C, you can generate a .so =
using
>> the host compiler and execute that if you are looking for =
performance.
>>=20
>> Syntax and keywords of the internals is in a bit of flux right now,
>> since the binding format is not finalized yet. I'd be happy to
>> discuss the internal at ELCE.
>=20
> I won't be there.
>=20
> I'm just trying to understand what eBPF defines if anything and what's
> up for discussion.

The eBPF defines an API that the constraints use to perform validation.
Anything that can be expressed as a C method can be in the eBPF API.

>=20
> [...]
>=20
>>>>>>      constraint: |
>>>>>>        get_depth(np) =3D=3D 0 && (
>>>>>=20
>>>>> Ahh, I guess this is how you are doing it. I don't think this =
works
>>>>> for any value other than 0. An MFD could be at any level.
>>>>>=20
>>>>=20
>>>> Well, I could've used a streq(get_name(get_parent(np)), "/") test =
but
>>>> this is faster. It's up to you what would work best.
>>>=20
>>> Why not just a "parent" key?
>>>=20
>>=20
>> Because the property/type prolog code would increase even for =
properties
>> that don't need the parent key. While generating the parent key only =
for
>> constraints that need it keeps the filter size smaller.
>=20
> One could argue that category and type are also constraints, but you
> don't express them as constraints. I think constraints should be
> limited to constraints on the value of the property which are not
> generically expressible (like type). I haven't fully thought through
> whether there's other cases.
>=20

Both type and category constraints work in what I=E2=80=99ve posted, =
using the
eBPF APIs. Taking for instance the enabled status constraint from
=E2=80=98device-enabled.yaml=E2=80=99

> %YAML 1.1
> ---
> device-enabled:
>   title: Contraint for enabled devices
>=20
>   class: constraint
>   virtual: true
>=20
>   properties:
>     status: &device-status-enabled
>       category: optional
>       type: str
>       description: Marks device state as enabled
>       constraint: |
>         !exists || streq(v, "okay") || streq(v, "ok=E2=80=9D)
>=20

It generates the following code fragment.

>         {
>         uint64_t flags;
>         const char *v =3D get_str(np, "status", &flags);
>         const bool badtype =3D !!(flags & BADTYPE);
>         const bool exists =3D !!(flags & EXISTS);
>=20
>         if (badtype)
>             return -BADTYPE_BASE - 100002;
>=20
>         if (!exists)
>             goto skip_100002;
>=20
>         /* for status from device-compatible rule */
>         if (!(
>             !exists || streq(v, "okay") || streq(v, "ok")
>         ))
>             return -PROPC_BASE - 100002;
>         skip_100002:
>           do { } while(0); /* fix goto that requires a statement */
>=20
>         }
>=20

Both type checking (BADTYPE) and category (EXISTS) flags are returned
and checked.

> Another problem is this constraint is not really a constraint for
> compatible as you have it, but for the whole binding.
>=20

What exactly is the difference in actual use? AFAIKT is our use of =
bindings and
special meaning of the compatible property.

> [...]
>=20
>>>>> Overall, I think this format is a bit long for boards. We have
>>>>> something like ~1000 boards in arch/arm last I checked. I want =
adding
>>>>> a board binding to be very short and easy to review. It's often =
only a
>>>>> 1 line change. The main issue I have is it is just each SoC (or =
SoC
>>>>> family) does things their own way.
>>>>>=20
>>>>=20
>>>> Well, this is a full featured example; you could declare this a
>>>> 'virtual' (or what ever you want to call it binding) and use:
>>>>=20
>>>> board-example-foo:
>>>>=20
>>>>  inherits: *board-example
>>>>=20
>>>>  properties:
>>>>    compatible: ...
>>>>=20
>>>> It is not absolutely terse, but it's still YAML. But for what is =
worth,
>>>> those YAML files can be generated using the C preprocessor. You =
could
>>>> define a macro that cuts the churn, albeit you lose the ability to
>>>> parse them as normal YAML files.
>>>=20
>>> C preprocessor doesn't sound like a great option to me.
>>>=20
>>> Perhaps it is by SoC compatible and boards are just an addition to =
the
>>> constraints. That's kind of how things are organized already.
>>>=20
>>=20
>> The code base supports multiple constraints so we could have multiple
>> constraint properties. How would you like your SoC example to
>> work ideally?
>=20
> Not sure exactly other than meeting the requirements that I gave.
>=20
> Rob

Regards

=E2=80=94 Pantelis
