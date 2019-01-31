From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH V2 3/4] irq: imx-irqsteer: change to use reg_num instead
 of irq_group
Date: Thu, 31 Jan 2019 15:27:16 +0800
Message-ID: <CAA+hA=RMjER6v3u4GzvCiOEJXJyBrpVed7KWUJPGQKhZvne0AQ@mail.gmail.com>
References: <1548853196-11447-1-git-send-email-aisheng.dong@nxp.com>
 <1548853196-11447-4-git-send-email-aisheng.dong@nxp.com> <1548854523.6869.25.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548854523.6869.25.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 9:23 PM Lucas Stach <l.stach@pengutronix.de> wrote:
[...]
> > > +   /* one register bit map represents 32 input interrupts */
> > > +   data->reg_num /= 32;
> > +
> > >     if (IS_ENABLED(CONFIG_PM_SLEEP)) {
> > >             data->saved_reg = devm_kzalloc(&pdev->dev,
> > > -                                   sizeof(u32) * data->irq_groups * 2,
> > > +                                   sizeof(u32) * data->reg_num,
> >                                       GFP_KERNEL);
>
> Does this last parameter now fit on the line above?
>

No, 81 now. :)

Regards
Dong Aisheng
