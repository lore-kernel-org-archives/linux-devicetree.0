Return-Path: <gpkulkarni@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150828123228.GE31748@leverpostej>
References: <1439570374-4079-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1439570374-4079-3-git-send-email-gkulkarni@caviumnetworks.com>
	<20150828123228.GE31748@leverpostej>
Date: Tue, 29 Sep 2015 14:05:46 +0530
Message-ID: <CAFpQJXWzM644KsFWP9ei-k6gWgNVpBVT+UbY7NYdyfmyL=zMkw@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] Documentation: arm64/arm: dt bindings for numa.
From: Ganapatrao Kulkarni <gpkulkarni@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b66f97b4e55390520deb313
To: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>, Rob Herring <robherring2@gmail.com>, "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc: Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "leif.lindholm@linaro.org" <leif.lindholm@linaro.org>, "rfranz@cavium.com" <rfranz@cavium.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "msalter@redhat.com" <msalter@redhat.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "steve.capper@linaro.org" <steve.capper@linaro.org>, "hanjun.guo@linaro.org" <hanjun.guo@linaro.org>, "al.stone@linaro.org" <al.stone@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>
List-ID: <devicetree@vger.kernel.org>

--047d7b66f97b4e55390520deb313
Content-Type: text/plain; charset=UTF-8

Hi Mark,

I have tried to answer your comments, in the meantime we are waiting for
Ben to share the details.

On Fri, Aug 28, 2015 at 6:02 PM, Mark Rutland <mark.rutland@arm.com> wrote:

> Hi,
>
> On Fri, Aug 14, 2015 at 05:39:32PM +0100, Ganapatrao Kulkarni wrote:
> > DT bindings for numa map for memory, cores and IOs using
> > arm,associativity device node property.
>
> Given this is just a copy of ibm,associativity, I'm not sure I see much
> point in renaming the properties.
>
> However, (somewhat counter to that) I'm also concerned that this isn't
> sufficient for systems we're beginning to see today (more on that
> below), so I don't think a simple copy of ibm,associativity is good
> enough.
>
it is just copy right now, however it can evolve when we come across more
arm64 numa platforms

>
> >
> > Signed-off-by: Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>
> > ---
> >  Documentation/devicetree/bindings/arm/numa.txt | 212
> +++++++++++++++++++++++++
> >  1 file changed, 212 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
> >
> > diff --git a/Documentation/devicetree/bindings/arm/numa.txt
> b/Documentation/devicetree/bindings/arm/numa.txt
> > new file mode 100644
> > index 0000000..dc3ef86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/numa.txt
> > @@ -0,0 +1,212 @@
> >
> +==============================================================================
> > +NUMA binding description.
> >
> +==============================================================================
> > +
> >
> +==============================================================================
> > +1 - Introduction
> >
> +==============================================================================
> > +
> > +Systems employing a Non Uniform Memory Access (NUMA) architecture
> contain
> > +collections of hardware resources including processors, memory, and I/O
> buses,
> > +that comprise what is commonly known as a NUMA node.
> > +Processor accesses to memory within the local NUMA node is generally
> faster
> > +than processor accesses to memory outside of the local NUMA node.
> > +DT defines interfaces that allow the platform to convey NUMA node
> > +topology information to OS.
> > +
> >
> +==============================================================================
> > +2 - arm,associativity
> >
> +==============================================================================
> > +The mapping is done using arm,associativity device property.
> > +this property needs to be present in every device node which needs to
> to be
> > +mapped to numa nodes.
>
> Can't there be some inheritance? e.g. all devices on a bus with an
> arm,associativity property being assumed to share that value?
>
yes there is inheritance and respective bus drivers should take care of it,
like pci driver does at present.

>
> > +
> > +arm,associativity property is set of 32-bit integers which defines
> level of
>
> s/set/list/ -- the order is important.
>
ok

>
> > +topology and boundary in the system at which a significant difference in
> > +performance can be measured between cross-device accesses within
> > +a single location and those spanning multiple locations.
> > +The first cell always contains the broadest subdivision within the
> system,
> > +while the last cell enumerates the individual devices, such as an SMT
> thread
> > +of a CPU, or a bus bridge within an SoC".
>
> While this gives us some hierarchy, this doesn't seem to encode relative
> distances at all. That seems like an oversight.
>

distance is computed, will add the details to document.
local nodes will have distance as 10(LOCAL_DISTANCE) and every level, the
distance multiplies by 2.
for example, for level 1 numa topology, distance from local node to remote
node will be 20.


