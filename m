From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v5 3/7] gpio: davinci: use irqdomain
Date: Mon, 18 Nov 2013 13:56:39 +0000
Message-ID: <20131118135639.GD16735@n2100.arm.linux.org.uk>
References: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>
 <1383905510-31760-4-git-send-email-prabhakar.csengg@gmail.com>
 <CACRpkdaJg4wqtD5xhPVrHJHxFoVwau6jidbOuQ9xFSK_6drxPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaJg4wqtD5xhPVrHJHxFoVwau6jidbOuQ9xFSK_6drxPQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Sekhar Nori <nsekhar@ti.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 02:11:32PM +0100, Linus Walleij wrote:
> On Fri, Nov 8, 2013 at 11:11 AM, Prabhakar Lad
> <prabhakar.csengg@gmail.com> wrote:
> 
> > From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> >
> > This patch converts the davinci gpio driver to use irqdomain
> > support.
> >
> > Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> 
> (...)
> > @@ -282,8 +283,7 @@ gpio_irq_handler(unsigned irq, struct irq_desc *desc)
> >         desc->irq_data.chip->irq_ack(&desc->irq_data);
> >         while (1) {
> >                 u32             status;
> > -               int             n;
> > -               int             res;
> > +               int             bit;
> 
> Why is this an int? I think u8 would suffice.

For local variables, it's better to use "int" or even "unsigned" here
rather than u8.  u8 tells the compiler that you want the variable to be
8-bit, which seems fine, except the compiler is then at liberty to keep
on masking the register back down to 8-bit.
