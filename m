From: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Mon, 17 Nov 2014 11:39:02 -0800
Message-ID: <CAJiQ=7BH8K=Q+JcWTKSfn6xAteOF4B6jahMu_qVd-FyZWD3pjA@mail.gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
 <3480616.V2TMJFc7uE@wuerfel> <CAJiQ=7A29-v5mo1ybvE2UodOZx-FoGeBTHYcTZuX-LaqRaF1Lw@mail.gmail.com>
 <2911624.UJRs5QOPN5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2911624.UJRs5QOPN5@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Fraser <jfraser@broadcom.com>, Dmitry Torokhov <dtor@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 10:46 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 17 November 2014 09:01:02 Kevin Cernekee wrote:
>> On Mon, Nov 17, 2014 at 4:16 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> Under arch/mips/bcm47xx I see a single mach type, but different builds
>> for BMIPS3300 (R1/SSB) versus MIPS 74K (R2/BCMA).
>
> At least in Kconfig, the two are not mutually exclusive, so I assumed
> you could enable them both at the same time.

Ah right, bcm47xx_defconfig doesn't actually enable
CONFIG_CPU_MIPS32_R2.  So it will still run on R1 CPUs like BMIPS3300.
On R2 systems it may lose a few optimizations/features.

I suspect that BCM47xx could use the BMIPS multiplatform kernel, if
somebody was willing to figure out how to convert board.c, leds.c,
etc.

>> > If you wanted to do that however, starting with BMIPS you'd have
>> > to make it possible to define a new platform without the
>> > arch/mips/include/asm/mach-bmips/ directory (this should be possible
>> > already, so the hardest part is done), replace all global function
>> > calls (arch_init_irq, prom_init, get_system_type,  ...) with generic
>> > platform-independent implementations or wrappers around per-platform
>> > callbacks, and move the Kconfig section for CONFIG_BMIPS_MULTIPLATFORM
>> > outside of the "System type" choice statement.
>>
>> Right.  The other question is how much support for legacy non-DT
>> bootloaders really belongs in a true multiplatform kernel, as this
>> stuff gets hairy fast.
>
> Yes, that's why I suggested following PowerPC rather than ARM in this
> regard.  If you move the boot loader abstraction into the decompressor
> instead of the platform code, you can avoid a lot of the problems.

One possible complication: for BCM63xx/BCM7xxx (MIPS) there is no
decompressor in the kernel.  The firmware loads an ELF image into
memory and jumps directly to kernel_entry.
