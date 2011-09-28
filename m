From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Wed, 28 Sep 2011 13:09:48 +0200
Message-ID: <CACRpkdYyurmMSF0LnN3Ut8fmQDkjVC5pNCeUWQ=ik8Ete6UYzg@mail.gmail.com>
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
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, rubini@unipv.it, linux-arm-kernel@lists.infradead.org, rmallon@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 12:41 PM, Jamie Iles <jamie@jamieiles.com> wrote:

> +static void vic_single_handle_irq(struct vic_device *vic, struct pt_regs=
 *regs)
> +{
> + =A0 =A0 =A0 u32 stat, irq;
> + =A0 =A0 =A0 bool handled =3D false;
> +
> + =A0 =A0 =A0 while (!handled) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat =3D readl_relaxed(vic->base + VIC_IRQ_=
STATUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!stat)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (stat) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq =3D fls(stat) - 1;

Isn't fls "find last set"?

That means IRQs with higher numbers will be handled first will it not?

For U300 IRQs with lower numbers will be handled first
by iteratively testing bit 0 and shifting right:

-1002:  tst     \irqstat, #1
-       bne     1003f
-       add     \irqnr, \irqnr, #1
-       movs    \irqstat, \irqstat, lsr #1
-       bne     1002b

So I would use ffs() for this to work the same way as before in
U300.

Since this can have some performance impact, if the platforms differ
in whether they handle IRQs from low to high or from high to low
might need to be a flag passed in to vic_init() or so...

Yours,
Linus Walleij
