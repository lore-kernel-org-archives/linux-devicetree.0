From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 08/10] ARM: u300: convert to MULTI_IRQ_HANDLER
Date: Wed, 28 Sep 2011 13:03:34 +0200
Message-ID: <CACRpkdYOdWA2vg2zq+nhOPSvPN7zdy9NVsOcqfZ7i9W5Sq5cpw@mail.gmail.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-9-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317206507-18867-9-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, rubini@unipv.it, linux-arm-kernel@lists.infradead.org, rmallon@gmail.com
List-Id: devicetree@vger.kernel.org

Hold your horses:

On Wed, Sep 28, 2011 at 12:41 PM, Jamie Iles <jamie@jamieiles.com> wrote:

> diff --git a/arch/arm/mach-u300/include/mach/entry-macro.S b/arch/arm/mac=
h-u300/include/mach/entry-macro.S
> index 20731ae..7181d6a 100644
> --- a/arch/arm/mach-u300/include/mach/entry-macro.S
> +++ b/arch/arm/mach-u300/include/mach/entry-macro.S
> @@ -8,33 +8,9 @@
> =A0* Low-level IRQ helper macros for ST-Ericsson U300
> =A0* Author: Linus Walleij <linus.walleij@stericsson.com>
> =A0*/
> -#include <mach/hardware.h>
> -#include <asm/hardware/vic.h>
>
> =A0 =A0 =A0 =A0.macro =A0disable_fiq
> =A0 =A0 =A0 =A0.endm
>
> - =A0 =A0 =A0 .macro =A0get_irqnr_preamble, base, tmp
> - =A0 =A0 =A0 .endm
> -
> =A0 =A0 =A0 =A0.macro =A0arch_ret_to_user, tmp1, tmp2
> =A0 =A0 =A0 =A0.endm
> -
> - =A0 =A0 =A0 .macro =A0get_irqnr_and_base, irqnr, irqstat, base, tmp
> - =A0 =A0 =A0 ldr =A0 =A0 \base, =3D U300_AHB_PER_VIRT_BASE-U300_AHB_PER_=
PHYS_BASE+U300_INTCON0_BASE
> - =A0 =A0 =A0 ldr =A0 =A0 \irqstat, [\base, #VIC_IRQ_STATUS] @ get masked=
 status
> - =A0 =A0 =A0 mov =A0 =A0 \irqnr, #0
> - =A0 =A0 =A0 teq =A0 =A0 \irqstat, #0
> - =A0 =A0 =A0 bne =A0 =A0 1002f
> -1001: =A0ldr =A0 =A0 \base, =3D U300_AHB_PER_VIRT_BASE-U300_AHB_PER_PHYS=
_BASE+U300_INTCON1_BASE
> - =A0 =A0 =A0 ldr =A0 =A0 \irqstat, [\base, #VIC_IRQ_STATUS] @ get masked=
 status
> - =A0 =A0 =A0 mov =A0 =A0 \irqnr, #32
> - =A0 =A0 =A0 teq =A0 =A0 \irqstat, #0
> - =A0 =A0 =A0 beq =A0 =A0 1003f
> -1002: =A0tst =A0 =A0 \irqstat, #1
> - =A0 =A0 =A0 bne =A0 =A0 1003f
> - =A0 =A0 =A0 add =A0 =A0 \irqnr, \irqnr, #1
> - =A0 =A0 =A0 movs =A0 =A0\irqstat, \irqstat, lsr #1
> - =A0 =A0 =A0 bne =A0 =A0 1002b
> -1003: =A0 =A0 =A0 =A0 =A0/* EQ will be set if no irqs pending */
> - =A0 =A0 =A0 .endm

When I inspect patch 2 in this series I get the feeling that it assumes that
there is one and only one VIC bank with 32 interrupts involved. This is
not the case in the U300, it has 64 possible IRQ sources by OR:in the
output IRQ signal from two VIC:s and feeding the resulting IRQ line
into the CPU.

So in the code above we first check the 32 bits at the first VIC instance,
and if that is zero we go on to check the other 32 bits.

vic_single_handle_irq() needs to be modified to handle several
ranges or atleast two.

Note that in mach-u300/core.c we initialize each VIC like this:
vic_init((void __iomem *) U300_INTCON0_VBASE, 0, mask[0], mask[0]);
vic_init((void __iomem *) U300_INTCON1_VBASE, 32, mask[1], mask[1]);

So I think the easiest may be to let vic_init() add registered VIC
ranges to a list or array, and increas some num_vics variable
to that  vic_single_handle_irq() can traverse both ranges in
order.

Yours,
Linus Walleij
