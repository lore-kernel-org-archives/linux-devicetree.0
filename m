From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v3 3/3] clk: sifive: add a driver for the SiFive FU540
 PRCI IP block
Date: Tue, 30 Apr 2019 00:01:40 -0700
Message-ID: <67a4a4b6-e0d7-efc2-c318-a1138cddc9c7@wdc.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
 <20190411082733.3736-4-paul.walmsley@sifive.com>
 <256b9312-4740-e7b1-84ac-c0cc1ff4bc77@wdc.com>
 <alpine.DEB.2.21.9999.1904292258000.7063@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1904292258000.7063@viisi.sifive.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>, "Wesley W . Terpstra" <wesley@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@sifive.com>, Megan Wachs <megan@sifive.com>
List-Id: devicetree@vger.kernel.org

On 4/29/19 11:20 PM, Paul Walmsley wrote:
> Hi Atish,
> 
> On Sat, 27 Apr 2019, Atish Patra wrote:
> 
>> On 4/11/19 1:28 AM, Paul Walmsley wrote:
>>> Add driver code for the SiFive FU540 PRCI IP block.  This IP block
>>> handles reset and clock control for the SiFive FU540 device and
>>> implements SoC-level clock tree controls and dividers.
> 
> [...]
> 
>>> +static const struct of_device_id sifive_fu540_prci_of_match[] = {
>>> +	{ .compatible = "sifive,fu540-c000-prci", },
>>
>> All the existing unleashed devices have prci clock compatible string as
>> "sifive,aloeprci0" or "sifive,ux00prci0". Should it be added to maintain
>> backward compatibility?
> 
> As you note, just adding the old (unreviewed) compatible string isn't
> enough.
> 
>> Even after adding the compatible string (just for my testing purpose), I get
>> this while booting.
>>
>> [    0.104571] sifive-fu540-prci 10000000.prci: expected only two parent
>> clocks, found 1
>> [    0.112460] sifive-fu540-prci 10000000.prci: could not register clocks: -22
>> [    0.119499] sifive-fu540-prci: probe of 10000000.prci failed with error -22
>>
>> Looking at the DT entries, your DT patch has
>>
>> +		prci: clock-controller@10000000 {
>> +			compatible = "sifive,fu540-c000-prci";
>> +			reg = <0x0 0x10000000 0x0 0x1000>;
>> +			clocks = <&hfclk>, <&rtcclk>;
>> +			#clock-cells = <1>;
>> +		};
>>
>>
>> while current DT from FSBL
>> (https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/ux00_fsbl.dts)
>>
>> prci: prci@10000000 {
>> 			compatible = "sifive,aloeprci0", "sifive,ux00prci0";
>> 			reg = <0x0 0x10000000 0x0 0x1000>;
>> 			reg-names = "control";
>> 			clocks = <&refclk>;
>> 			#clock-cells = <1>;
>> 		};
>>
>> This seems to be the cause of error. It looks like this patch needs a complete
>> different DT (your DT patch) than FSBL provides.
> 
> That's right.  That old data was completely out of tree and unreviewed.
> It's part of the reason why we're going through the process of posting DT
> data to the kernel and devicetree lists and getting that data reviewed:
> 
> https://lore.kernel.org/linux-riscv/20190411084242.4999-1-paul.walmsley@sifive.com/
> 
>> This means everybody must upgrade the FSBL to use your DT patch in their
>> boards once this driver is merged. Is this okay?
> 
> People can continue to use the out-of-tree DT data if they want.  They'll
> just have to continue to patch their kernels to add out-of-tree drivers,
> as they do now.
> 

There were some concerns about the breaking the existing setup in the past.

> Otherwise, if people want to use the upstream PRCI driver in the upstream
> kernel, then it's necessary to use DT data that aligns with what's in the
> upstream binding documentation.
> 

Personally, it makes sense to me. I am okay with upgrading FSBL to 
update the DT once the patches are in mainline. In fact, I used to do 
that for topology patch series. This will help to add any new DT entry 
in future as well.

However, if SiFive can share a prebuilt FSBL image for everybody to 
upgrade, that would be very helpful.

Regards,
Atish
> 
> - Paul
> 
