From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH v3] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Mon, 07 Sep 2015 14:45:41 +0300
Message-ID: <1441626341.2626.2.camel@linaro.org>
References: <1433250873-20780-1-git-send-email-ivan.ivanov@linaro.org>
	 <20150605070332.GI15169@shlinux2> <1433489827.6540.0.camel@linaro.org>
	 <20150605092645.GJ15169@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150605092645.GJ15169@shlinux2>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Fri, 2015-06-05 at 17:26 +0800, Peter Chen wrote:
> On Fri, Jun 05, 2015 at 10:37:07AM +0300, Ivan T. Ivanov wrote:

<snip>

> 
> > > > +
> > > > +static int ci_id_notifier(struct notifier_block *nb, unsigned long event,
> > > > +                                       void *ptr)
> > > > +{
> > > > +       struct ci_hdrc_cable *id = container_of(nb, struct ci_hdrc_cable, nb);
> > > > +       struct ci_hdrc *ci = id->ci;
> > > > +
> > > > +       if (event)
> > > > +               id->state = false;
> > > > +       else
> > > > +               id->state = true;
> > > > +
> > > > +       id->changed = true;
> > > > +
> 
> How to know the id value must be changed?
> How about using id->changed = (event != id->state) ? true : false?
> of cos, it needs to move before if {}.

This is handled already by extcon framework.

> 
> The same change may need to add to vbus notifier.
> 
> > > > +       ci_irq(ci->irq, ci);
> > > > +       return NOTIFY_DONE;
> > > > +}
> > > > +
> > > >  static int ci_get_platdata(struct device *dev,
> > > >                 struct ci_hdrc_platform_data *platdata)
> > > >  {
> > > > +       struct extcon_dev *ext_vbus, *ext_id;
> > > > +       struct ci_hdrc_cable *cable;
> > > > +       int ret;
> > > > +
> > > >         if (!platdata->phy_mode)
> > > >                 platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);
> > > > 
> > > > @@ -591,9 +630,89 @@ static int ci_get_platdata(struct device *dev,
> > > >         if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
> > > >                 platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
> > > > 
> > > > +       ext_id = ERR_PTR(-ENODEV);
> > > > +       ext_vbus = ERR_PTR(-ENODEV);
> > > > +       if (of_property_read_bool(dev->of_node, "extcon")) {
> > > > +               /* Each one of them is not mandatory */
> > > > +               ext_vbus = extcon_get_edev_by_phandle(dev, 0);
> > > > +               if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
> > > > +                       return PTR_ERR(ext_vbus);
> > > > +
> > > > +               ext_id = extcon_get_edev_by_phandle(dev, 1);
> > > > +               if (IS_ERR(ext_id) && PTR_ERR(ext_id) != -ENODEV)
> > > > +                       return PTR_ERR(ext_id);
> > > > +       }
> > > > +
> > > > +       cable = &platdata->vbus_extcon;
> > > > +       cable->nb.notifier_call = ci_vbus_notifier;
> > > > +       cable->edev = ext_vbus;
> > > > +
> > > > +       if (!IS_ERR(ext_vbus)) {
> > > > +               ret = extcon_get_cable_state(cable->edev, "USB");
> 
> I have not read extcon framework too much, but seems you should only
> can get cable state after register it (through ci_extcon_register)?
> ci_get_platdata is called before ci core probe.

No that is not a problem, you can always read cable state if you have
reference to extcon device.

Will fix remaining comments in next version.

Regards,
Ivan
