From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [sodaville] [PATCH TIP 02/14] x86: Add device tree support
Date: Thu, 17 Feb 2011 10:02:34 -0700
Message-ID: <AANLkTinh85A_1rJ+JcLVR4fpN5A2iuWv4BfZ0h7FP6Yr@mail.gmail.com>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
 <1295843342-1122-3-git-send-email-bigeasy@linutronix.de> <20110216213126.GC22837@angua.secretlab.ca>
 <20110217113102.GB11260@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110217113102.GB11260@www.tglx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 17, 2011 at 4:31 AM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> * Grant Likely | 2011-02-16 14:31:26 [-0700]:
>
>>> +config X86_OF
>>> + =A0 =A0bool "Support for device tree"
>>> + =A0 =A0select OF
>>> + =A0 =A0select OF_EARLY_FLATTREE
>>> + =A0 =A0---help---
>>> + =A0 =A0 =A0Device tree support on X86.
>>> +
>>
>>On ARM and MIPS, this is called 'config USE_OF'. =A0It would be nice =
to have
>>some commonality. =A0Maybe I should move the user-visible option to
>>drivers/of/Kconfig. =A0Or perhaps I should just make CONFIG_OF itself
>>user visible.
>>
>>thoughts?
>
> We could make CONFIG_OF depend on CONFIG_HAVE_OF_SUPPORT and let OF
> select OF_EARLY_FLATTREE if ARCH_WANT_EARLY_FLATTREE for instance. So
> that part would work in a generic way.
>
> For OF-only platforms you would have to go to drivers/of
> before you can enable the specific SoC/board. So it could lead to
> something like "first enable scsi disk before you can enable usb
> storage".

That's definitely not desirable.  Currently ARM and MIPS boards that
need it are force-selecting USE_OF which pretty much solves the
problem.  The option is always user-
>
> I like it :) For now I rename to USE_OF.

okay.

g.
