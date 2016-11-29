From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 12:11:15 +0000
Message-ID: <ba8e2ed3-9798-3074-1167-3f6851321a25@raspberrypi.org>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
 <20161129021131.GD13307@umbus.fritz.box>
 <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org>
 <D3BFA6AB-21C1-451B-ACF5-32EA5E615275@konsulko.com>
 <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0@raspberrypi.org>
 <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Pantelis,

On 29/11/2016 10:55, Pantelis Antoniou wrote:
> Manually adding symbols by targeting __symbols__ is just bad. There is absolutely
> no guarantee that the symbol/fixup node(s) will still be there in following iterations
> of the patches.
Remember that this is now part of the Linux kernel - it isn't something
you can just change at will.
> I am thinking of parsing them, recording the information in kernel structures and then
> deleting them altogether.
>
>> How does your patch handle duplicate symbols?
>>
> It doesn’t. Having duplicate global symbols is bad. 
>
> It appears you want scoping rules instead. Care to paste a concrete example?

Concrete non-trivial examples are hard to come by. There are some simple
cases where we've attached labels to __overlay__ nodes so that the
contents can be patched by our overlay parameter mechanism - they could
just be given unique names instead of just "frag0", "frag1" etc. I'm
more concerned about parameterised macro-expanded overlays.

Consider an overlay that defines a CAN controller on an SPI bus. We
currently have two such overlays in the RPi tree, one for SPI 0.0 and
one for SPI 0.1. Here's an extract from one of them:

    /* the interrupt pin of the can-controller */
    fragment@2 {
        target = <&gpio>;
        __overlay__ {
            can0_pins: can0_pins {
                brcm,pins = <25>;
                brcm,function = <0>; /* input */
            };
        };
    };
...
    fragment@4 {
        target = <&spi0>;
        __overlay__ {
            /* needed to avoid dtc warning */
            #address-cells = <1>;
            #size-cells = <0>;
            can0: mcp2515@0 {
                reg = <0>;
                compatible = "microchip,mcp2515";
                pinctrl-names = "default";
                pinctrl-0 = <&can0_pins>;
                spi-max-frequency = <10000000>;
                interrupt-parent = <&gpio>;
                interrupts = <25 0x2>;
                clocks = <&can0_osc>;
            };
        };
    };

One day I'd like to merge these into a single parameterised version that
could target any CS line on any SPI controller. This requires that any
created node names are unique with the scope of the parent ("mcp2515@0",
"can0_pins"), and that the name of the target label (spi0) is patched to
select the correct SPI bus. Our existing, limited overlay parameter
mechanism uses labels to identify properties to patch:

        spimaxfrequency = <&can0>,"spi-max-frequency:0";

(I would have attached labels to the properties themselves, but that
doesn't seem to work, contrary to the ePAPR spec.)

If the labels that locate the node, property and label names to change
also themselves have to be made unique then that adds an extra level of
complexity.

The parameter application is a pre-processing step before the overlay is
merged, so there is nothing preventing me from filtering the symbols
node before passing it on based on rules of my own choosing, but I
wanted to make more people aware of this change.

Phil
