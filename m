MIME-Version: 1.0
In-Reply-To: <CAHCPf3s3MsiQyWFOgNJdD9F2JAwi_BVxVZG69zj+bJLzEw9AiA@mail.gmail.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
	<1496851812-19623-2-git-send-email-sudeep.holla@arm.com>
	<CAHCPf3s3MsiQyWFOgNJdD9F2JAwi_BVxVZG69zj+bJLzEw9AiA@mail.gmail.com>
Date: Mon, 12 Jun 2017 16:13:49 -0500
Message-ID: <CAL_JsqLHGaiLvw_nqN_s6BVdeDjp_-oD97dbaqvG_WzrahyrOA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] Documentation: add DT binding for ARM System
 Control and Management Interface(SCMI) protocol
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Matt Sealey <neko@bakuhatsu.net>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 9, 2017 at 1:12 PM, Matt Sealey <neko@bakuhatsu.net> wrote:
> Hullo all,
>
> This is a long one.. apologies for odd linefeeds and so on.
>
> On Wed, Jun 7, 2017 at 11:10 AM, Sudeep Holla <sudeep.holla@arm.com> wrot=
e:
>
>> +Clock/Performance bindings for the clocks/OPPs based on SCMI Message
>> Protocol
>> +------------------------------------------------------------
>> +
>> +This binding uses the common clock binding[1].
>> +
>> +Required properties:
>> +- compatible : shall be "arm,scmi-clocks" or "arm,scmi-perf-domains"
>
> After a little thought, there are a couple objections to be made here.
> Firstly,
> the SCMI protocol families are  discoverable - you only really need to kn=
ow
> that
> it is usable (and where to use it, mboxes etc.) - whether it supports the
> clock
> management, performance domains, power domains et al. protocols is a
> function
> of querying the base protocol for a list.

Unfortunately, being discoverable doesn't really help. Presumably we can di=
scover that clock mgmt is supported, but not clock connections (e.g. the cl=
ock for uart1 is ?). Even if discovering that connection was possible, I do=
n't think we want yet another way to do that on top of platform_data, DT, a=
nd ACPI. Firmware could populate the DT or ACPI tables using the data from =
SCMI though.

> These protocols are identified by a value, several of which are
> standardized,
> some being vendor extension numbers. All protocols must be able to be
> queried
> for information.
>
> As such, defining compatible properties for each protocol is treading tha=
t
> fine
> line of tying device trees to particular driver subsystems and giving
> operating
> systems an ability to ignore any discovery procedure. While I can't make =
a
> case
> for clock management (which should obviously conform with a particular cl=
ock
> management definition in DT, as already defined), there is plenty of past
> evidence
> of bindings for particular devices being mis-used or used in non-intended
> ways
> (regulators as reset GPIOs is the one that immediately came to mind) in l=
ieu
> of a
> more fleshed out way of defining a particular class of device for a bindi=
ng.
> The
> same would be true of tying a 'performance domain' to the concept of cloc=
k
> management.
>
> From the point of view of being able to specify things against a particul=
ar
> binding
> (whatever that might be), one could imagine something that mapped protoco=
ls
> to
> those bindings without introducing compatible names. SCMI ids would be
> verbatim,
> and per-protocol. Things like clock-indices are therefore not relevant an=
d
> defining which indices go with which protocol at the SCMI level isn't nee=
ded
> anymore. It is really up to the protocol how many cells it would need to
> define
> it's protocol behavior but for the purpose of some standardization, we co=
uld
> imagine a binding that defined protocols as such:
>
> scmi: arm_scmi {
>         compatible =3D "arm,scmi,1.0";
>         mboxes =3D <y>;
>         shmem =3D <x>;
>         protocols {
>               scmi_clocks: protocol@0x14 {
>                         #whatever-cells =3D 3;
>                };
>                foo_smic: protocol@0x89 {
>                         #foo-cells =3D 4;
>                         #bar-cells =3D 5;
>                 };
>         };
> };
>
> uart: myuart@80000000 {
>         compatible =3D "arm,pl011";
>         clocks =3D <&foo_smic 3>;
> };

Once you just have nodes with just cell sizes, this can be simplified to:

scmi: arm_scmi {
         compatible =3D "arm,scmi,1.0";
         #clock-cells =3D <1>;
         ...
};

uart: myuart@80000000 {
        compatible =3D "arm,pl011";
        clocks =3D <&smic 3>;
};

Usually, having child nodes and compatibles in cases like this is simply be=
cause people want to have platform devices created for them.

>
> If you manage to get a device tree that specifies a clock but there is no
> protocol 0x89 then you're just as hosed as if you specified an
> arm,scmi-clocks
> node when the protocol was not supported by SCMI itself, so we don't gain
> any
> new dangers, but we do gain the ability to instantiate SCMI, discover
> protocols,
> and then load drivers against those protocols, without duplicating the
> discovery
> process with a hardcoded tree. Device trees, from my point of view, are a
> contract
> between the SoC & board designer and the OS (helped along by firmware,
> hopefully).
> They shouldn't be dictating the driver behavior to be applied at this kin=
d
> of level.
>
> Device trees need to be rock solid - agile development is fine but as soo=
n
> as you ship,
> changing the device tree means cutting off support for existing software,=
 or