>
> Additionally, I'm somewhat unclear on how what you'd be expected to
> provide for this property in cases like ring or mesh interconnects,
> where there isn't a strict hierarchy (see systems with ARM's own CCN, or
> Tilera's TILE-Mx), but there is some measure of closeness.
>

IIUC, as per ARMs CCN architecture, all core/clusters are at equal distance
of DDR, i dont see any NUMA topology.
however, if there are 2 SoC connected thorough the CCN, then it is very
much similar to cavium topology.

Must all of these have the same length? If so, why not have a
> #(whatever)-cells property in the root to describe the expected length?
> If not, how are they to be interpreted relative to each other?
>

yes, all are of default size.
IMHO, there is no need to add cells property.

>
> > +
> > +ex:
>
> s/ex/Example:/, please. There's no need to contract that.
>
> > +       /* board 0, socket 0, cluster 0, core 0  thread 0 */
> > +       arm,associativity = <0 0 0 0 0>;
> > +
> >
> +==============================================================================
> > +3 - arm,associativity-reference-points
> >
> +==============================================================================
> > +This property is a set of 32-bit integers, each representing an index
> into
>
> Likeise, s/set/list/
>
ok

>
> > +the arm,associativity nodes. The first integer is the most significant
> > +NUMA boundary and the following are progressively less significant
> boundaries.
> > +There can be more than one level of NUMA.
>
> I'm not clear on why this is necessary; the arm,associativity property
> is already ordered from most significant to least significant per its
> description.
>

first entry in arm,associativity-reference-points is used to find which
entry in associativity defines node id.
also entries in arm,associativity-reference-points defines,
how many entries(depth) in associativity can be used to calculate node
distance
in both level 1 and  multi level(hierarchical) numa topology.


>
> What does this property achieve?
>
> The description also doesn't describe where this property is expected to
> live. The example isn't sufficient to disambiguate that, especially as
> it seems like a trivial case.
>
sure, will add one more example to describe the
arm,associativity-reference-points

>
> Is this only expected at the root of the tree? Can it be re-defined in
> sub-nodes?
>
yes it is defined only at the root.

>
> > +
> > +Ex:
>
> s/Ex/Example:/, please
>
sure.

