From: Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
Date: Wed, 2 Dec 2015 19:41:07 +0000
Message-ID: <565F4953.2070206@simon.arlott.org.uk>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151202190555.GJ64635@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>, bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: devicetree@vger.kernel.org

On 02/12/15 19:05, Brian Norris wrote:
> + Broadcom list + Kamal
> 
> On Tue, Nov 24, 2015 at 08:19:37PM -0000, Simon Arlott wrote:
>> Add device tree binding for NAND on the BCM63268.
>> 
>> The BCM63268 has a NAND interrupt register with combined status and enable
>> registers.
>> 
>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> ---
>>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> index 4ff7128..f2a71c8 100644
>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> @@ -72,6 +72,14 @@ we define additional 'compatible' properties and associated register resources w
>>         and enable registers
>>       - reg-names: (required) "nand-int-base"
>> 
>> +   * "brcm,nand-bcm63268"
>> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
> 
> Looks like you're aiming to support bcm63168? Is bcm63268 the first
> chip to include this style of register then? The numbering seems
> backwards, but that may just be reality.

Yes, I have a BCM963168VX (BCM63168) but all the Broadcom code refers to
this SoC as BCM63268. This is the only one with these registers in the
source code of similar MIPS that I have.


https://github.com/lp0/bcm963xx_4.12L.06B_consumer/blob/master/bcmdrivers/opensource/char/board/bcm963xx/impl1/board.c#L6595

int kerSysGetChipId() {
...
        /* Force BCM63168, BCM63169, and BCM63269 to be BCM63268) */
        if( ( (r & 0xffffe) == 0x63168 )
          || ( (r & 0xffffe) == 0x63268 ))
            r = 0x63268;

>> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
>> +       and enable registers, and boot address registers
>> +     - reg-names: (required) "nand-intr-base"
>> +     - clock: (required) reference to the clock for the NAND controller
>> +     - clock-names: (required) "nand"
>> +
>>     * "brcm,nand-iproc"
>>       - reg: (required) the "IDM" register range, for interrupt enable and APB
>>         bus access endianness configuration, and the "EXT" register range,
>> @@ -148,3 +156,30 @@ nand@f0442800 {
>>  		};
>>  	};
>>  };
>> +
>> +nand@10000200 {
>> +	compatible = "brcm,nand-bcm63168", "brcm,nand-bcm63268",
>> +		"brcm,brcmnand-v4.0", "brcm,brcmnand";
>> +	reg = <0x10000200 0x180>,
>> +	      <0x10000600 0x200>,
>> +	      <0x100000b0 0x10>;
>> +	reg-names = "nand", "nand-cache", "nand-intr-base";
>> +	interrupt-parent = <&periph_intc>;
>> +	interrupts = <50>;
>> +	clocks = <&periph_clk 20>;
>> +	clock-names = "nand";
>> +
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	nand0: nandcs@0 {
>> +		compatible = "brcm,nandcs";
>> +		reg = <0>;
>> +		nand-on-flash-bbt;
>> +		nand-ecc-strength = <1>;
>> +		nand-ecc-step-size = <512>;
>> +
>> +		#address-cells = <0>;
>> +		#size-cells = <0>;
> 
> What are these {address,size}-cells for? If you need them for
> partitioning, then those are wrong -- they shouldn't be zero. Maybe just
> drop them? (I can cut them out when applying, if that's the only change
> to make.)

This is the correct way to do partitioning, there would be a
"partitions" block with no address/size that contains the partitions as
child nodes. [Documentation/devicetree/bindings/mtd/partition.txt]

I think they're also implicit so you can just remove those two lines.

I've created a bcm963268part driver so there won't need to be any
partitions in DT for bcm63268.

>> +	};
>> +};
> 
> Brian
> 


-- 
Simon Arlott
