From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: [PATCH v2 3/7] rtc: mt6397: improvements of rtc driver
Date: Fri, 5 Jul 2019 17:35:46 +0200
Message-ID: <trinity-7b1977bd-252b-4482-b708-cf704a9d3da1-1562340946396@3c-app-gmx-bs68>
References: <20190703164822.17924-1-frank-w@public-files.de>
 <20190703164822.17924-4-frank-w@public-files.de>
 <20190704204336.GJ3692@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190704204336.GJ3692@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "Paul E . McKenney" <paulmck@linux.ibm.com>, Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Allison Randal <allison@lohutok.net>, Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "David S . Miller" <dave>
List-Id: devicetree@vger.kernel.org

Hi Alexander,

thank you for the Review

> Gesendet: Donnerstag, 04. Juli 2019 um 22:43 Uhr
> Von: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
> > -	rtc->rtc_dev = devm_rtc_allocate_device(rtc->dev);
> > -	if (IS_ERR(rtc->rtc_dev))
> > -		return PTR_ERR(rtc->rtc_dev);
> > +	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> > +					mtk_rtc_irq_handler_thread,
> > +					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > +					"mt6397-rtc", rtc);
> >
>
> This change may lead to a crash and the allocation was intentionally
> placed before the irq request.

i got no crash till now, but i will try to move the allocation before irq-request

> > -	ret = request_threaded_irq(rtc->irq, NULL,
> > -				   mtk_rtc_irq_handler_thread,
> > -				   IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -				   "mt6397-rtc", rtc);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
> >  			rtc->irq, ret);
> > @@ -287,6 +281,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
> >
> >  	device_init_wakeup(&pdev->dev, 1);
> >
> > +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> > +	if (IS_ERR(rtc->rtc_dev))
> > +		return PTR_ERR(rtc->rtc_dev);
> > +
> >  	rtc->rtc_dev->ops = &mtk_rtc_ops;


> >  static const struct of_device_id mt6397_rtc_of_match[] = {
> > +	{ .compatible = "mediatek,mt6323-rtc", },
>
> Unrelated change, this is not an improvement and must be accompanied by
> a documentation change.

documentation is changed in 1/7 defining this compatible. i called it improvement because existing driver now supports another chip

regards Frank
