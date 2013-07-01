From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] of: Specify initrd location using 64-bit
Date: Mon, 1 Jul 2013 09:58:35 -0400
Message-ID: <51D18B0B.1060906@ti.com>
References: <1371775956-16453-1-git-send-email-santosh.shilimkar@ti.com> <51C4171C.9050908@linutronix.de> <51C48B5A.2040404@ti.com> <51CCA67C.2010803@gmail.com> <CACxGe6vOH0sCFVVXrYqD3dbYdOvithVu7-d1cvy5885i8x_Myw@mail.gmail.com> <20130628134931.GD21034@game.jcrosoft.org> <51CE1F92.3070802@ti.com> <51D1345B.8020509@linutronix.de> <CAMuHMdV6YM3-hASqjxkguEukZjnjK80gBjDNiabxjfQtC=c8ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-mips <linux-mips@linux-mips.org>, Aurelien Jacquiot <a-jacquiot@ti.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, Jonas Bonn <jonas@southpole.se>, Russell King <linux@arm.linux.org.uk>, linux-c6x-dev@linux-c6x.org, the arch/x86 maintainers <x86@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-xtensa@linux-xtensa.org, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Monday 01 July 2013 03:59 AM, Geert Uytterhoeven wrote:
> On Mon, Jul 1, 2013 at 9:48 AM, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
>> On 06/29/2013 01:43 AM, Santosh Shilimkar wrote:
>>> Apart from waste of 32bit, what is the other concern you
>>> have ?
>>
>> You pass a u64 as a physical address which is represented in other
>> parts of the kernel (for a good reason) by phys_addr_t.
>>
>>> I really want to converge on this patch because it
>>> has been a open ended discussion for quite some time. Does
>>> that really break any thing on x86 or your concern is more
>>> from semantics of the physical address.
>> You want to have your code in so you can continue with your work, that
>> is okay. The other two arguments why u64 here is a good thing was "due
>> to what I said earlier" and "+1" and I don't have the time to look
>> that up.
>>
>> There should be no problems on x86 if this goes in as it is now.
>>
>> But think about this: What happens if you boot your ARM device without
>> PAE and your initrd is in the upper region? If you are lucky the kernel
>> looks at a different place where it also has a read permission, notices
>> nothing sane is there, writes a message and continues. And if it is not
>> allowed to read? It is clearly the user's fault for booting a non-PAE
>> kernel.
> 
> That's actual the original reason: DT has it as 64 bit, and passes it to a
> 32 bit kernel when running in 32 bit mode without PAE.
> 
Thanks all for comments and useful discussion. I will resubmit the
patch with update to fix the printk warnings reported by Vineet and
James post the $subject change.

Am assuming the patch will go via Grant Likely's tree.

Regards,
Santosh
