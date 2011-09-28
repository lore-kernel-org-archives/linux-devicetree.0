From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 05/10] ARM: nomadik: convert to MULTI_IRQ_HANDLER
Date: Wed, 28 Sep 2011 13:12:43 +0200
Message-ID: <CACRpkdYtHQz8dFbN=LLFNak5dQ5rCoLuM3Jg84D=vibFSpptcQ@mail.gmail.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-6-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317206507-18867-6-git-send-email-jamie@jamieiles.com>
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

> - =A0 =A0 =A0 /* This stanza gets the irq mask from one of two status reg=
isters */
> - =A0 =A0 =A0 mov =A0 =A0 \irqnr, #0
> - =A0 =A0 =A0 ldr =A0 =A0 \irqstat, [\base, #VIC_REG_IRQSR0] =A0 =A0 =A0@=
 get masked status
> - =A0 =A0 =A0 cmp =A0 =A0 \irqstat, #0
> - =A0 =A0 =A0 bne =A0 =A0 1001f
> - =A0 =A0 =A0 add =A0 =A0 \irqnr, \irqnr, #32
> - =A0 =A0 =A0 ldr =A0 =A0 \irqstat, [\base, #VIC_REG_IRQSR1] =A0 =A0 =A0@=
 get masked status

As you can see the Nomadik also has two daisy-chained VICs,
just like the U300, so this also breaks.

Yours,
Linus Walleij
