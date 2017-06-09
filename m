Return-Path: <SRS0=qYts=5O=bakuhatsu.net=neko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1496851812-19623-2-git-send-email-sudeep.holla@arm.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com> <1496851812-19623-2-git-send-email-sudeep.holla@arm.com>
From: Matt Sealey <neko@bakuhatsu.net>
Date: Fri, 9 Jun 2017 13:12:50 -0500
Message-ID: <CAHCPf3s3MsiQyWFOgNJdD9F2JAwi_BVxVZG69zj+bJLzEw9AiA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] Documentation: add DT binding for ARM System
 Control and Management Interface(SCMI) protocol
Content-Type: multipart/alternative; boundary="f403045d9aaae3eca005518aeaa0"
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

--f403045d9aaae3eca005518aeaa0
Content-Type: text/plain; charset="UTF-8"

Hullo all,

This is a long one.. apologies for odd linefeeds and so on.

On Wed, Jun 7, 2017 at 11:10 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:

> +Clock/Performance bindings for the clocks/OPPs based on SCMI Message
Protocol
> +------------------------------------------------------------
> +
> +This binding uses the common clock binding[1].
> +
> +Required properties:
> +- compatible : shall be "arm,scmi-clocks" or "arm,scmi-perf-domains"

After a little thought, there are a couple objections to be made here.
Firstly,
the SCMI protocol families are  discoverable - you only really need to know
that
it is usable (and where to use it, mboxes etc.) - whether it supports the
clock
management, performance domains, power domains et al. protocols is a
function
of querying the base protocol for a list.

These protocols are identified by a value, several of which are
standardized,
some being vendor extension numbers. All protocols must be able to be
queried
for information.

As such, defining compatible properties for each protocol is treading that
fine
line of tying device trees to particular driver subsystems and giving
operating
systems an ability to ignore any discovery procedure. While I can't make a
case
for clock management (which should obviously conform with a particular clock
management definition in DT, as already defined), there is plenty of past
evidence
of bindings for particular devices being mis-used or used in non-intended
ways
(regulators as reset GPIOs is the one that immediately came to mind) in
lieu of a
more fleshed out way of defining a particular class of device for a
binding. The
same would be true of tying a 'performance domain' to the concept of clock
management.

>From the point of view of being able to specify things against a particular
binding
(whatever that might be), one could imagine something that mapped protocols
to
those bindings without introducing compatible names. SCMI ids would be
verbatim,
and per-protocol. Things like clock-indices are therefore not relevant and
defining which indices go with which protocol at the SCMI level isn't needed
anymore. It is really up to the protocol how many cells it would need to
define
it's protocol behavior but for the purpose of some standardization, we could
imagine a binding that defined protocols as such:

scmi: arm_scmi {
        compatible = "arm,scmi,1.0";
        mboxes = <y>;
        shmem = <x>;
        protocols {
              scmi_clocks: protocol@0x14 {
                        #whatever-cells = 3;
               };
               foo_smic: protocol@0x89 {
                        #foo-cells = 4;
                        #bar-cells = 5;
                };
        };
};

uart: myuart@80000000 {
        compatible = "arm,pl011";
        clocks = <&foo_smic 3>;
};

If you manage to get a device tree that specifies a clock but there is no
protocol 0x89 then you're just as hosed as if you specified an
arm,scmi-clocks
node when the protocol was not supported by SCMI itself, so we don't gain
any
new dangers, but we do gain the ability to instantiate SCMI, discover
protocols,
and then load drivers against those protocols, without duplicating the
discovery
process with a hardcoded tree. Device trees, from my point of view, are a
contract
between the SoC & board designer and the OS (helped along by firmware,
hopefully).
They shouldn't be dictating the driver behavior to be applied at this kind
of level.