>
> > +       arm,associativity-reference-points = <0 1>;
> > +       The board Id(index 0) used first to calculate the associativity
> (node
> > +       distance), then follows the  socket id(index 1).
> > +
> > +       arm,associativity-reference-points = <1 0>;
> > +       The socket Id(index 1) used first to calculate the associativity,
> > +       then follows the board id(index 0).
> > +
> > +       arm,associativity-reference-points = <0>;
> > +       Only the board Id(index 0) used to calculate the associativity.
> > +
> > +       arm,associativity-reference-points = <1>;
> > +       Only socket Id(index 1) used to calculate the associativity.
> > +
> >
> +==============================================================================
> > +4 - Example dts
> >
> +==============================================================================
> > +
> > +Example: 2 Node system consists of 2 boards and each board having one
> socket
> > +and 8 core in each socket.
> > +
> > +       arm,associativity-reference-points = <0>;
> > +
> > +       memory@00c00000 {
> > +               device_type = "memory";
> > +               reg = <0x0 0x00c00000 0x0 0x80000000>;
> > +               /* board 0, socket 0, no specific core */
> > +               arm,associativity = <0 0 0xffff>;
> > +       };
> > +
> > +       memory@10000000000 {
> > +               device_type = "memory";
> > +               reg = <0x100 0x00000000 0x0 0x80000000>;
> > +               /* board 1, socket 0, no specific core */
> > +               arm,associativity = <1 0 0xffff>;
> > +       };
> > +
> > +       cpus {
> > +               #address-cells = <2>;
> > +               #size-cells = <0>;
> > +
> > +               cpu@000 {
> > +                       device_type = "cpu";
> > +                       compatible =  "arm,armv8";
> > +                       reg = <0x0 0x000>;
> > +                       enable-method = "psci";
> > +                       /* board 0, socket 0, core 0*/
> > +                       arm,associativity = <0 0 0>;
>
> We should specify w.r.t. memory and CPUs how the property is expected to
> be used (e.g. in the CPU nodes rather than the cpu-map, with separate
> memory nodes, etc). The generic description of arm,associativity isn't
> sufficient to limit confusion there.
>
ok, will add the details like which nodes can use this property.


>
> Thanks,
> Mark.
>

thanks
Ganapat

--047d7b66f97b4e55390520deb313
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mark,<br><br></div>I have tried to answer your com=
ments, in the meantime we are waiting for Ben to share the details.<br><div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Aug 28, =
2015 at 6:02 PM, Mark Rutland <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.=
rutland@arm.com" target=3D"_blank">mark.rutland@arm.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<span class=3D""><br>
On Fri, Aug 14, 2015 at 05:39:32PM +0100, Ganapatrao Kulkarni wrote:<br>
&gt; DT bindings for numa map for memory, cores and IOs using<br>
&gt; arm,associativity device node property.<br>
<br>
</span>Given this is just a copy of ibm,associativity, I&#39;m not sure I s=
ee much<br>
point in renaming the properties.<br>
<br>
However, (somewhat counter to that) I&#39;m also concerned that this isn&#3=
9;t<br>
sufficient for systems we&#39;re beginning to see today (more on that<br>
below), so I don&#39;t think a simple copy of ibm,associativity is good<br>
enough.<br></blockquote><div></div><div>it is just copy right now, however =
it can evolve when we come across more arm64 numa platforms <br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Ganapatrao Kulkarni &lt;<a href=3D"mailto:gkulkarni@cav=
iumnetworks.com">gkulkarni@caviumnetworks.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/bindings/arm/numa.txt | 212 +++++++++++=
++++++++++++++<br>
&gt;=C2=A0 1 file changed, 212 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/arm/numa.tx=
t<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/arm/numa.txt b/Document=
ation/devicetree/bindings/arm/numa.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..dc3ef86<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/arm/numa.txt<br>
&gt; @@ -0,0 +1,212 @@<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +NUMA binding description.<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +1 - Introduction<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +Systems employing a Non Uniform Memory Access (NUMA) architecture con=
tain<br>
&gt; +collections of hardware resources including processors, memory, and I=
/O buses,<br>
&gt; +that comprise what is commonly known as a NUMA node.<br>
&gt; +Processor accesses to memory within the local NUMA node is generally =
faster<br>
&gt; +than processor accesses to memory outside of the local NUMA node.<br>
&gt; +DT defines interfaces that allow the platform to convey NUMA node<br>
&gt; +topology information to OS.<br>
&gt; +<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +2 - arm,associativity<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +The mapping is done using arm,associativity device property.<br>
&gt; +this property needs to be present in every device node which needs to=
 to be<br>
&gt; +mapped to numa nodes.<br>
<br>
</div></div>Can&#39;t there be some inheritance? e.g. all devices on a bus =
with an<br>
arm,associativity property being assumed to share that value?<br></blockquo=
te><div>yes there is inheritance and respective bus drivers should take car=
e of it, like pci driver does at present. <br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<span class=3D""><br>
&gt; +<br>
&gt; +arm,associativity property is set of 32-bit integers which defines le=
vel of<br>
<br>
</span>s/set/list/ -- the order is important.<br></blockquote><div>ok <br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""><br>
&gt; +topology and boundary in the system at which a significant difference=
 in<br>
&gt; +performance can be measured between cross-device accesses within<br>
&gt; +a single location and those spanning multiple locations.<br>
&gt; +The first cell always contains the broadest subdivision within the sy=
stem,<br>
&gt; +while the last cell enumerates the individual devices, such as an SMT=
 thread<br>
&gt; +of a CPU, or a bus bridge within an SoC&quot;.<br>
<br>
</span>While this gives us some hierarchy, this doesn&#39;t seem to encode =
relative<br>
distances at all. That seems like an oversight.<br></blockquote><div><br>di=
stance is computed, will add the details to document.<br>local nodes will h=
ave distance as 10(LOCAL_DISTANCE) and every level, the distance multiplies=
 by 2.<br>for example, for level 1 numa topology, distance from local node =
to remote node will be 20.<br>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Additionally, I&#39;m somewhat unclear on how what you&#39;d be expected to=
<br>
provide for this property in cases like ring or mesh interconnects,<br>
where there isn&#39;t a strict hierarchy (see systems with ARM&#39;s own CC=
N, or<br>
Tilera&#39;s TILE-Mx), but there is some measure of closeness.<br></blockqu=
ote><div><br>IIUC, as per ARMs CCN architecture, all core/clusters are at e=
qual distance of DDR, i dont see any NUMA topology.<br>however, if there ar=
e 2 SoC connected thorough the CCN, then it is very much similar to cavium =
topology.<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv>
Must all of these have the same length? If so, why not have a<br>
#(whatever)-cells property in the root to describe the expected length?<br>
If not, how are they to be interpreted relative to each other?</div></block=
quote><div><br>yes, all are of default size.<br></div><div>IMHO, there is n=
o need to add cells property. <br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"> <br><div>
&gt; +<br>
&gt; +ex:<br>
<br>
s/ex/Example:/, please. There&#39;s no need to contract that.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* board 0, socket 0, cluster 0, core 0=C2=
=A0 thread 0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativity =3D &lt;0 0 0 0 0&gt;;<b=
r>
&gt; +<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +3 - arm,associativity-reference-points<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +This property is a set of 32-bit integers, each representing an index=
 into<br>
<br>
</span>Likeise, s/set/list/<br></div></blockquote><div>ok <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div>
<span class=3D""><br>
&gt; +the arm,associativity nodes. The first integer is the most significan=
t<br>
&gt; +NUMA boundary and the following are progressively less significant bo=
undaries.<br>
&gt; +There can be more than one level of NUMA.<br>
<br>
</span>I&#39;m not clear on why this is necessary; the arm,associativity pr=
operty<br>
is already ordered from most significant to least significant per its<br>
description.<br></div></blockquote><div>=C2=A0</div><div><span class=3D"">f=
irst entry in arm,associativity-reference-points is used to find which <br>=
entry in associativity defines </span>node id. <br>also <span class=3D"">en=
tries in arm,associativity-reference-points defines, <br>how many entries(d=
epth) in associativity can be used to calculate node distance<br></span></d=
iv><div>in both level 1 and=C2=A0 multi level(hierarchical) numa topology.<=
br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
<br>
What does this property achieve?<br>
<br>
The description also doesn&#39;t describe where this property is expected t=
o<br>
live. The example isn&#39;t sufficient to disambiguate that, especially as<=
br>
it seems like a trivial case.<br></div></blockquote><div>sure, will add one=
 more example to describe the=C2=A0 <span class=3D"">arm,associativity-refe=
rence-points</span></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div>
<br>
Is this only expected at the root of the tree? Can it be re-defined in<br>
sub-nodes?<br></div></blockquote><div>yes it is defined only at the root.<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
<br>
&gt; +<br>
&gt; +Ex:<br>
<br>
s/Ex/Example:/, please<br></div></blockquote><div>sure. <br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativity-reference-points =3D &lt=
;0 1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The board Id(index 0) used first to calcul=
ate the associativity (node<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0distance), then follows the=C2=A0 socket i=
d(index 1).<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativity-reference-points =3D &lt=
;1 0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The socket Id(index 1) used first to calcu=
late the associativity,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0then follows the board id(index 0).<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativity-reference-points =3D &lt=
;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Only the board Id(index 0) used to calcula=
te the associativity.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativity-reference-points =3D &lt=
;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Only socket Id(index 1) used to calculate =
the associativity.<br>
&gt; +<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +4 - Example dts<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +Example: 2 Node system consists of 2 boards and each board having one=
 socket<br>
&gt; +and 8 core in each socket.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativity-reference-points =3D &lt=
;0&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memory@00c00000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =
=3D &quot;memory&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x=
0 0x00c00000 0x0 0x80000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* board 0, so=
cket 0, no specific core */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativ=
ity =3D &lt;0 0 0xffff&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memory@10000000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =
=3D &quot;memory&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x=
100 0x00000000 0x0 0x80000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* board 1, so=
cket 0, no specific core */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm,associativ=
ity =3D &lt;1 0 0xffff&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cpus {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells=
 =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =
=3D &lt;0&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu@000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0device_type =3D &quot;cpu&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0compatible =3D=C2=A0 &quot;arm,armv8&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0x0 0x000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0enable-method =3D &quot;psci&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* board 0, socket 0, core 0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0arm,associativity =3D &lt;0 0 0&gt;;<br>
<br>
</div></div>We should specify w.r.t. memory and CPUs how the property is ex=
pected to<br>
be used (e.g. in the CPU nodes rather than the cpu-map, with separate<br>
memory nodes, etc). The generic description of arm,associativity isn&#39;t<=
br>
sufficient to limit confusion there.<br></div></blockquote><div>ok, will ad=
d the details like which nodes can use this property. <br></div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
<br>
Thanks,<br>
Mark.<br>
</div></blockquote></div><br></div><div class=3D"gmail_extra">thanks<br></d=
iv><div class=3D"gmail_extra">Ganapat<br></div></div></div>

--047d7b66f97b4e55390520deb313--
