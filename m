From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Mon, 02 Oct 2017 22:46:20 +0300
Message-ID: <1506973580.17981.5.camel@hp800z>
References: <1506628736.28192.9.camel@hp800z>
         <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Sun, 2017-10-01 at 17:00 -0500, Rob Herring wrote:
> On Thu, Sep 28, 2017 at 2:58 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
> > Hello again,
> >
> > Significant progress has been made on yamldt and is now capable of
> > not only generating yaml from DTS source but also compiling DTS sources
> > and being almost fully compatible with DTC.
> 
> Can you quantify "almost"?
> 
> > Compiling the kernel's DTBs using yamldt is as simple as using a
> > DTC=yamldt.
> 
> Good.
> 
> >
> > Error reporting is accurate and validation against a YAML based schema
> > works as well. In a short while I will begin posting patches with
> > fixes on bindings and DTS files in the kernel.
> 
> What I would like to see is the schema format posted for review.
> 

I'm including the skeleton.yaml binding which is the template for
the bindings and a board-example.yaml binding for a top level binding.

> I would also like to see the bindings for top-level compatible strings
> (aka boards) as an example. That's something that's simple enough that
> I'd think we could agree on a format and start moving towards defining
> board bindings that way.
> 

Note there is some line wrapping I'm including a link
to the github repo of the files:


The skeleton.yaml 

https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/bindings/skeleton.yaml

%YAML 1.1
---
# The name of the binding is first
# The anchor is put there for use by others
skeleton: &skeleton

  version: 1

  id: skel-device

  title: >
    Skeleton Device

  maintainer:
    name: Skeleton Person <skel@kernel.org>

  description: >
    The Skeleton Device binding represents the SK11 device produced by
    the Skeleton Corporation. The binding can also support compatible
    clones made by second source vendors.

  # The class is an optional property that declares this
  # binding as part of a larger set
  # Multiple definitions are possible
  class: [ device, spi-device ]

  # This binding inherits property characteristics from the generic
  # spi-slave binding
  # Note that the notation is standard yaml reference
  inherits: *spi-slave

  # virtual bindings do not generate checkers
  virtual: true

  # each property is defined by each name
  properties:

    # The compatible property is a reserved name. The type is always
"string"
    # and should not be repeated device binding.
    compatible:
      category: required        # required property
      type: strseq              # is a sequence of strings

      description: >
        FX11 is a clone of the original SK11 device

      # v is always the name of the value of the property
      # np is passed to the checker and is the current
      # node pointer. We can access properties and call
      # methods that operate on them.
      # There can be multiple constraints, just put them
      # into a sequence.
      # Note that the BASE("skel,sk11") form from the previous
      # binding will have to be reworked.
      constraint: |
        anystreq(v, "skel,sk11") ||
        anystreq(v, "faux,fx11")

    # The reg property is a reserved name. The type is always "int" and
    # should not be repeated in a device binding. Constraints are
defined
    # only in the context of the parent node's address, size, and ranges
    # cells. The description is inherited from the spi-slave binding.
    # Note that if inheriting from a base binding this declaration may
    # be omitted.
    reg:
      category: required        # required property
      type: intseq              # is a sequence of integers

    # spi-max-frequency needs the device-specific constraint to be
supplied
    spi-max-frequency:
      # this constraint is dependent on the compatible property
      # property containing "skel,sk11"
      constraint: |
        v <= anystreq(get_strseq(np, "compatible"), "skel,sk11") ?
10000000 : 1000000

    # This property overrides the generic binding description with
    # a device specific description in order to mention the chip's
    # h/w cfg strapping pins.
    spi-cs-high:
      description: >
        Set if skeleton device configuration pins are set for chip
        select polarity high

    # Device specific properties don't inherit characteristic from a
generic
    # binding so category, type, constraint, and description must be
specified
    # if needed.
    skel,deprecated1:
      # note that the category may be declare more than one option
      category: [ deprecated, optional ]
      type: int
      constraint: |
        v >= 100000 && v <= 200000
      description: >
        First of two deprecated properties.

    # There are no constraints for properties of empty type
    skel,deprecated2:
      category: deprecated
      type: empty
      description: >
        Second of two deprecated properties.

    # This example could be auto-generated rather than explicitly
included
    # in the yaml source.
    # Note that the YAML example must be validated against this binding
    # to be an accepted entry
    example:

      dts: |
        sk11@0 {
            compatible = "skel,sk11";
            reg = <0>;
            spi-max-frequency = <1000000>;
            spi-cs-high;
        };

      yaml: |
        sk11@0:
          compatible: "skel,sk11"
          reg: 0
          sip-max-frequency: 1000000
          spi-cs-high: true
        ---
...

And board-example.yaml

https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/bindings/board-example.yaml

%YAML 1.1
---
board-example: &board-example
  version: 1

  title: A board example using compatible and model properties

  maintainer:
    name: Skeleton Person <skel@kernel.org>

  class: board

  # this binding is selected when the compatible property constraint
matches
  selected: "compatible"

  description: >
    A board binding example. Matches on a top-level compatible string
and model.

  properties:

    compatible:
      category: required
      type: strseq
      description: |
        Compatible strings for the board example.
        The depth of the node must be zero, i.e. root.

      constraint: |
        get_depth(np) == 0 && ( 
        anystreq(v, "example,evm") ||
        anystreq(v, "example,evm2") ||
        anystreq(v, "example,base"))

    model:
      category: required
      type: str
      description: models that this board family supports
      constraint: |
        streq(v, "Example EVM") ||
        streq(v, "Example EVM2")

  example:
    dts: |
      / {
          compatible = "example,evm", "example,base";
          model = "Example EVM";
      };
    yaml: |
      compatible: [ "example,evm", "example,base" ] ;
      model: "Example EVM";

As you see it's almost identical to what you've originally posted.

> Rob