Device trees need to be rock solid - agile development is fine but as soon
as you ship,
changing the device tree means cutting off support for existing software,
or only
working with augmented features on new software and severely reduced
functionality
on old software. That can be as simple as not being able to go to Turbo
mode, or as
bad as an inability to apply thermal limits and burning someone's board.
If we define
a specific binding of a specific protocol to a specific way of interacting
with that
device which is a purely software construct (like treating performance
domain as an
bstract clock interface with a particular number of cells or clock-like
behavior),
then you lock down protocols to *existing* OS subsystems. That means
maintaining that
ubsystem and device tree specification to retain behavior, which is a lot
of maintaining.

It shouldn't be necessary to actually define which protocols exist and what
number of
cells they use in the device tree binding, because this is actually
documented
elsewhere. Just as we do not create compatible properties for new devices
which work
the same as old ones, or redefine features which would otherwise be
ascertained
by some kind of discovery (PCI devices, USB devices, but even as simple just
reading out an ID register from a device to determine if it has a particular
feature), we shouldn't do this to lock down a further discovery model for
activity types or programmers' models under those protocols.

Here's where I fall down: with a variable number of cells per protocol
required
(potentially) and no method to be able to assign a particular protocol's
device
or functionality to something else, discovery of what maps where has to be
done
as well. There's little of that in SCMI, that is to say it wouldn't be
possible
to infer that clock_id 20 in protocol 0x14 is the clock that goes with
cpu@0. It is
also, per the SCMI spec, a firmware table responsibility to define any
dependencies
on other parts of the protocol (for instance, clock trees). The best I can
think
of right now is that this would just have to be done on a global SCMI level:

scmi: arm_scmi {
        compatible = "arm,scmi,1.0";
        mboxes = <y>;
        shmem = <x>;
        disable-protocols = <0x87, 0x88>; // these are buggy, don't load
drivers even if they're implemented

        #whatever-cells = 3;
        required-whatever-prop;

        #foo-cells = 4;

        #bar-cells = 5;
        optional-bar-prop = <5, 10, 15>;

        #clock-cells = 10;
};

#define SCMI_PROTO_CLOCKMGMT 0x14
#define SCMI_PROTO_VENDOR_CLOCKS 0x89
uart: myuart {
        compatible = "arm,pl011";
        clocks = <&scmi SCMI_PROTO_CLOCKMGMT 3 0 0 0 0 0 0 0 0>, <&scmi
SCMIU_PROTO_VENDOR_CLOCKS 3 4 7 99 0 0 0x9000 3>;
};

.. it is up to the driver to figure out what exactly this does in real
life, without having to lock it to the clock et al. binding, but at least
all
drivers using protocols must be able to parse the number of cells defined.
If
a protocol only needs 3 cells, but another needs 10 cells for the same
thing,
then both protocols will by definition be defined as 10-cell groups. It
implies
hat any device that can be controlled or affected by SCMI can list the
devices,
and the protocol driver will be required to parse the remaining cells and
ignore
them. As long as the device tree can cover all cases in it's #foo-cells or
other
binding properties, it would be most flexible here.

I don't like the lockdown of having to cover every binding that gets used
whether it's truly for that device type or not, but it would be the most
flexible
within the current framework, without defeating discovery.

We would do well to come up with a way of defining abstract interfaces to
firmware or other processors that don't rely on there being a fixed binding
that dictates what kind of device it is, where there isn't a way of defining
that device type in a generic manner. There's no way of doing this right
now and letting the driver in the OS know what's necessary - well, there is,
things like RTAS support on CHRP got away with this in the old days, and
PSCI
does something very similar (which covers quite a lot of CPU management and
also system domain activity), so it's not like we've come up against the
issue
before. But it's not been resolved when a device node would need to refer
back
to those abstraction interface nodes where there's not a reasonable way of
binding the definition of the reference.

