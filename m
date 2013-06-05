From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: getting allwinner SoC support upstream (was Re:
	Uploading linux (3.9.4-1))
Date: Wed, 5 Jun 2013 23:56:43 +0100
Message-ID: <CAPweEDwyX4=Sme9kyDU64k9h3SPUHuErD8gEqfdYLGwBOocZDQ@mail.gmail.com>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
	<CAKON4OyyRF4Z46RyJFDWUwo4L52Z8bgSH0CzDr2gDerw4iDwcw@mail.gmail.com>
	<3619282.JgdgeGHudI@flatron>
Reply-To: Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <arm-netbook-bounces@lists.phcomp.co.uk>
In-Reply-To: <3619282.JgdgeGHudI@flatron>
List-Unsubscribe: <http://lists.phcomp.co.uk/mailman/options/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=unsubscribe>
List-Archive: <http://lists.phcomp.co.uk/pipermail/arm-netbook/>
List-Post: <mailto:arm-netbook@lists.phcomp.co.uk>
List-Help: <mailto:arm-netbook-request@lists.phcomp.co.uk?subject=help>
List-Subscribe: <http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=subscribe>
Errors-To: arm-netbook-bounces@lists.phcomp.co.uk
Sender: "arm-netbook" <arm-netbook-bounces@lists.phcomp.co.uk>
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: devicetree-discuss <devicetree-discuss@ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, debian-arm@lists.debian.org, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>, linux-arm-kernel@lists.infradead.org, debian-kernel@lists.debian.org
List-Id: devicetree@vger.kernel.org

[removing debian-release again - at their request]

On Wed, Jun 5, 2013 at 11:11 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Allwinner has just reinvented a wheel, without even considering the fact
> that it has been already invented.

apologies, tomasz, but i believe i covered this issue in, again, my
reply to russell, in which i point out that the both the context as
well as the scope of the problem being solved is entirely different
from that which the linux kernel developers find themselves in.  also,
we note from what russell said, was that device tree wasn't ready for
commercial deployment; allwinner's developers don't speak english, and
additionally a fabless semiconductor company need to maintain absolute
commercial secrecy at the all-critical time when they're doing
FPGA-based testing of their netlists (yes, really: running linux on a
huge $250k's worth of FPGAs) and haven't yet put the design into
actual silicon.

so there's a lot of factors which i believe the linux kernel
developers are not aware of, and haven't taken into account, and to
place blame onto the SoC vendors for not working with *you* when *you*
haven't made an effort to understand their situation is, i feel, not
really helping anyone.  not that i'm one to talk about understanding
people, but hey... :)

l.
