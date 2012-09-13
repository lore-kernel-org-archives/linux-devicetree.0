From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: specify initrd location using 64-bit
Date: Thu, 13 Sep 2012 16:02:49 -0500
Message-ID: <505249F9.7050201@gmail.com>
References: <1347465937-7056-1-git-send-email-cyril@ti.com> <CAMuHMdUuQzD0bq8PifBea2-0Pk7RhmPA0-GAFprsk+vMxMGjGw@mail.gmail.com> <5050CE33.9060909@ti.com> <5050E965.5080405@linutronix.de> <505107DF.5020105@gmail.com> <5051816A.3050705@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5051816A.3050705@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Cyril Chemparathy <cyril@ti.com>, linux-mips@linux-mips.org, x86@kernel.org, a-jacquiot@ti.com, mahesh@linux.vnet.ibm.com, linus.walleij@linaro.org, grant.likely@secretlab.ca, paul.gortmaker@windriver.com, paulus@samba.org, hpa@zytor.com, m.szyprowski@samsung.com, jonas@southpole.se, linux@arm.linux.org.uk, linux-c6x-dev@linux-c6x.org, nico@linaro.org, david.daney@cavium.com, mingo@redhat.com, Geert Uytterhoeven <geert@linux-m68k.org>, benh@kernel.crashing.org, suzuki@in.ibm.com, linux@openrisc.net, arnd@arndb.de, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, msalter@redhat.com, rob.herring@calxeda.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, blogic@openwrt.org, dhowells@redhat.com, monstr@monstr.eu, linux-kernel@vger.kernel.org, ralf@linux-mips.org, tj@kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 09/13/2012 01:47 AM, Sebastian Andrzej Siewior wrote:
> On 09/13/2012 12:08 AM, Rob Herring wrote:
>>> Geert is right here. If it is a physical address, it should be
>>> phys_addr_t.
>>
>> While generally true, for the DT specific code I think it should be a
>> fixed u64. The size of the address is defined by the FDT, not the
>> kernel. It is very likely we could have a FDT that specifies addresses
>> in 64-bit values, but then we boot a kernel is compiled for !LPAE.
>> phys_addr_t is currently sized based on LPAE setting.
> 
> If your kernel is 32bit without PAE and your DTB address is >32ibt than
> you can't handle it. If you don't notice this in your dt code than you
> remap the wrong memory ioremap().

The size of the initrd fields are set by #address-cells properties and
determined when you create the dtb. The address to load the initrd is
decided by the bootloader/user and set at that point later in time. The
dtb should not be tied to the kernel you are booting. Obviously, if you
want to boot a non-PAE kernel, everything has to be placed at <4GB.

I can boot i386 and i386-pae kernels on an i386-pae machines. I expect
to generally be able to do that on ARM. Perhaps some SOCs like this one
will not allow that, it is not always true.

Rob