RTAS had a property in every device node that depended on it and would be
affected by it, "used-by-rtas". Perhaps we could augment devices with an
"managed-by" property likewise to point to the protocol node.
#protocol-cells
might be a nice way of defining cell sizes generically (where protocol would
be the name of the protocol - #scmi-cells perhaps - and the format of
#scmi-cells would need to include the protocol number). Wrapping that up in
a generic binding means each protocol then gets control of it's own world,
and each device that is affected by that protocol would be able to realize
this.

If anyone comes up with a particular PSCI-like protocol for anything here
that kind of adaptable binding for device/platform abstraction frameworks
with non-discrete methods of working (i.e. it might not be able to be
defined
as "just a clock" or "just a power domain" or "just a thermal framework" or
any combination without reducing functionality that would otherwise come
from
some built-in discovery system) would come in very handy.

Just thoughts right now, though. I definitely don't have the whole story
down,
but it is definitely something to think about.

Ta,
Matt Sealey <neko@bakuhatsu.net>

--f403045d9aaae3eca005518aeaa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"monospace,monospace">Hullo all,</font><=
/div><div><font face=3D"monospace,monospace"><br></font></div><div><font fa=
ce=3D"monospace,monospace">This is a long one.. apologies for odd linefeeds=
 and so on.<br><br>On Wed, Jun 7, 2017 at 11:10 AM, Sudeep Holla &lt;<a hre=
f=3D"mailto:sudeep.holla@arm.com">sudeep.holla@arm.com</a>&gt; wrote:<br><b=
r>&gt; +Clock/Performance bindings for the clocks/OPPs based on SCMI Messag=
e Protocol<br>&gt; +-------------------------------------------------------=
-----<br>&gt; +<br>&gt; +This binding uses the common clock binding[1].<br>=
&gt; +<br>&gt; +Required properties:<br>&gt; +- compatible : shall be &quot=
;arm,scmi-clocks&quot; or &quot;arm,scmi-perf-domains&quot;<br><br>After a =
little thought, there are a couple objections to be made here. Firstly,</fo=
nt></div><div><font face=3D"monospace,monospace">the SCMI </font><font face=
=3D"monospace,monospace">protocol families are=C2=A0 discoverable - you onl=
y really need to know that</font></div><div><font face=3D"monospace,monospa=
ce">it is usable (and </font><font face=3D"monospace,monospace">where to us=
e it, mboxes etc.) - whether it supports the clock</font></div><div><font f=
ace=3D"monospace,monospace">management, performance domains, power domains =
et al. protocols is a function</font></div><div><font face=3D"monospace,mon=
ospace">of querying the base protocol for a list.<br><br>These protocols ar=
e identified by a value, several of which are standardized,</font></div><di=
v><font face=3D"monospace,monospace">some being vendor extension numbers. A=
ll protocols must be able to be queried</font></div><div><font face=3D"mono=
space,monospace">for information.<br><br>As such, defining compatible prope=
rties for each protocol is treading that fine</font></div><div><font face=
=3D"monospace,monospace">line of tying device trees to particular driver su=
bsystems and giving operating</font></div><div><font face=3D"monospace,mono=
space">systems an ability to ignore any discovery procedure. While I can&#3=
9;t make a case</font></div><div><font face=3D"monospace,monospace">for clo=
ck management (which should obviously conform with a particular clock</font=
></div><div><font face=3D"monospace,monospace">management definition in DT,=
 as already defined), there is plenty of past evidence</font></div><div><fo=
nt face=3D"monospace,monospace">of bindings for particular devices being mi=
s-used or used in non-intended ways</font></div><div><font face=3D"monospac=
e,monospace">(regulators as reset GPIOs is the one that immediately came to=
 mind) in lieu of a</font></div><div><font face=3D"monospace,monospace">mor=
e fleshed out way of defining a particular class of device for a binding. T=
he</font></div><div><font face=3D"monospace,monospace">same would be true o=
f tying a &#39;performance domain&#39; to the concept of clock management.<=
br><br>From the point of view of being able to specify things against a par=
ticular binding</font></div><div><font face=3D"monospace,monospace">(whatev=
er that might be), one could imagine something that mapped protocols to</fo=
nt></div><div><font face=3D"monospace,monospace">those bindings without int=
roducing compatible names. SCMI ids would be verbatim,</font></div><div><fo=
nt face=3D"monospace,monospace">and per-protocol. Things like clock-indices=
 are therefore not relevant and</font></div><div><font face=3D"monospace,mo=
