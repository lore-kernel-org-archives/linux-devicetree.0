From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 1/5] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Wed, 12 Sep 2012 18:21:02 +0200
Message-ID: <33690123.AyeJMS7yMW@flatron>
References: <1347446757-20519-1-git-send-email-p.paneri@samsung.com> <1347446757-20519-2-git-send-email-p.paneri@samsung.com> <50506D2A.7040908@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <50506D2A.7040908@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Praveen Paneri <p.paneri@samsung.com>, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de
List-Id: devicetree@vger.kernel.org

Hi Praveen, Marc,

On Wednesday 12 of September 2012 13:08:26 Marc Kleine-Budde wrote:
> > +static const struct of_device_id samsung_usbphy_dt_match[];
> > +
> > +static inline int samsung_usbphy_get_driver_data(struct
> > platform_device *pdev) +{
> > +#ifdef CONFIG_OF
> 
> if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)

Is this check needed at all?

In case of CONFIG_OF disabled, of_node should always be NULL and there is a 
dummy macro provided for of_match_node, so it should compile and work just 
fine.

--
Best regards,
Tomasz Figa
