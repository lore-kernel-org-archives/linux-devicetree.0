From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Mon, 17 Nov 2014 21:40:50 +0100
Message-ID: <3357597.nYlNZ6O0nJ@wuerfel>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com> <2911624.UJRs5QOPN5@wuerfel> <CAJiQ=7BH8K=Q+JcWTKSfn6xAteOF4B6jahMu_qVd-FyZWD3pjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAJiQ=7BH8K=Q+JcWTKSfn6xAteOF4B6jahMu_qVd-FyZWD3pjA@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Fraser <jfraser@broadcom.com>, Dmitry Torokhov <dtor@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>
List-Id: devicetree@vger.kernel.org

On Monday 17 November 2014 11:39:02 Kevin Cernekee wrote:
> On Mon, Nov 17, 2014 at 10:46 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 17 November 2014 09:01:02 Kevin Cernekee wrote:
> >> > If you wanted to do that however, starting with BMIPS you'd have
> >> > to make it possible to define a new platform without the
> >> > arch/mips/include/asm/mach-bmips/ directory (this should be possible
> >> > already, so the hardest part is done), replace all global function
> >> > calls (arch_init_irq, prom_init, get_system_type,  ...) with generic
> >> > platform-independent implementations or wrappers around per-platform
> >> > callbacks, and move the Kconfig section for CONFIG_BMIPS_MULTIPLATFORM
> >> > outside of the "System type" choice statement.
> >>
> >> Right.  The other question is how much support for legacy non-DT
> >> bootloaders really belongs in a true multiplatform kernel, as this
> >> stuff gets hairy fast.
> >
> > Yes, that's why I suggested following PowerPC rather than ARM in this
> > regard.  If you move the boot loader abstraction into the decompressor
> > instead of the platform code, you can avoid a lot of the problems.
> 
> One possible complication: for BCM63xx/BCM7xxx (MIPS) there is no
> decompressor in the kernel.  The firmware loads an ELF image into
> memory and jumps directly to kernel_entry.
> 

Right, that complicates it a bit, but is there a reason why a decompressor
would be hard to do, or would be considered a bad thing?
There is already generic decompressor code in arch/mips/boot/compressed/
that I would assume you could use without firmware changes. Are you
worried about boot time overhead?

	Arnd
