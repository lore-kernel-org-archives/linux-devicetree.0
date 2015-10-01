Return-Path: <gpkulkarni@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1443661547.2828.40.camel@kernel.crashing.org>
References: <1439570374-4079-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1439570374-4079-3-git-send-email-gkulkarni@caviumnetworks.com>
	<20150828123228.GE31748@leverpostej>
	<CAFpQJXWzM644KsFWP9ei-k6gWgNVpBVT+UbY7NYdyfmyL=zMkw@mail.gmail.com>
	<CAFpQJXWFx2dQ_vv0POqkOiLe3eh9Ee=Sf+2Xx_08Vp=E4g6gLQ@mail.gmail.com>
	<20150930105331.GA10066@leverpostej>
	<CAFpQJXVegqortRLK+g7_9p82KMYwq0hg8n3_9bJqjGHsJvngaA@mail.gmail.com>
	<1443661547.2828.40.camel@kernel.crashing.org>
Date: Thu, 1 Oct 2015 10:41:27 +0530
Message-ID: <CAFpQJXXKcwks0iZN+3B=U0-9uYKFpAXcZE90GCHN9WyM45Hdpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] Documentation: arm64/arm: dt bindings for numa.
From: Ganapatrao Kulkarni <gpkulkarni@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bae44624a72c105210414ee
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "Prasun.Kapoor@caviumnetworks.com" <Prasun.Kapoor@caviumnetworks.com>, Rob Herring <robherring2@gmail.com>, "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "leif.lindholm@linaro.org" <leif.lindholm@linaro.org>, "rfranz@cavium.com" <rfranz@cavium.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "msalter@redhat.com" <msalter@redhat.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "steve.capper@linaro.org" <steve.capper@linaro.org>, "hanjun.guo@linaro.org" <hanjun.guo@linaro.org>, "al.stone@linaro.org" <al.stone@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Marc Zyngier <Marc.Zyngier@arm.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bae44624a72c105210414ee
Content-Type: text/plain; charset=UTF-8

Hi Ben,


On Thu, Oct 1, 2015 at 6:35 AM, Benjamin Herrenschmidt <
benh@kernel.crashing.org> wrote:

> On Wed, 2015-09-30 at 23:20 +0530, Ganapatrao Kulkarni wrote:
> > Hi Ben,
>
> Before I dig in more (short on time right now), PAPR (at least a chunk
> of it) was released publicly:
>
> https://members.openpowerfoundation.org/document/dl/469
>
thanks a lot for sharing this document.
i went through the chapter 15 of this doc which explains an example on
hierarchical numa topology.
i still could not represent the ring/mesh numa topology using
associativity, which will be present in other upcoming arm64 platforms.


