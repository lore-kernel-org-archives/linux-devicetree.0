From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
Date: Thu, 11 Apr 2019 14:52:22 -0700
Message-ID: <3cf7f2d8-3039-7dd7-e243-77433b1f23a6@wdc.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411114616.GA10032@infradead.org>
 <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>, Christoph Hellwig <hch@infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 4/11/19 2:12 PM, Paul Walmsley wrote:
> On Thu, 11 Apr 2019, Christoph Hellwig wrote:
> 
>> On Thu, Apr 11, 2019 at 01:42:59AM -0700, Paul Walmsley wrote:
>>> Similar to ARM64, add support for building DTB files from DT source
>>> data for RISC-V boards.
>>>
>>> This patch starts with the infrastructure needed for SiFive boards.
>>> Boards from other vendors would add support here in a similar form.
>>
>> What do we build it for?  We'd really need something like this:
>>
>> http://git.infradead.org/users/hch/misc.git/commitdiff/d6242aa147baf57e05e2932199c74d8d24b9926e
>> http://git.infradead.org/users/hch/misc.git/commitdiff/0cd5413c8094ab57b68e0629dacfed695f4c1ef1
>>
>> To actually use the DT files.
> 
> Those patches might be useful - I have not reviewed them closely - but
> they are not necessary.
> 
> The FSBL already supplies a DTB to Linux.  I assume the U-boot port works
> the same way.
> 

I am bit confused here. I thought the idea behind putting the the DTS in 
kernel so that Kernel don't need to depend on DT passed from boot 
loaders. Currently, DTB passed from FSBL is modified by OpenSBI/BBL 
before passing to U-Boot or Linux.

If Linux kernel can boot from the DTS contained within its source code 
as is, that would be much more helpful.

> I haven't switched to U-boot yet for these driver tests, so I personally
> have been using the open-source FSBL (freedom-u540-c000-bootloader) with
> the following trivial patches applied:
> 
> https://github.com/sifive/freedom-u540-c000-bootloader/tree/dev/paulw/supply-fsbl-dtb-v5.1-rc4
>


> The fsbl/ux00_fsbl.dtb file can be symlinked to the kernel DTB output,
> e.g., ~/linux/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dtb.
> 
> 

This assumes that FSBL has to be rebuilt every time I want to change the 
DT. I was hoping to avoid that.

Regards,
Atish

> - Paul
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
