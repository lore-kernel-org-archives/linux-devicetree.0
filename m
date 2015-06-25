From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] MIPS: BMIPS: bcm7346: add nodes for NAND
Date: Thu, 25 Jun 2015 17:52:37 +0900
Message-ID: <EFAFA0BE-CC2F-4342-9C89-DED8EC6CF377@gmail.com>
References: <cover.1435124524.git.jaedon.shin@gmail.com> <1544bf6110b43fbaa8dbb3b06a18e08ae87b386d.1435124524.git.jaedon.shin@gmail.com> <558B05B7.8010401@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558B05B7.8010401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On Jun 25, 2015, at 4:32 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> +Brian,
> 
> On 23/06/15 23:08, Jaedon Shin wrote:
>> Add NAND device nodes to BMIPS based BCM7346 platform.
>> 
>> Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
> 
> [snip]
> 
>> +
>> +&nand0 {
>> +	status = "okay";
>> +
>> +	nandcs@1 {
>> +		compatible = "brcm,nandcs";
>> +		reg = <1>;
>> +		nand-ecc-step-size = <512>;
>> +		nand-ecc-strength = <8>;
>> +		nand-on-flash-bbt;
>> +
>> +		#size-cells = <2>;
>> +		#address-cells = <2>;
>> +
>> +		flash1.rootfs0@0 {
>> +			reg = <0x0 0x0 0x0 0x80000000>;
>> +		};
>> +
>> +		flash1.rootfs1@80000000 {
>> +			reg = <0x0 0x80000000 0x0 0x80000000>;
>> +		};
>> +	};
>> +};
> 
> Should we create something like brcmnand-cs1-512-8 to reduce the amount
> of duplication between DTS files?
> -- 
> Florian

I Think that is not duplication.

I have no reference boards, but this node is maybe explaining for hardware
description of the BCM97346DBSMB reference board. The nodes are changed by
EBI CS and ECC capabilities of NAND flash. I used brcmnand-cs2-512-4 and
brcmnand-cs1-512-4 for others.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
