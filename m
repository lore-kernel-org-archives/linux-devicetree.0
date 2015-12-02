From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
Date: Wed, 2 Dec 2015 12:00:36 -0800
Message-ID: <20151202200036.GL64635@google.com>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop>
 <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com>
 <565F4953.2070206@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565F4953.2070206@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>, bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Dec 02, 2015 at 07:41:07PM +0000, Simon Arlott wrote:
> >> +	nand0: nandcs@0 {
> >> +		compatible = "brcm,nandcs";
> >> +		reg = <0>;
> >> +		nand-on-flash-bbt;
> >> +		nand-ecc-strength = <1>;
> >> +		nand-ecc-step-size = <512>;
> >> +
> >> +		#address-cells = <0>;
> >> +		#size-cells = <0>;
> > 
> > What are these {address,size}-cells for? If you need them for
> > partitioning, then those are wrong -- they shouldn't be zero. Maybe just
> > drop them? (I can cut them out when applying, if that's the only change
> > to make.)
> 
> This is the correct way to do partitioning, there would be a
> "partitions" block with no address/size that contains the partitions as
> child nodes. [Documentation/devicetree/bindings/mtd/partition.txt]

That doc says nothing about {address,size}-cells = 0. When using the new
binding with a 'partitions' subnode, I'm not sure the address
translation specification really matters anyway; the flash space is a
new address space unrelated to the parents, and we don't do any
translation from the 'flash' node to the 'partitions' node. So you don't
need #{address,size}-cells in the flash node, but you do in the
'partitions' node.

> I think they're also implicit so you can just remove those two lines.

>From ePAPR: "The #address-cells and #size-cells properties are not
inherited from ancestors in the device tree. They shall be explicitly
defined."

But we don't want to define them. I'd drop them, at least from the
example, as they're not relevant.

> I've created a bcm963268part driver so there won't need to be any
> partitions in DT for bcm63268.

Just curious, do you plan to submit this driver? We're working on
matching up partition parsers to flash devices via device tree
of_match_table's, so you could do something like this:

	nand0: nandcs@0 {
		compatible = "brcm,nandcs";
		...

		partitions {
			compatible = "brcm,bcm963268-partitions";
			...
		};
	};

FYI.

> >> +	};
> >> +};

Brian
