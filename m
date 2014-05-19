Return-Path: <loeliger@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5379FAA5.10404@ahsoftware.de>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
	<1399913280-6915-2-git-send-email-holler@ahsoftware.de>
	<53775334.3030704@gmail.com>
	<5379FAA5.10404@ahsoftware.de>
Date: Mon, 19 May 2014 10:38:46 -0500
Message-ID: <CAJgR-BhgXytwfijNGdRytuVuE9adwTa23C78ANLMzDE2ESTQTA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/9] dt: deps: dtc: Automatically add new property
 'dependencies' which contains a list of referenced phandles
From: Jon Loeliger <loeliger@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c1ed8a1cb3ce04f9c28ffb
To: Alexander Holler <holler@ahsoftware.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a11c1ed8a1cb3ce04f9c28ffb
Content-Type: text/plain; charset=UTF-8

> What's still questionable about the patches for dtc is if dependencies to
devices and not just
> drivers should be included in the new property dependencies too.

I don't think the DTC should have any semantic knowledge of why these
dependency
arcs are being added to the graph.  Sure, it could be that different types
of arcs are added,
and that the total dependency graph travels multiple such arc types to
obtains some valid
topological sort, but the DTC itself should just not care.

After saying that, there are likely semantic checks that could be added to
ensure some
policy about those arcs was followed.  Separate the implementation from the
policy.
There is already plenty of discussion down that line within the DTC ongoing.

HTH,
jdl



On Mon, May 19, 2014 at 7:35 AM, Alexander Holler <holler@ahsoftware.de>wrote:

> Am 17.05.2014 14:16, schrieb Tomasz Figa:
>
>
>  References to phandles of parent or child nodes will not be added to this
>>> property, because this information is already contained in the blob (in
>>> the
>>> form of the tree itself).
>>>
>>
>> I wonder if we shouldn't be including them too for consistency related
>> reasons, so we have all the necessary information in one place.
>> References to child nodes are great recipes for cycles, though...
>>
>> No strong opinion, though, just an idea.
>>
>
> As said, they are already in the tree itself. And they are already
> included in the graph (these are the black edges), so they just don't
> appear in the property dependencies.
>
>
>
>>
>>> No dependencies to disabled nodes will be added.
>>>
>>>
>> Same here. IMHO it might be wise to let the parsing entity (e.g. kernel)
>> decide whether to ignore a dependency to disabled node or not.
>>
>> Otherwise, I like the simplicity of compile-time dependency list
>> creation. Quite a nice work.
>>
>
> Thanks.
>
> What's still questionable about the patches for dtc is if dependencies to
> devices and not just drivers should be included in the new property
> dependencies too. My current assumption is that all devices belonging to
> one and the same driver don't have dependencies between each other. In
> other words the order in which devices will be attached to one and the same
> driver isn't important. If that assumption is correct it would be possible
> to just attach all devices belonging to a driver after the driver was
> loaded (also I haven't that done in my patches).
>
> And thinking about that again, I think I was wrong and doing so have been
> some kind of evil premature optimization I did in order to spare a few
> dependencies/edges. But changing this can done by removing a few lines in
> the code for dtc (patch 1).
>
> Regards,
>
> Alexander Holler
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--001a11c1ed8a1cb3ce04f9c28ffb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>&gt; What&#39;s still questionable about th=
e patches for dtc is if dependencies=20
to devices and not just <br>&gt; drivers should be included in the new prop=
erty=20
dependencies too.<br><br></div>I don&#39;t think the DTC should have any se=
mantic knowledge of why these dependency<br>arcs are being added to the gra=
ph.=C2=A0 Sure, it could be that different types of arcs are added,<br>and =
that the total dependency graph travels multiple such arc types to obtains =
some valid<br>
topological sort, but the DTC itself should just not care.<br><br></div>Aft=
er saying that, there are likely semantic checks that could be added to ens=
ure some<br>policy about those arcs was followed.=C2=A0 Separate the implem=
entation from the policy.<br>
There is already plenty of discussion down that line within the DTC ongoing=
.<br><br></div>HTH,<br>jdl<br><br></div><div class=3D"gmail_extra"><br><br>=
<div class=3D"gmail_quote">On Mon, May 19, 2014 at 7:35 AM, Alexander Holle=
r <span dir=3D"ltr">&lt;<a href=3D"mailto:holler@ahsoftware.de" target=3D"_=
blank">holler@ahsoftware.de</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Am 17.05.2014 14:16, schrieb Tomasz Figa:<di=
v class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
References to phandles of parent or child nodes will not be added to this<b=
r>
property, because this information is already contained in the blob (in the=
<br>
form of the tree itself).<br>
</blockquote>
<br>
I wonder if we shouldn&#39;t be including them too for consistency related<=
br>
reasons, so we have all the necessary information in one place.<br>
References to child nodes are great recipes for cycles, though...<br>
<br>
No strong opinion, though, just an idea.<br>
</blockquote>
<br></div>
As said, they are already in the tree itself. And they are already included=
 in the graph (these are the black edges), so they just don&#39;t appear in=
 the property dependencies.<div class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
No dependencies to disabled nodes will be added.<br>
<br>
</blockquote>
<br>
Same here. IMHO it might be wise to let the parsing entity (e.g. kernel)<br=
>
decide whether to ignore a dependency to disabled node or not.<br>
<br>
Otherwise, I like the simplicity of compile-time dependency list<br>
creation. Quite a nice work.<br>
</blockquote>
<br></div>
Thanks.<br>
<br>
What&#39;s still questionable about the patches for dtc is if dependencies =
to devices and not just drivers should be included in the new property depe=
ndencies too. My current assumption is that all devices belonging to one an=
d the same driver don&#39;t have dependencies between each other. In other =
words the order in which devices will be attached to one and the same drive=
r isn&#39;t important. If that assumption is correct it would be possible t=
o just attach all devices belonging to a driver after the driver was loaded=
 (also I haven&#39;t that done in my patches).<br>

<br>
And thinking about that again, I think I was wrong and doing so have been s=
ome kind of evil premature optimization I did in order to spare a few depen=
dencies/edges. But changing this can done by removing a few lines in the co=
de for dtc (patch 1).<br>

<br>
Regards,<br>
<br>
Alexander Holler<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
______________________________<u></u>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blank">l=
inux-arm-kernel@lists.<u></u>infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/<u></u>mailman/listinfo/linux-ar=
m-<u></u>kernel</a><br>
</div></div></blockquote></div><br></div>

--001a11c1ed8a1cb3ce04f9c28ffb--
