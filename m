From: hongkun.cao <hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix dual-edge code defect
Date: Tue, 24 May 2016 11:10:54 +0800
Message-ID: <1464059454.27362.16.camel@mtksdaap41>
References: <1463815419-11719-1-git-send-email-hongkun.cao@mediatek.com>
 <5742DDE5.7050701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5742DDE5.7050701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-05-23 at 12:39 +0200, Matthias Brugger wrote:
> 
> On 21/05/16 09:23, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: "hongkun.cao" <hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > When a dual-edge irq is triggered, an incorrect irq will be reported on
> > condition that the external signal is not stable and this incorrect irq
> > has been registered.
> > Correct the register offset.
> >
> 
> I'm not sure what you want to say. From what I can see the without this 
> fix, the the wrong IRQ will be cleared and raised. Is this what you are 
> addressing?
> 
> If so:

Hi, Matthias,
Thanks for your comments.
Yes, you are right.
Suppose there are two irqs registered in our system with special
relationship, One hardware irq  number is 17 with both edge trigger, and
the other hardware irq number is 49(17+32),then hardware irq 49 may be
reported unexpectedly if hardware irq 17 occurred.

> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> > Signed-off-by: hongkun.cao <hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > index 2bbe6f7..92ae49f 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > @@ -1255,9 +1255,10 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
> >   	const struct mtk_desc_pin *pin;
> >
> >   	chained_irq_enter(chip, desc);
> > -	for (eint_num = 0; eint_num < pctl->devdata->ap_num; eint_num += 32) {
> > +	for (eint_num = 0;
> > +	     eint_num < pctl->devdata->ap_num;
> > +	     eint_num += 32, reg += 4) {
> >   		status = readl(reg);
> > -		reg += 4;
> >   		while (status) {
> >   			offset = __ffs(status);
> >   			index = eint_num + offset;
> >
