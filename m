From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add control of the voltage/current regulator
 to the LED core
Date: Mon, 15 Jul 2019 16:19:35 +0100
Message-ID: <20190715151935.4ci23aqw4liz56fg@holly.lan>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-2-jjhiblot@ti.com>
 <56d16260-ff82-3439-4c1f-2a3a1552bc7d@ti.com>
 <ab4818c0-bc7a-13e1-c6ce-e977b0234de0@ti.com>
 <20190715092400.sedjumqkecglheyu@holly.lan>
 <9c53f54f-d0d4-50d4-09da-34389085269a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9c53f54f-d0d4-50d4-09da-34389085269a@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2019 at 11:47:08AM +0200, Jean-Jacques Hiblot wrote:
> > > > > +    if (IS_ERR(led_cdev->regulator)) {
> > > > > +        dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
> > > > > +            led_cdev->name);
> > > > > +        device_unregister(led_cdev->dev);
> > > > > +        mutex_unlock(&led_cdev->led_access);
> > > > > +        return PTR_ERR(led_cdev->regulator);
> > > > This is listed as optional in the DT doc.  This appears to be required.
> > > The regulator core will provide a dummy regulator if none is given in the
> > > device tree. I would rather have an error in that case, but that is not how
> > > it works.
> > If you actively wanted to get -ENODEV back when there is no regulator
> > then you can use devm_regulator_get_optional() for that.
> > 
> > However perhaps be careful what you wish for. If you use get_optional()
> > then you will have to sprinkle NULL or IS_ERR() checks everywhere. I'd
> > favour using the current approach!
> 
> Thanks for the info. I think I'll use the get_optionnal(). That will add a
> bit of complexity, but it will avoid deferring some work in
> led_set_brightness_nopm() when it is not needed.

Makes sense, I didn't notice that it allows you to avoid deferred work.


Daniel.
