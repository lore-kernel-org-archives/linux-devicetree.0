From: Zoltan Devai <zdevai@gmail.com>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Thu, 29 Sep 2011 17:03:34 +0200
Message-ID: <CAGVye5O492Ev1Zz_8tTZKo16K+FALZ6Oo3TgyuzPuf7RYVyBzQ@mail.gmail.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-3-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317206507-18867-3-git-send-email-jamie@jamieiles.com>
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
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, marc.zyngier@arm.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, rubini@unipv.it, linux-arm-kernel@lists.infradead.org, rmallon@gmail.com
List-Id: devicetree@vger.kernel.org

2011/9/28 Jamie Iles <jamie@jamieiles.com>:
> Add a handler for the VIC that is suitable for MULTI_IRQ_HANDLER
> platforms. =A0This can replace the ASM entry macros for platforms that use
> the VIC.
>
> v2: =A0 =A0 - allow the handler be used for !CONFIG_OF
> =A0 =A0 =A0 =A0- use irq_domain_to_irq()
>
> Cc: Rob Herring <robherring2@gmail.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
> =A0arch/arm/common/vic.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 29 +++++++++++=
++++++++++++++++++
> =A0arch/arm/include/asm/hardware/vic.h | =A0 =A04 ++++
> =A02 files changed, 33 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
> index 3f9c8f2..71adced 100644
> --- a/arch/arm/common/vic.c
> +++ b/arch/arm/common/vic.c

> +asmlinkage void __exception_irq_entry vic_handle_irq(struct pt_regs *reg=
s)
> +{
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < vic_id; ++i)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 vic_single_handle_irq(&vic_devices[i], regs=
);
> +}
> +#endif /* CONFIG_MULTI_IRQ_HANDLER */

__exception_irq_entry doesn't compile with CONFIG_FUNCTION_GRAPH_TRACER ena=
bled.
Either this file, or arch/arm/include/asm/system.h needs an #include
<linux/ftrace.h>

Cheers,
Zoltan