nospace">defining which indices go with which protocol at the SCMI level is=
n&#39;t needed</font></div><div><font face=3D"monospace,monospace">anymore.=
 It is really up to the protocol how many cells it would need to define</fo=
nt></div><div><font face=3D"monospace,monospace">it&#39;s protocol behavior=
 but for the purpose of some standardization, we could</font></div><div><fo=
nt face=3D"monospace,monospace">imagine a binding that defined protocols as=
 such:<br><br>scmi: arm_scmi {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;arm,scmi,1.0&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 mboxes =3D &lt=
;y&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 shmem =3D &lt;x&gt;;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 protocols {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 scmi_clocks: protocol@0x14 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #whatever-cells =3D 3;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0foo_smic: protocol@0x89 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #foo-cells =3D 4;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=
bar-cells =3D 5;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 };<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>};<br><br>uart: myuart@80000000 {<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,pl011&quot;;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;foo_smic 3&gt;;<br>};<br><br>I=
f you manage to get a device tree that specifies a clock but there is no</f=
ont></div><div><font face=3D"monospace,monospace">protocol 0x89 then you&#3=
9;re just as hosed as if you specified an arm,scmi-clocks </font></div><div=
><font face=3D"monospace,monospace">node when the protocol was not supporte=
d by SCMI itself, so we don&#39;t gain any</font></div><div><font face=3D"m=
onospace,monospace">new dangers, but we do gain the ability to instantiate =
SCMI, discover protocols,</font></div><div><font face=3D"monospace,monospac=
e">and then load drivers against those protocols, without duplicating the d=
iscovery</font></div><div><font face=3D"monospace,monospace">process with a=
 hardcoded tree. Device trees, from my point of view, are a contract</font>=
</div><div><font face=3D"monospace,monospace">between the SoC &amp; board d=
esigner and the OS (helped along by firmware, hopefully).</font></div><div>=
<font face=3D"monospace,monospace">They shouldn&#39;t be dictating the driv=
er behavior to be applied at this kind of level.<br><br>Device trees need t=
o be rock solid - agile development is fine but as soon as you ship,</font>=
</div><div><font face=3D"monospace,monospace">changing the device tree mean=
s cutting off support for existing software, or only</font></div><div><font=
 face=3D"monospace,monospace">working with augmented features on new softwa=
re and severely reduced functionality</font></div><div><font face=3D"monosp=
ace,monospace">on old software. That can be as simple as not being able to =
go to Turbo mode, or as</font></div><div><font face=3D"monospace,monospace"=
>bad as an inability to apply thermal limits and burning someone&#39;s boar=
d.=C2=A0 If we define</font></div><div><font face=3D"monospace,monospace">a=
 specific binding of a specific protocol to a specific way of interacting w=
ith that</font></div><div><font face=3D"monospace,monospace">device which i=
s a purely software construct (like treating performance domain as an </fon=
t></div><div><font face=3D"monospace,monospace">bstract clock interface wit=
h a particular number of cells or clock-like behavior),</font></div><div><f=
ont face=3D"monospace,monospace">then you lock down protocols to *existing*=
 OS subsystems. That means maintaining that </font></div><div><font face=3D=