> (You don't need to be a member nor to sign up to get it)
>
> Cheers,
> Ben.
>
> > On Wed, Sep 30, 2015 at 4:23 PM, Mark Rutland <mark.rutland@arm.com>
> > wrote:
> > > On Tue, Sep 29, 2015 at 09:38:04AM +0100, Ganapatrao Kulkarni
> > > wrote:
> > > > (sending again, by mistake it was set to html mode)
> > > >
> > > > On Tue, Sep 29, 2015 at 2:05 PM, Ganapatrao Kulkarni
> > > > <gpkulkarni@gmail.com> wrote:
> > > > > Hi Mark,
> > > > >
> > > > > I have tried to answer your comments, in the meantime we are
> > > > > waiting for Ben
> > > > > to share the details.
> > > > >
> > > > > On Fri, Aug 28, 2015 at 6:02 PM, Mark Rutland <
> > > > > mark.rutland@arm.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Fri, Aug 14, 2015 at 05:39:32PM +0100, Ganapatrao Kulkarni
> > > > > > wrote:
> > > > > > > DT bindings for numa map for memory, cores and IOs using
> > > > > > > arm,associativity device node property.
> > > > > >
> > > > > > Given this is just a copy of ibm,associativity, I'm not sure
> > > > > > I see much
> > > > > > point in renaming the properties.
> > > > > >
> > > > > > However, (somewhat counter to that) I'm also concerned that
> > > > > > this isn't
> > > > > > sufficient for systems we're beginning to see today (more on
> > > > > > that
> > > > > > below), so I don't think a simple copy of ibm,associativity
> > > > > > is good
> > > > > > enough.
> > > > >
> > > > > it is just copy right now, however it can evolve when we come
> > > > > across more
> > > > > arm64 numa platforms
> > >
> > > Whatever we do I suspect we'll have to evolve it as new platforms
> > > appear. As I mentioned there are contemporary NUMA ARM64 platforms
> > > (e.g.
> > > those with CCN) that I don't think we can ignore now given we'll
> > > have to
> > > cater for them.
> > >
> > > > > > > +==========================================================
> > > > > > > ====================
> > > > > > > +2 - arm,associativity
> > > > > > >
> > > > > > > +==========================================================
> > > > > > > ====================
> > > > > > > +The mapping is done using arm,associativity device
> > > > > > > property.
> > > > > > > +this property needs to be present in every device node
> > > > > > > which needs to
> > > > > > > to be
> > > > > > > +mapped to numa nodes.
> > > > > >
> > > > > > Can't there be some inheritance? e.g. all devices on a bus
> > > > > > with an
> > > > > > arm,associativity property being assumed to share that value?
> > > > >
> > > > > yes there is inheritance and respective bus drivers should take
> > > > > care of it,
> > > > > like pci driver does at present.
> > >
> > > Ok.
> > >
> > > That seems counter to my initial interpretation of the wording that
> > > the
> > > property must be present on device nodes that need to be mapped to
> > > NUMA
> > > nodes.
> > >
> > > Is there any simple way of describing the set of nodes that need
> > > this
> > > property?
> > >
> > > > > > > +topology and boundary in the system at which a significant
> > > > > > > difference
> > > > > > > in
> > > > > > > +performance can be measured between cross-device accesses
> > > > > > > within
> > > > > > > +a single location and those spanning multiple locations.
> > > > > > > +The first cell always contains the broadest subdivision
> > > > > > > within the
> > > > > > > system,
> > > > > > > +while the last cell enumerates the individual devices,
> > > > > > > such as an SMT
> > > > > > > thread
> > > > > > > +of a CPU, or a bus bridge within an SoC".
> > > > > >
> > > > > > While this gives us some hierarchy, this doesn't seem to
> > > > > > encode relative
> > > > > > distances at all. That seems like an oversight.
> > > > >
> > > > >
> > > > > distance is computed, will add the details to document.
> > > > > local nodes will have distance as 10(LOCAL_DISTANCE) and every
> > > > > level, the
> > > > > distance multiplies by 2.
> > > > > for example, for level 1 numa topology, distance from local
> > > > > node to remote
> > > > > node will be 20.
> > >
> > > This seems arbitrary.
> > >
> > > Why not always have this explicitly described?
> > >
> > > > > > Additionally, I'm somewhat unclear on how what you'd be
> > > > > > expected to
> > > > > > provide for this property in cases like ring or mesh
> > > > > > interconnects,
> > > > > > where there isn't a strict hierarchy (see systems with ARM's
> > > > > > own CCN, or
> > > > > > Tilera's TILE-Mx), but there is some measure of closeness.
> > > > >
> > > > >
> > > > > IIUC, as per ARMs CCN architecture, all core/clusters are at
> > > > > equal distance
> > > > > of DDR, i dont see any NUMA topology.
> > >
> > > The CCN is a ring interconnect, so CPU clusters (henceforth CPUs)
> > > can be
> > > connected with differing distances to RAM instances (or devices).
> > >
> > > Consider the simplified network below:
> > >
> > >   +-------+      +--------+      +-------+
> > >   | CPU 0 |------| DRAM A |------| CPU 1 |
> > >   +-------+      +--------+      +-------+
> > >       |                              |
> > >       |                              |
> > >   +--------+                     +--------+
> > >   | DRAM B |                     | DRAM C |
> > >   +--------+                     +--------+
> > >       |                              |
> > >       |                              |
> > >   +-------+      +--------+      +-------+
> > >   | CPU 2 |------| DRAM D |------| CPU 3 |
> > >   +-------+      +--------+      +-------+
> > >
> > > In this case CPUs and DRAMs are spaced evenly on the ring, but the
> > > distance between an arbitrary CPU and DRAM is not uniform.
> > >
> > > CPU 0 can access DRAM A or DRAM B with a single hop, but accesses
> > > to
> > > DRAM C or DRAM D take three hops.
> > >
> > > An access from CPU 0 to DRAM C could contend with accesses from CPU
> > > 1 to
> > > DRAM D, as they share hops on the ring.
> > >
> > > There is definitely a NUMA topology here, but there's not a strict
> > > hierarchy. I don't see how you would represent this with the
> > > proposed
> > > binding.
> > can you please explain, how associativity property will represent
> > this
> > numa topology?
>
Hi Mark,

