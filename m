From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Fri, 20 Oct 2017 18:46:17 +0100
Message-ID: <CACxGe6tJfcnwDB=m7GLnCeDSc4Srxqssv+-p1+zapDo2yLWXXQ@mail.gmail.com>
References: <1506628736.28192.9.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506628736.28192.9.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 8:58 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hello again,
>
> Significant progress has been made on yamldt and is now capable of
> not only generating yaml from DTS source but also compiling DTS sources
> and being almost fully compatible with DTC.
>
> Compiling the kernel's DTBs using yamldt is as simple as using a
> DTC=yamldt.
>
> Error reporting is accurate and validation against a YAML based schema
> works as well. In a short while I will begin posting patches with
> fixes on bindings and DTS files in the kernel.
>
> Please try it on your platform and report if you encounter any problems.
>
> https://github.com/pantoniou/yamldt
>
> I am eagerly awaiting for your comments.

Hi Pantelis,

This is good work. I've played around with it and I'm looking forward
to chatting next week.

One thing I've done is tried loading the output YAML files into
another YAML interpreter and the current encoding causes problems.
Specifically, in yamldt anchors/aliases are being used as a
replacement for labels/phandles, but that conflicts with the YAML data
model which defines a reference as a way to make a copy of the data
appear in another part of the tree. For example, for the following
snippit:

intc: intc@10000 {
    #interrupt-cells = <1>;
    compatible = "acme,intc";
    reg = <0x10000 0x1000>;
    gpio-controller;
};

serial@20000 {
    compatible = "acme,uart";
    reg = <0x20000 0x1000>;
    interrupt-parent = <&intc>;
    interrupts = <5>;
};

yamldt will encode this as:

intc@10000: &intc
    "#interrupt-cells": 1
    compatible: acme,intc
    reg: [0x10000, 0x1000]
    gpio-controller:

serial@20000:
    compatible: acme,uart
    reg: [0x20000, 0x1000]
    interrupt-parent: *intc
    interrupts: 5

But, the expected behaviour for a YAML parser is expand the alias
'*intc' which results in the following structure:

intc@10000: &intc
    "#interrupt-cells": 1
    compatible: acme,intc
    reg: [0x10000, 0x1000]
    gpio-controller:

serial@20000:
    compatible: acme,uart
    reg: [0x20000, 0x1000]
    interrupt-parent:
        "#interrupt-cells": 1
        compatible: acme,intc
        reg: [0x10000, 0x1000]
        gpio-controller:
    interrupts: 5

See? It results in the entire interrupt controller node to appear as
an instance under the interrupt-parent property, when the intention is
only to create a phandle. yamldt should not redefine the behaviour of
'*' aliases. Instead, it should use a different indicator, either
using an explicit !phandle tag, or by replacing '*' with something
else. I worked around it in my tests by replacing '*' with '$'.

Plus, it would be useful to use normal YAML anchors/aliases for
creating node templates. For example:

serial-template: &acme-uart . # The anchor for the template
    compatible: acme,uart
    interrupt-parent: *intc

root:
    serial@20000:
        <<: *acme-uart   # Alias node merged into serial@20000
        interrupts: 5
        reg: [0x20000, 0x1000]
    serial@30000:
        <<: *acme-uart   # Alias node merged into serial@30000
        interrupts: 5
        reg: [0x30000, 0x1000]

Another problem with anchors/references is YAML seems to require the
anchor to be defined before the reference, or at least that's what
pyyaml and ruamel both expect. Regardless, The chosen YAML encoding
should be readily consumable by existing yaml implementations without
having to do a lot of customization.

I'm slightly concerned about using & anchors for labels because it
seems only one anchor can be defined per node, but DTC allows multiple
labels for a single node. This might not be an issue in practice
though. Another implementation issue related to using & anchors is the
YAML spec defines them as an encoding artifact, and parsers can
discard the anchor names after parsing the YAML structure, which is a
problem if we use something like $name to reference an anchor. The
solution might just be that labels need to go into a special property
so they don't disappear from the data stream.

There appears to be no place to put metadata. The root of the tree is
the top level of the YAML structure. There isn't any provision for
having a top level object to hold things like the memreserve map. We
may need a namespace to use for special properties that aren't nodes
or properties.

The encoding differentiates between nodes and properties implicitly
base on whether the contents are a map, or a scalar/list. This does
mean any parser needs to do a bit more work and it may impact what can
be done with validation (I'm not going to talk about validation in
this email though. We'll talk next week.)

Cheers,
g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
