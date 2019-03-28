From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Date: Thu, 28 Mar 2019 18:47:21 +0000
Message-ID: <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328131657.GA9056@bogus>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Yash Shah <yash.shah@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob, Yash,

On 28/03/2019 13:16, Rob Herring wrote:
> On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
>> DT documentation for L2 cache controller added.

>> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>> new file mode 100644
>> index 0000000..abce09f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>> @@ -0,0 +1,31 @@
>> +SiFive L2 Cache EDAC driver device tree bindings
>> +-------------------------------------------------
>> +This driver uses the EDAC framework to report L2 cache controller ECC errors.
> 
> Bindings are for h/w blocks, not drivers. (And Boris may want a single 
> driver, but bindings should reflect the h/w, not what Linux (currently) 
> wants.

For h/w block compatibles and edac, I think all we need now is to ensure the DT contains
the three compatible strings: platform (if there is one), soc and ip-name (if its a
re-usable thing).
This is so that linux can pick the biggest of the three (usually platform) to probe the
driver from, as this lets us capture platform properties we only find out about later.

The single-driver idea is because ras/edac gets done late, (its not necessary to boot
linux on the board), and the edac core has difficulty with multiple components feeding
into it.

I don't think we need platform-specific-drivers until someone has a platform that needs
one for this multiple-component issue. To let us do that later (and possibly your
customer's customer to do it), we'd like to avoid probing based on the smallest
compatible, and use the biggest instead.
This lets us remove the platform-compatible from the L2-cache-controller driver's list,
and let some platform driver use it as a library instead. This is to avoid 'but not this
one' checks in the driver.

Yes it results in more one-line patches to enable support in the kernel, but these are
also statements that this platform/soc supports ras/edac. Its possible to build a soc out
of components that all support ras, but not have it working end-to-end.
(oh its optional, was it turned on? Does firmware need to enable something? Is there a
side-band signal, was it wired up everywhere).


> Are the only controls for ECC? Are all the cache attributes discoverable 
> (size, ways, line size, level, etc.)? 

>> +Example:
>> +
>> +cache-controller@2010000 {
>> +	compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";

/me googles
fu540-c000 is the soc, but it doesn't have dram, so it must get used in other platforms.

If there is anything the platform/firmware can influence with this thing please ensure
they have properties in here. (firmware-privilege enables, or pins that have to be tied
high/lwo)

As an example of the problem we're tring to avoid: someone could re-use the design of
"sifive,ccache0" in another soc, where the DRAM controller also supports edac. From just
"sifive,ccache0", they can't tell their system (which needs a multi-component driver) from
yours, which just needs this one.

There may be a clever way of getting DT to do this...


>> +	interrupt-parent = <&plic>;
>> +	interrupts = <1 2 3>;
>> +	reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
>> +	reg-names = "control", "sideband";
>> +};
>> -- 
>> 1.9.1
>>


Thanks,

James