i am thinking, if we could not address(or becomes complex)  these
topologies using associativity,
we should think of an alternate binding which suits existing and upcoming
arm64 platforms.
can we think of below numa binding which is inline with ACPI and will
address all sort of topologies!

i am proposing as below,

1. introduce "proximity" node property. this property will be
present in dt nodes like memory, cpu, bus and devices(like associativity
property) and
will tell which numa node(proximity domain) this dt node belongs to.

examples:
               cpu@000 {
                        device_type = "cpu";
                        compatible = "cavium,thunder", "arm,armv8";
                        reg = <0x0 0x000>;
                        enable-method = "psci";
                        proximity = <0>;
                };
               cpu@001 {
                        device_type = "cpu";
                        compatible = "cavium,thunder", "arm,armv8";
                        reg = <0x0 0x001>;
                        enable-method = "psci";
                        proximity = <1>;
                };

       memory@00000000 {
                device_type = "memory";
                reg = <0x0 0x01400000 0x3 0xFEC00000>;
                proximity =<0>;

        };

        memory@10000000000 {
                device_type = "memory";
                reg = <0x100 0x00400000 0x3 0xFFC00000>;
                proximity =<1>;
        };

pcie0@0x8480,00000000 {
                compatible = "cavium,thunder-pcie";
                device_type = "pci";
                msi-parent = <&its>;
                bus-range = <0 255>;
                #size-cells = <2>;
                #address-cells = <3>;
                #stream-id-cells = <1>;
                reg = <0x8480 0x00000000 0 0x10000000>;  /*Configuration
space */
                ranges = <0x03000000 0x8010 0x00000000 0x8010 0x00000000
0x70 0x00000000>, /* mem ranges */
                         <0x03000000 0x8300 0x00000000 0x8300 0x00000000
0x500 0x00000000>;
               proximity =<0>;
        };


2. Introduce new dt node "proximity-map" which will capture the NxN numa
node distance matrix.

for example,  4 nodes connected in mesh/ring structure as,
A(0) <connected to> B(1) <connected to> C(2) <connected to> D(3) <connected
to> A(1)

relative distance would be,
      A -> B = 20
      B -> C  = 20
      C -> D = 20
      D -> A = 20
      A -> C = 40
      B -> D = 40

and dt presentation for this distance matrix is :

       proximity-map {
             node-count = <4>;
             distance-matrix = <0 0  10>,
                                <0 1  20>,
                                <0 2  40>,
                                <0 3  20>,
                                <1 0  20>,
                                <1 1  10>,
                                <1 2  20>,
                                <1 3  40>,
                                <2 0  40>,
                                <2 1  20>,
                                <2 2  10>,
                                <2 3  20>,
                                <3 0  20>,
                                <3 1  40>,
                                <3 2  20>,
                                <3 3  10>;
          }

the entries like < 0 0 > < 1 1>  < 2 2> < 3 3> can be optional and code can
put default value(local distance).
the entries like <1 0> can be optional if <0 1> and <1 0> are of same
distance.