> only
> working with augmented features on new software and severely reduced
> functionality
> on old software. That can be as simple as not being able to go to Turbo
> mode, or as
> bad as an inability to apply thermal limits and burning someone's board. =
 If
> we define
> a specific binding of a specific protocol to a specific way of interactin=
g
> with that
> device which is a purely software construct (like treating performance
> domain as an
> bstract clock interface with a particular number of cells or clock-like
> behavior),
> then you lock down protocols to *existing* OS subsystems. That means
> maintaining that
> ubsystem and device tree specification to retain behavior, which is a lot=
 of
> maintaining.
>
> It shouldn't be necessary to actually define which protocols exist and wh=
at
> number of
> cells they use in the device tree binding, because this is actually
> documented
> elsewhere. Just as we do not create compatible properties for new devices
> which work
> the same as old ones, or redefine features which would otherwise be
> ascertained
> by some kind of discovery (PCI devices, USB devices, but even as simple j=
ust
> reading out an ID register from a device to determine if it has a particu=
lar
> feature), we shouldn't do this to lock down a further discovery model for
> activity types or programmers' models under those protocols.
>
> Here's where I fall down: with a variable number of cells per protocol
> required
> (potentially) and no method to be able to assign a particular protocol's
> device
> or functionality to something else, discovery of what maps where has to b=
e
> done
> as well. There's little of that in SCMI, that is to say it wouldn't be
> possible
> to infer that clock_id 20 in protocol 0x14 is the clock that goes with
> cpu@0. It is
> also, per the SCMI spec, a firmware table responsibility to define any
> dependencies
> on other parts of the protocol (for instance, clock trees). The best I ca=
n
> think
> of right now is that this would just have to be done on a global SCMI lev=
el:
>
> scmi: arm_scmi {
>         compatible =3D "arm,scmi,1.0";
>         mboxes =3D <y>;
>         shmem =3D <x>;
>         disable-protocols =3D <0x87, 0x88>; // these are buggy, don't loa=
d
> drivers even if they're implemented
>
>         #whatever-cells =3D 3;
>         required-whatever-prop;
>
>         #foo-cells =3D 4;
>
>         #bar-cells =3D 5;
>         optional-bar-prop =3D <5, 10, 15>;
>
>         #clock-cells =3D 10;
> };
>
> #define SCMI_PROTO_CLOCKMGMT 0x14
> #define SCMI_PROTO_VENDOR_CLOCKS 0x89
> uart: myuart {
>         compatible =3D "arm,pl011";
>         clocks =3D <&scmi SCMI_PROTO_CLOCKMGMT 3 0 0 0 0 0 0 0 0>, <&scmi
> SCMIU_PROTO_VENDOR_CLOCKS 3 4 7 99 0 0 0x9000 3>;
> };
>
> .. it is up to the driver to figure out what exactly this does in real
> life, without having to lock it to the clock et al. binding, but at least
> all
> drivers using protocols must be able to parse the number of cells defined=
.
> If
> a protocol only needs 3 cells, but another needs 10 cells for the same
> thing,
> then both protocols will by definition be defined as 10-cell groups. It
> implies
> hat any device that can be controlled or affected by SCMI can list the
> devices,
> and the protocol driver will be required to parse the remaining cells and
> ignore
> them. As long as the device tree can cover all cases in it's #foo-cells o=
r
> other
> binding properties, it would be most flexible here.
>
> I don't like the lockdown of having to cover every binding that gets used
> whether it's truly for that device type or not, but it would be the most
> flexible
> within the current framework, without defeating discovery.
>
> We would do well to come up with a way of defining abstract interfaces to
> firmware or other processors that don't rely on there being a fixed bindi=
ng
> that dictates what kind of device it is, where there isn't a way of defin=
ing
> that device type in a generic manner. There's no way of doing this right
> now and letting the driver in the OS know what's necessary - well, there =
is,
> things like RTAS support on CHRP got away with this in the old days, and
> PSCI
> does something very similar (which covers quite a lot of CPU management a=
nd
> also system domain activity), so it's not like we've come up against the
> issue
> before. But it's not been resolved when a device node would need to refer
> back
> to those abstraction interface nodes where there's not a reasonable way o=
f
> binding the definition of the reference.
>
> RTAS had a property in every device node that depended on it and would be
> affected by it, "used-by-rtas". Perhaps we could augment devices with an
> "managed-by" property likewise to point to the protocol node.
> #protocol-cells
> might be a nice way of defining cell sizes generically (where protocol wo=
uld
> be the name of the protocol - #scmi-cells perhaps - and the format of
> #scmi-cells would need to include the protocol number). Wrapping that up =
in
> a generic binding means each protocol then gets control of it's own world=
,
> and each device that is affected by that protocol would be able to realiz=
e
> this.
>
> If anyone comes up with a particular PSCI-like protocol for anything here
> that kind of adaptable binding for device/platform abstraction frameworks
> with non-discrete methods of working (i.e. it might not be able to be
> defined
> as "just a clock" or "just a power domain" or "just a thermal framework" =
or
> any combination without reducing functionality that would otherwise come
> from
> some built-in discovery system) would come in very handy.
>
> Just thoughts right now, though. I definitely don't have the whole story
> down,
> but it is definitely something to think about.
>
> Ta,
> Matt Sealey <neko@bakuhatsu.net>
