From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] of: Specify initrd location using 64-bit
Date: Mon, 01 Jul 2013 10:09:34 +0200
Message-ID: <51D1393E.6060001@linutronix.de>
References: <1371775956-16453-1-git-send-email-santosh.shilimkar@ti.com> <51C4171C.9050908@linutronix.de> <51C48B5A.2040404@ti.com> <51CCA67C.2010803@gmail.com> <CACxGe6vOH0sCFVVXrYqD3dbYdOvithVu7-d1cvy5885i8x_Myw@mail.gmail.com> <20130628134931.GD21034@game.jcrosoft.org> <51CE1F92.3070802@ti.com> <51D1345B.8020509@linutronix.de> <CAMuHMdV6YM3-hASqjxkguEukZjnjK80gBjDNiabxjfQtC=c8ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAMuHMdV6YM3-hASqjxkguEukZjnjK80gBjDNiabxjfQtC=c8ag@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-mips <linux-mips@linux-mips.org>, Aurelien Jacquiot <a-jacquiot@ti.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, Jonas Bonn <jonas@southpole.se>, Russell King <linux@arm.linux.org.uk>, linux-c6x-dev@linux-c6x.org, the arch/x86 maintainers <x86@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-xtensa@linux-xtensa.org, James Hogan <james.hogan@imgtec.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.or>
List-Id: devicetree@vger.kernel.org

On 07/01/2013 09:59 AM, Geert Uytterhoeven wrote:
> That's actual the original reason: DT has it as 64 bit, and passes it to a
> 32 bit kernel when running in 32 bit mode without PAE.

And I think the DT code should check if the u64 fits in phys_addr_t and
if does not it should write an error message and act like no initrd was
specified (instead of passing "something" to the architecture).

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Sebastian