> >
> > > Likewise for the mesh networks (e.g. that of TILE-Mx)
> > >
> > > > > however, if there are 2 SoC connected thorough the CCN, then it
> > > > > is very much
> > > > > similar to cavium topology.
> > > > >
> > > > > > Must all of these have the same length? If so, why not have a
> > > > > > #(whatever)-cells property in the root to describe the
> > > > > > expected length?
> > > > > > If not, how are they to be interpreted relative to each
> > > > > > other?
> > > > >
> > > > >
> > > > > yes, all are of default size.
> > >
> > > Where that size is...?
> > >
> > > > > IMHO, there is no need to add cells property.
> > >
> > > That might be the case, but it's unclear from the documentation. I
> > > don't
> > > see how one would parse / verify values currently.
> > >
> > > > > > > +the arm,associativity nodes. The first integer is the most
> > > > > > > significant
> > > > > > > +NUMA boundary and the following are progressively less
> > > > > > > significant
> > > > > > > boundaries.
> > > > > > > +There can be more than one level of NUMA.
> > > > > >
> > > > > > I'm not clear on why this is necessary; the arm,associativity
> > > > > > property
> > > > > > is already ordered from most significant to least significant
> > > > > > per its
> > > > > > description.
> > > > >
> > > > >
> > > > > first entry in arm,associativity-reference-points is used to
> > > > > find which
> > > > > entry in associativity defines node id.
> > > > > also entries in arm,associativity-reference-points defines,
> > > > > how many entries(depth) in associativity can be used to
> > > > > calculate node
> > > > > distance
> > > > > in both level 1 and  multi level(hierarchical) numa topology.
> > >
> > > I think this needs a more thorough description; I don't follow the
> > > current one.
> > >
> > > > > > Is this only expected at the root of the tree? Can it be re
> > > > > > -defined in
> > > > > > sub-nodes?
> > > > >
> > > > > yes it is defined only at the root.
> > >
> > > This needs to be stated explicitly.
> > >
> > > I see that this being the case, *,associativity-reference-points
> > > would
> > > be a more powerful property than the #(whatever)-cells property I
> > > mentioned earlier, but a more thorough description is required.
> > >
> > > Thanks,
> > > Mark.
> > thanks
> > Ganapat
>

thanks
Ganapat

