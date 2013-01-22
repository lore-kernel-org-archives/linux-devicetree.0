From: Michal Simek <michal.simek@xilinx.com>
Subject: arm: Kernel failures when several memory banks are used with starting
 address above 128MB
Date: Tue, 22 Jan 2013 20:18:13 +0100
Message-ID: <CAHTX3dJZxuoz_0Eaa7QcoK9bF4LdLuWcDcwK3OUKc6qY_0PeuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Simek <monstr@monstr.eu>, Stephen Warren <swarren@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, John Williams <jwilliams@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi,

I have a question regarding to the case where DTS specify one memory bank
for example <0x0 0x40000000> with CONFIG_ARM_PATCH_PHYS_VIRT=y
where the kernel can be loaded at a 16MB boundary.
I was testing it on the 3.8-rc4 on arm zynq.

1. If the kernel is loaded within 0 - 127MB memory then the kernel can
work with the whole
1GB memory. It shows that the memory in front of the kernel is also
available for the kernel.

2. If the kernel is loaded on the higher addresses then it fails by
these error messages.
"Ignoring RAM at 00000000-3fffffff (vmalloc region overlap).
Memory policy: ECC disabled, Data cache writeback
Kernel panic - not syncing: ERROR: Failed to allocate 0x1000 bytes below 0x0."

3. If I use several memory banks solution
for example
reg = <0 0x10000000 0x10000000 0x30000000>;
and the kernel is loaded to 0x10008000 then the first memory bank is
ignored and kernel will boot.
"Ignoring RAM at 00000000-0fffffff (vmalloc region overlap)." with
768MB of memory.

4. The next interesting example is description with 3 memory banks.
reg = <0 0x10000000 0x10000000 0x20000000 0x30000000 0x10000000>;
which behaves as point 3. It means the first 128MB is ignored and only
768MB of ram is available.


The real question is how the kernel should behave for these situations.
I would expect that if the kernel is within one memory bank
then it will use this whole bank
Or
I would expect that the memory which is in front of the kernel start address
will be simple ignored and the kernel will find out which memory bank
is used and will use it.
Not just caused kernel panic.
Or
Is there any expectation that you have to run the relocatable kernel
in the first 128MB of the memory
or changing DTS depending on the kernel position where it is loaded?


For me is important to solve the case 2 above which can be easily
solved in mm/mmu.c in sanity_check_meminfo
where bank->start and bank->size will be setup depends on kernel position.



Another interesting case is to enable highmem. Kernel starts from
0x10008000 with one memory bank
reg = <0x10000000 0x30000000>; which works without any problem

But for the same case (enable highmem. Kernel starts from 0x10008000.)
with two memory banks.
reg = <0 0x10000000 0x10000000 0x30000000>; is failing with this error.
"Machine: Xilinx Zynq Platform, model: Zynq ZC702 Development Board
bootconsole [earlycon0] enabled
Memory policy: ECC disabled, Data cache writeback
Kernel panic - not syncing: ERROR: Failed to allocate 0x1000 bytes below 0x0."

Also this is the case which quite weird because kernel with higmem on
wants to use the first memory
bank and then failed. My proposed solution is to ignore all memory
banks which are in front of the kernel
which ensure that these


Thanks for your comments,
Michal