"monospace,monospace">ubsystem and device tree specification to retain beha=
vior, which is a lot of maintaining.<br><br>It shouldn&#39;t be necessary t=
o actually define which protocols exist and what number of</font></div><div=
><font face=3D"monospace,monospace">cells they use in the device tree bindi=
ng, because this is actually documented</font></div><div><font face=3D"mono=
space,monospace">elsewhere. Just as we do not create compatible properties =
for new devices which work</font></div><div><font face=3D"monospace,monospa=
ce">the same as old ones, or redefine features which would otherwise be asc=
ertained </font></div><div><font face=3D"monospace,monospace">by some kind =
of discovery (PCI devices, USB devices, but even as simple just</font></div=
><div><font face=3D"monospace,monospace">reading out an ID register from a =
device to determine if it has a particular</font></div><div><font face=3D"m=
onospace,monospace">feature), we shouldn&#39;t do this to lock down a furth=
er discovery model for</font></div><div><font face=3D"monospace,monospace">=
activity types or programmers&#39; models under those protocols.<br><br>Her=
e&#39;s where I fall down: with a variable number of cells per protocol req=
uired</font></div><div><font face=3D"monospace,monospace">(potentially) and=
 no method to be able to assign a particular protocol&#39;s device</font></=
div><div><font face=3D"monospace,monospace">or functionality to something e=
lse, discovery of what maps where has to be done</font></div><div><font fac=
e=3D"monospace,monospace">as well. There&#39;s little of that in SCMI, that=
 is to say it wouldn&#39;t be possible </font></div><div><font face=3D"mono=
space,monospace">to infer that clock_id 20 in protocol 0x14 is the clock th=
at goes with cpu@0. It is</font></div><div><font face=3D"monospace,monospac=
e">also, per the SCMI spec, a firmware table responsibility to define any d=
ependencies</font></div><div><font face=3D"monospace,monospace">on other pa=
rts of the protocol (for instance, clock trees). The best I can think</font=
></div><div><font face=3D"monospace,monospace">of right now is that this wo=
uld just have to be done on a global SCMI level:<br><br>scmi: arm_scmi {<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,scmi,1.0&quot;;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mboxes =3D &lt;y&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shmem =3D &lt;x&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 disable-protocol=
s =3D &lt;0x87, 0x88&gt;; // these are buggy, don&#39;t load drivers even i=
f they&#39;re implemented<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 #whatever-cell=
s =3D 3;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 required-whatever-prop;<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #foo-cells =3D 4;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 #bar-cells =3D 5;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 optional-bar-prop =3D =
&lt;5, 10, 15&gt;;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 #clock-cells =3D 10;<=
br>};<br><br>#define SCMI_PROTO_CLOCKMGMT 0x14<br>#define SCMI_PROTO_VENDOR=
_CLOCKS 0x89<br>uart: myuart {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;arm,pl011&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&a=
mp;scmi SCMI_PROTO_CLOCKMGMT 3 0 0 0 0 0 0 0 0&gt;, &lt;&amp;scmi SCMIU_PRO=
TO_VENDOR_CLOCKS 3 4 7 99 0 0 0x9000 3&gt;;<br>};<br><br>.. it is up to the=
 driver to figure out what exactly this does in real</font></div><div><font=
 face=3D"monospace,monospace">life, without having to lock it to the clock =
et al. binding, but at least all</font></div><div><font face=3D"monospace,m=
onospace">drivers using protocols must be able to parse the number of cells=
 defined. If</font></div><div><font face=3D"monospace,monospace">a protocol=
 only needs 3 cells, but another needs 10 cells for the same thing,</font><=
/div><div><font face=3D"monospace,monospace">then both protocols will by de=
finition be defined as 10-cell groups. It implies </font></div><div><font f=
ace=3D"monospace,monospace">hat any device that can be controlled or affect=
ed by SCMI can list the devices,</font></div><div><font face=3D"monospace,m=
onospace">and the protocol driver will be required to parse the remaining c=
ells and ignore</font></div><div><font face=3D"monospace,monospace">them. A=
s long as the device tree can cover all cases in it&#39;s #foo-cells or oth=
er</font></div><div><font face=3D"monospace,monospace">binding properties, =
it would be most flexible here.<br><br>I don&#39;t like the lockdown of hav=
ing to cover every binding that gets used</font></div><div><font face=3D"mo=
nospace,monospace">whether it&#39;s truly for that device type or not, but =
it would be the most flexible</font></div><div><font face=3D"monospace,mono=
space">within the current framework, without defeating discovery.<br><br>We=
 would do well to come up with a way of defining abstract interfaces to</fo=
nt></div><div><font face=3D"monospace,monospace">firmware or other processo=
rs that don&#39;t rely on there being a fixed binding</font></div><div><fon=
t face=3D"monospace,monospace">that dictates what kind of device it is, whe=
re there isn&#39;t a way of defining</font></div><div><font face=3D"monospa=
ce,monospace">that device type in a generic manner. There&#39;s no way of d=
oing this right</font></div><div><font face=3D"monospace,monospace">n</font=
><font face=3D"monospace,monospace">ow and letting the driver in the OS kno=
w what&#39;s necessary - well, there is,</font></div><div><font face=3D"mon=
ospace,monospace">things like RTAS support on CHRP got away with this in th=
e old days, and PSCI </font></div><div><font face=3D"monospace,monospace">d=
oes something very similar (which covers quite a lot of CPU management and<=
/font></div><div><font face=3D"monospace,monospace">also system domain acti=
vity), so it&#39;s not like we&#39;ve come up against the issue</font></div=
><div><font face=3D"monospace,monospace">before. </font><font face=3D"monos=
pace,monospace">But it&#39;s not been resolved when a device node would nee=
d to refer back</font></div><div><font face=3D"monospace,monospace">to </fo=
nt><font face=3D"monospace,monospace">those abstraction interface nodes whe=
re there&#39;s not a reasonable way of</font></div><div><font face=3D"monos=
pace,monospace">binding the definition of the reference.<br><br>RTAS had a =
property in every device node that depended on it and would be</font></div>=
<div><font face=3D"monospace,monospace">affected by it, &quot;used-by-rtas&=
quot;. Perhaps we could augment devices with an</font></div><div><font face=
=3D"monospace,monospace">&quot;managed-by&quot; property likewise to point =
to the protocol node. #protocol-cells</font></div><div><font face=3D"monosp=
ace,monospace">might be a nice way of defining=C2=A0cell sizes generically=
=C2=A0(where protocol would</font></div><div><font face=3D"monospace,monosp=
ace">be the name of the protocol - #scmi-cells perhaps - and the format of<=
/font></div><div><font face=3D"monospace,monospace">#scmi-cells would need =
to include the protocol number). Wrapping that up in</font></div><div><font=
 face=3D"monospace,monospace">a generic binding means each protocol then ge=
ts control of it&#39;s own world,</font></div><div><font face=3D"monospace,=
monospace">and each device that is affected by that protocol would be able =
to realize this.</font></div><div><font face=3D"monospace,monospace"><br></=
font></div><div><font face=3D"monospace,monospace">If anyone comes up with =
a particular PSCI-like protocol for anything here</font></div><div><font fa=
ce=3D"monospace,monospace">that kind of adaptable binding for device/platfo=
rm abstraction frameworks</font></div><div><font face=3D"monospace,monospac=
e">with non-discrete methods of working (i.e. it might not be able to be de=
fined</font></div><div><font face=3D"monospace,monospace">as &quot;just a c=
lock&quot; or &quot;just a power domain&quot; or &quot;just a thermal frame=
work&quot; or</font></div><div><font face=3D"monospace,monospace">any combi=
nation without reducing functionality that would otherwise come from</font>=
</div><div><font face=3D"monospace,monospace">some built-in discovery syste=
m) would come in very handy.</font></div><div><font face=3D"monospace,monos=
pace"><br></font></div><div><font face=3D"monospace,monospace">Just thought=
s right now, though. I definitely don&#39;t have the whole story down,</fon=
t></div><div><font face=3D"monospace,monospace">but it is definitely someth=
ing to think about.<br><br>Ta,<br>Matt Sealey &lt;<a href=3D"mailto:neko@ba=
kuhatsu.net">neko@bakuhatsu.net</a>&gt;</font></div></div>

--f403045d9aaae3eca005518aeaa0--