--047d7bae44624a72c105210414ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ben,<br><br></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Thu, Oct 1, 2015 at 6:35 AM, Benjamin Herrensc=
hmidt <span dir=3D"ltr">&lt;<a href=3D"mailto:benh@kernel.crashing.org" tar=
get=3D"_blank">benh@kernel.crashing.org</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Wed, 2015-09-30 at 23:20 +0530, =
Ganapatrao Kulkarni wrote:<br>
&gt; Hi Ben,<br>
<br>
Before I dig in more (short on time right now), PAPR (at least a chunk<br>
of it) was released publicly:<br>
<br>
<a href=3D"https://members.openpowerfoundation.org/document/dl/469" rel=3D"=
noreferrer" target=3D"_blank">https://members.openpowerfoundation.org/docum=
ent/dl/469</a><br></blockquote><div>thanks a lot for sharing this document.=
<br></div><div>i went through the chapter 15 of this doc which explains an =
example on hierarchical numa topology.<br></div><div>i still could not repr=
esent the ring/mesh numa topology using associativity, which will be presen=
t in other upcoming arm64 platforms.<br><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
(You don&#39;t need to be a member nor to sign up to get it)<br>
<br>
Cheers,<br>
Ben.<br>
<div class=3D""><div class=3D"h5"><br>
&gt; On Wed, Sep 30, 2015 at 4:23 PM, Mark Rutland &lt;<a href=3D"mailto:ma=
rk.rutland@arm.com">mark.rutland@arm.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Tue, Sep 29, 2015 at 09:38:04AM +0100, Ganapatrao Kulkarni<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; (sending again, by mistake it was set to html mode)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, Sep 29, 2015 at 2:05 PM, Ganapatrao Kulkarni<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:gpkulkarni@gmail.com">gpkulkarni@gmail=
.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; Hi Mark,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I have tried to answer your comments, in the meantime w=
e are<br>
&gt; &gt; &gt; &gt; waiting for Ben<br>
&gt; &gt; &gt; &gt; to share the details.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Fri, Aug 28, 2015 at 6:02 PM, Mark Rutland &lt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:mark.rutland@arm.com">mark.rutland@ar=
m.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Fri, Aug 14, 2015 at 05:39:32PM +0100, Ganapatr=
ao Kulkarni<br>
&gt; &gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; DT bindings for numa map for memory, cores an=
d IOs using<br>
&gt; &gt; &gt; &gt; &gt; &gt; arm,associativity device node property.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Given this is just a copy of ibm,associativity, I&=
#39;m not sure<br>
&gt; &gt; &gt; &gt; &gt; I see much<br>
&gt; &gt; &gt; &gt; &gt; point in renaming the properties.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; However, (somewhat counter to that) I&#39;m also c=
oncerned that<br>
&gt; &gt; &gt; &gt; &gt; this isn&#39;t<br>
&gt; &gt; &gt; &gt; &gt; sufficient for systems we&#39;re beginning to see =
today (more on<br>
&gt; &gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; below), so I don&#39;t think a simple copy of ibm,=
associativity<br>
&gt; &gt; &gt; &gt; &gt; is good<br>
&gt; &gt; &gt; &gt; &gt; enough.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; it is just copy right now, however it can evolve when w=
e come<br>
&gt; &gt; &gt; &gt; across more<br>
&gt; &gt; &gt; &gt; arm64 numa platforms<br>
&gt; &gt;<br>
&gt; &gt; Whatever we do I suspect we&#39;ll have to evolve it as new platf=
orms<br>
&gt; &gt; appear. As I mentioned there are contemporary NUMA ARM64 platform=
s<br>
&gt; &gt; (e.g.<br>
&gt; &gt; those with CCN) that I don&#39;t think we can ignore now given we=
&#39;ll<br>
&gt; &gt; have to<br>
&gt; &gt; cater for them.<br>
&gt; &gt;<br>
</div></div><span class=3D"im">&gt; &gt; &gt; &gt; &gt; &gt; +=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; +2 - arm,associativity<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
</span><div class=3D""><div class=3D"h5">&gt; &gt; &gt; &gt; &gt; &gt; +The=
 mapping is done using arm,associativity device<br>
&gt; &gt; &gt; &gt; &gt; &gt; property.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +this property needs to be present in every d=
evice node<br>
&gt; &gt; &gt; &gt; &gt; &gt; which needs to<br>
&gt; &gt; &gt; &gt; &gt; &gt; to be<br>
&gt; &gt; &gt; &gt; &gt; &gt; +mapped to numa nodes.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Can&#39;t there be some inheritance? e.g. all devi=
ces on a bus<br>
&gt; &gt; &gt; &gt; &gt; with an<br>
&gt; &gt; &gt; &gt; &gt; arm,associativity property being assumed to share =
that value?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; yes there is inheritance and respective bus drivers sho=
uld take<br>
&gt; &gt; &gt; &gt; care of it,<br>
&gt; &gt; &gt; &gt; like pci driver does at present.<br>
&gt; &gt;<br>
&gt; &gt; Ok.<br>
&gt; &gt;<br>
&gt; &gt; That seems counter to my initial interpretation of the wording th=
at<br>
&gt; &gt; the<br>
&gt; &gt; property must be present on device nodes that need to be mapped t=
o<br>
&gt; &gt; NUMA<br>
&gt; &gt; nodes.<br>
&gt; &gt;<br>
&gt; &gt; Is there any simple way of describing the set of nodes that need<=
br>
&gt; &gt; this<br>
&gt; &gt; property?<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +topology and boundary in the system at which=
 a significant<br>
&gt; &gt; &gt; &gt; &gt; &gt; difference<br>
&gt; &gt; &gt; &gt; &gt; &gt; in<br>
&gt; &gt; &gt; &gt; &gt; &gt; +performance can be measured between cross-de=
vice accesses<br>
&gt; &gt; &gt; &gt; &gt; &gt; within<br>
&gt; &gt; &gt; &gt; &gt; &gt; +a single location and those spanning multipl=
e locations.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +The first cell always contains the broadest =
subdivision<br>
&gt; &gt; &gt; &gt; &gt; &gt; within the<br>
&gt; &gt; &gt; &gt; &gt; &gt; system,<br>
&gt; &gt; &gt; &gt; &gt; &gt; +while the last cell enumerates the individua=
l devices,<br>
&gt; &gt; &gt; &gt; &gt; &gt; such as an SMT<br>
&gt; &gt; &gt; &gt; &gt; &gt; thread<br>
&gt; &gt; &gt; &gt; &gt; &gt; +of a CPU, or a bus bridge within an SoC&quot=
;.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; While this gives us some hierarchy, this doesn&#39=
;t seem to<br>
&gt; &gt; &gt; &gt; &gt; encode relative<br>
&gt; &gt; &gt; &gt; &gt; distances at all. That seems like an oversight.<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; distance is computed, will add the details to document.=
<br>
&gt; &gt; &gt; &gt; local nodes will have distance as 10(LOCAL_DISTANCE) an=
d every<br>
&gt; &gt; &gt; &gt; level, the<br>
&gt; &gt; &gt; &gt; distance multiplies by 2.<br>
&gt; &gt; &gt; &gt; for example, for level 1 numa topology, distance from l=
ocal<br>
&gt; &gt; &gt; &gt; node to remote<br>
&gt; &gt; &gt; &gt; node will be 20.<br>
&gt; &gt;<br>
&gt; &gt; This seems arbitrary.<br>
&gt; &gt;<br>
&gt; &gt; Why not always have this explicitly described?<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Additionally, I&#39;m somewhat unclear on how what=
 you&#39;d be<br>
&gt; &gt; &gt; &gt; &gt; expected to<br>
&gt; &gt; &gt; &gt; &gt; provide for this property in cases like ring or me=
sh<br>
&gt; &gt; &gt; &gt; &gt; interconnects,<br>
&gt; &gt; &gt; &gt; &gt; where there isn&#39;t a strict hierarchy (see syst=
ems with ARM&#39;s<br>
&gt; &gt; &gt; &gt; &gt; own CCN, or<br>
&gt; &gt; &gt; &gt; &gt; Tilera&#39;s TILE-Mx), but there is some measure o=
f closeness.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; IIUC, as per ARMs CCN architecture, all core/clusters a=
re at<br>
&gt; &gt; &gt; &gt; equal distance<br>
&gt; &gt; &gt; &gt; of DDR, i dont see any NUMA topology.<br>
&gt; &gt;<br>
&gt; &gt; The CCN is a ring interconnect, so CPU clusters (henceforth CPUs)=
<br>
&gt; &gt; can be<br>
&gt; &gt; connected with differing distances to RAM instances (or devices).=
<br>
&gt; &gt;<br>
&gt; &gt; Consider the simplified network below:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0+-------+=C2=A0 =C2=A0 =C2=A0 +--------+=C2=A0 =C2=A0=
 =C2=A0 +-------+<br>
&gt; &gt;=C2=A0 =C2=A0| CPU 0 |------| DRAM A |------| CPU 1 |<br>
&gt; &gt;=C2=A0 =C2=A0+-------+=C2=A0 =C2=A0 =C2=A0 +--------+=C2=A0 =C2=A0=
 =C2=A0 +-------+<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt; &gt;=C2=A0 =C2=A0+--------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+--------+<br>
&gt; &gt;=C2=A0 =C2=A0| DRAM B |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| DRAM C |<br>
&gt; &gt;=C2=A0 =C2=A0+--------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+--------+<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt; &gt;=C2=A0 =C2=A0+-------+=C2=A0 =C2=A0 =C2=A0 +--------+=C2=A0 =C2=A0=
 =C2=A0 +-------+<br>
&gt; &gt;=C2=A0 =C2=A0| CPU 2 |------| DRAM D |------| CPU 3 |<br>
&gt; &gt;=C2=A0 =C2=A0+-------+=C2=A0 =C2=A0 =C2=A0 +--------+=C2=A0 =C2=A0=
 =C2=A0 +-------+<br>
&gt; &gt;<br>
&gt; &gt; In this case CPUs and DRAMs are spaced evenly on the ring, but th=
e<br>
&gt; &gt; distance between an arbitrary CPU and DRAM is not uniform.<br>
&gt; &gt;<br>
&gt; &gt; CPU 0 can access DRAM A or DRAM B with a single hop, but accesses=
<br>
&gt; &gt; to<br>
&gt; &gt; DRAM C or DRAM D take three hops.<br>
&gt; &gt;<br>
&gt; &gt; An access from CPU 0 to DRAM C could contend with accesses from C=
PU<br>
&gt; &gt; 1 to<br>
&gt; &gt; DRAM D, as they share hops on the ring.<br>
&gt; &gt;<br>
&gt; &gt; There is definitely a NUMA topology here, but there&#39;s not a s=
trict<br>
&gt; &gt; hierarchy. I don&#39;t see how you would represent this with the<=
br>
&gt; &gt; proposed<br>
&gt; &gt; binding.<br>
&gt; can you please explain, how associativity property will represent<br>
&gt; this<br>
&gt; numa topology?<br></div></div></blockquote><div>Hi Mark, <br><br></div=
><div>i am thinking, if we could not address(or becomes complex)=C2=A0 thes=
e topologies using associativity, <br>we should think of an alternate bindi=
ng which suits existing and upcoming arm64 platforms.<br>can we think of be=
low numa binding which is inline with ACPI and will address all sort of top=
ologies!<br><br>i am proposing as below,<br><br>1. introduce &quot;proximit=
y&quot; node property. this property will be<br>present in dt nodes like me=
mory, cpu, bus and devices(like associativity property) and <br>will tell w=
hich numa node(proximity domain) this dt node belongs to.<br><br>examples:<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 cpu@000 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 device_type =3D &quot;cpu&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;cavium,thun=
der&quot;, &quot;arm,armv8&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x000&gt;;<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable-method =3D &quot;ps=
ci&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 proximity =3D &lt;0&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu@001 =
{<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devic=
e_type =3D &quot;cpu&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;cavium,thunder&quot;, &quot;arm,=
armv8&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 reg =3D &lt;0x0 0x001&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable-method =3D &quot;psci&quot;;<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proximity =3D &lt=
;1&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
memory@00000000 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_type =3D &quot;memory&quot;;<br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x01400000 0x3 0xFEC00000&gt;;<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 proximity =3D&lt;0&gt;;<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 };<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory@10000=
000000 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_type =3D &quot;memory&quot;;<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 reg =3D &lt;0x100 0x00400000 0x3 0xFFC00000&gt;;<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 proximity =3D&lt;1&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
;<br><br>pcie0@0x8480,00000000 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;ca=
vium,thunder-pcie&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_type =3D &quot;pci&quo=
t;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 msi-parent =3D &lt;&amp;its&gt;;<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bus-range =3D &lt;0 255&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D &lt;2&g=
t;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D &lt;3&gt;;<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 #stream-id-cells =3D &lt;1&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x8480 0x00=
000000 0 0x10000000&gt;;=C2=A0 /*Configuration space */<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ranges =3D &lt;0x03000000 0x8010 0x00000000 0x8010 0x00000000 0x70 0x00000=
000&gt;, /* mem ranges */<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &lt;0x03000000 0x8300 0x00000000 0x8300 0x00000000=
 0x500 0x00000000&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proximity =3D&lt;0&gt;;<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br><br><br>2. Introduce new dt node &q=
uot;proximity-map&quot; which will capture the NxN numa<br>node distance ma=
trix.<br><br>for example,=C2=A0 4 nodes connected in mesh/ring structure as=
, <br>A(0) &lt;connected to&gt; B(1) &lt;connected to&gt; C(2) &lt;connecte=
d to&gt; D(3) &lt;connected to&gt; A(1)<br><br>relative distance would be,<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A -&gt; B =3D 20<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 B -&gt; C=C2=A0 =3D 20<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C -&gt; =
D =3D 20<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D -&gt; A =3D 20<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 A -&gt; C =3D 40<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B -&g=
t; D =3D 40<br><br>and dt presentation for this distance matrix is :<br><br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proximity-map {<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node-count =3D &lt;4=
&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 distance-matrix =3D &lt;0 0=C2=A0 10&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &lt;0 1=C2=A0 20&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &lt;0 2=C2=A0 40&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;0 3=
=C2=A0 20&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;1 0=C2=A0 20&gt;=
,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;1 1=C2=A0 10&gt;,<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;1 2=C2=A0 20&gt;,<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &lt;1 3=C2=A0 40&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &lt;2 0=C2=A0 40&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;2=
 1=C2=A0 20&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;2 2=C2=A0 10&=
gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;2 3=C2=A0 20&gt;,<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;3 0=C2=A0 20&gt;,<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &lt;3 1=C2=A0 40&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &lt;3 2=C2=A0 20&gt;,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &l=
t;3 3=C2=A0 10&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }<br><br>the entries like &lt; 0 0 &gt; &lt; 1 1&gt;=C2=A0 &lt; 2 2&gt;=
 &lt; 3 3&gt; can be optional and code can put default value(local distance=
).<br>the entries like &lt;1 0&gt; can be optional if &lt;0 1&gt; and &lt;1=
 0&gt; are of same distance.<br><br><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div class=3D""><div class=3D"h5">
&gt; &gt;<br>
&gt; &gt; Likewise for the mesh networks (e.g. that of TILE-Mx)<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; however, if there are 2 SoC connected thorough the CCN,=
 then it<br>
&gt; &gt; &gt; &gt; is very much<br>
&gt; &gt; &gt; &gt; similar to cavium topology.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Must all of these have the same length? If so, why=
 not have a<br>
&gt; &gt; &gt; &gt; &gt; #(whatever)-cells property in the root to describe=
 the<br>
&gt; &gt; &gt; &gt; &gt; expected length?<br>
&gt; &gt; &gt; &gt; &gt; If not, how are they to be interpreted relative to=
 each<br>
&gt; &gt; &gt; &gt; &gt; other?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; yes, all are of default size.<br>
&gt; &gt;<br>
&gt; &gt; Where that size is...?<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; IMHO, there is no need to add cells property.<br>
&gt; &gt;<br>
&gt; &gt; That might be the case, but it&#39;s unclear from the documentati=
on. I<br>
&gt; &gt; don&#39;t<br>
&gt; &gt; see how one would parse / verify values currently.<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +the arm,associativity nodes. The first integ=
er is the most<br>
&gt; &gt; &gt; &gt; &gt; &gt; significant<br>
&gt; &gt; &gt; &gt; &gt; &gt; +NUMA boundary and the following are progress=
ively less<br>
&gt; &gt; &gt; &gt; &gt; &gt; significant<br>
&gt; &gt; &gt; &gt; &gt; &gt; boundaries.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +There can be more than one level of NUMA.<br=
>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m not clear on why this is necessary; the ar=
m,associativity<br>
&gt; &gt; &gt; &gt; &gt; property<br>
&gt; &gt; &gt; &gt; &gt; is already ordered from most significant to least =
significant<br>
&gt; &gt; &gt; &gt; &gt; per its<br>
&gt; &gt; &gt; &gt; &gt; description.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; first entry in arm,associativity-reference-points is us=
ed to<br>
&gt; &gt; &gt; &gt; find which<br>
&gt; &gt; &gt; &gt; entry in associativity defines node id.<br>
&gt; &gt; &gt; &gt; also entries in arm,associativity-reference-points defi=
nes,<br>
&gt; &gt; &gt; &gt; how many entries(depth) in associativity can be used to=
<br>
&gt; &gt; &gt; &gt; calculate node<br>
&gt; &gt; &gt; &gt; distance<br>
&gt; &gt; &gt; &gt; in both level 1 and=C2=A0 multi level(hierarchical) num=
a topology.<br>
&gt; &gt;<br>
&gt; &gt; I think this needs a more thorough description; I don&#39;t follo=
w the<br>
&gt; &gt; current one.<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Is this only expected at the root of the tree? Can=
 it be re<br>
&gt; &gt; &gt; &gt; &gt; -defined in<br>
&gt; &gt; &gt; &gt; &gt; sub-nodes?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; yes it is defined only at the root.<br>
&gt; &gt;<br>
&gt; &gt; This needs to be stated explicitly.<br>
&gt; &gt;<br>
&gt; &gt; I see that this being the case, *,associativity-reference-points<=
br>
&gt; &gt; would<br>
&gt; &gt; be a more powerful property than the #(whatever)-cells property I=
<br>
&gt; &gt; mentioned earlier, but a more thorough description is required.<b=
r>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Mark.<br>
&gt; thanks<br>
&gt; Ganapat<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">thanks<=
br></div><div class=3D"gmail_extra">Ganapat<br></div></div>

--047d7bae44624a72c105210414ee--
