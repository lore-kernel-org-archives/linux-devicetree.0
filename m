From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Fri, 5 Jun 2015 17:26:46 +0800
Message-ID: <20150605092645.GJ15169@shlinux2>
References: <1433250873-20780-1-git-send-email-ivan.ivanov@linaro.org>
 <20150605070332.GI15169@shlinux2> <1433489827.6540.0.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433489827.6540.0.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 05, 2015 at 10:37:07AM +0300, Ivan T. Ivanov wrote:
> 
> On Fri, 2015-06-05 at 15:03 +0800, Peter Chen wrote:
> > On Tue, Jun 02, 2015 at 04:14:33PM +0300, Ivan T. Ivanov wrote:
> > > On recent Qualcomm platforms VBUS and ID lines are not routed to
> > > USB PHY LINK controller. Use extcon framework to receive connect
> > > and disconnect ID and VBUS notification.
> > > 
> > > Signed-off-by: Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > > Changes sice v2 [1].
> > > 
> > > * Simulate IRQ on extcon event - used to trigger OTG state machine.
> > > 
> > 
> > No, you may not need to trigger complicate OTG FSM, instead, the
> > role switch based on ID value is ok.
> 
> I have tried this also, but I decided that using IRQ simulation
> will handle all use cases.
> 

After thinking more, I agree this solution

> > 
> > > I have to admit that I couldn't test complete Chipidea OTG state machine,
> > > because my setup is little weird. I am using "qcom,usb-otg-ci" as PHY/OTG
> > > provider, "qcom,ehci-host" as host controller driver and "qcom,ci-hdrc" for
> > > device role.
> > > 
> > 
> > Then, I am puzzled what kinds of flow you have tested in this patch?
> > extcon is really needed for chipidea core, but I hope we have tested
> > patch set based on it. Rob Herring have tested Marvell's host controller
> > can also use chipidea host driver, I think the same for qualcomm's.
> > The otg flow at phy-msm-usb.c can be removed and use chipidea's instead, and
> > only remain phy part at it.
> 
> I have tried this, but there is too many legacy code which is supposed to 
> handle old platforms and I can not distinguish, which should stay in and
> what could be taken out. I will take a look again. 
> 

Yeah, you can test your own patch.

> > 
> > Current role switch and vbus flow are based on otgsc register, you can
> > improve it by adding extcon support.
> 
> I am not sure that I get this. Isn't exactly what this patch does?
> 

Yes, you are right, see my further comments for your patch.

> > > 
> > > +static int ci_vbus_notifier(struct notifier_block *nb, unsigned long event,
> > > +                                                       void *ptr)
> > > +{
> > > +       struct ci_hdrc_cable *vbus = container_of(nb, struct ci_hdrc_cable, nb);
> > > +       struct ci_hdrc *ci = vbus->ci;
> > > +
> > > +       if (event)
> > > +               vbus->state = true;
> > > +       else
> > > +               vbus->state = false;
> > > +
> > > +       vbus->changed = true;
> > > +
> > > +       ci_irq(ci->irq, ci);
> > > +       return NOTIFY_DONE;
> > > +}
> > > +
> > > +static int ci_id_notifier(struct notifier_block *nb, unsigned long event,
> > > +                                       void *ptr)
> > > +{
> > > +       struct ci_hdrc_cable *id = container_of(nb, struct ci_hdrc_cable, nb);
> > > +       struct ci_hdrc *ci = id->ci;
> > > +
> > > +       if (event)
> > > +               id->state = false;
> > > +       else
> > > +               id->state = true;
> > > +
> > > +       id->changed = true;
> > > +

How to know the id value must be changed?
How about using id->changed = (event != id->state) ? true : false?
of cos, it needs to move before if {}.

The same change may need to add to vbus notifier.

> > > +       ci_irq(ci->irq, ci);
> > > +       return NOTIFY_DONE;
> > > +}
> > > +
> > >  static int ci_get_platdata(struct device *dev,
> > >                 struct ci_hdrc_platform_data *platdata)
> > >  {
> > > +       struct extcon_dev *ext_vbus, *ext_id;
> > > +       struct ci_hdrc_cable *cable;
> > > +       int ret;
> > > +
> > >         if (!platdata->phy_mode)
> > >                 platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);
> > > 
> > > @@ -591,9 +630,89 @@ static int ci_get_platdata(struct device *dev,
> > >         if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
> > >                 platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
> > > 
> > > +       ext_id = ERR_PTR(-ENODEV);
> > > +       ext_vbus = ERR_PTR(-ENODEV);
> > > +       if (of_property_read_bool(dev->of_node, "extcon")) {
> > > +               /* Each one of them is not mandatory */
> > > +               ext_vbus = extcon_get_edev_by_phandle(dev, 0);
> > > +               if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
> > > +                       return PTR_ERR(ext_vbus);
> > > +
> > > +               ext_id = extcon_get_edev_by_phandle(dev, 1);
> > > +               if (IS_ERR(ext_id) && PTR_ERR(ext_id) != -ENODEV)
> > > +                       return PTR_ERR(ext_id);
> > > +       }
> > > +
> > > +       cable = &platdata->vbus_extcon;
> > > +       cable->nb.notifier_call = ci_vbus_notifier;
> > > +       cable->edev = ext_vbus;
> > > +
> > > +       if (!IS_ERR(ext_vbus)) {
> > > +               ret = extcon_get_cable_state(cable->edev, "USB");

I have not read extcon framework too much, but seems you should only
can get cable state after register it (through ci_extcon_register)?
ci_get_platdata is called before ci core probe.

> > > +               if (ret)
> > > +                       cable->state = true;
> > > +               else
> > > +                       cable->state = false;
> > > +       }
> > > +
> > > +       cable = &platdata->id_extcon;
> > > +       cable->nb.notifier_call = ci_id_notifier;
> > > +       cable->edev = ext_id;
> > > +
> > > +       if (!IS_ERR(ext_id)) {
> > > +               ret = extcon_get_cable_state(cable->edev, "USB-HOST");
> > > +               if (ret)
> > > +                       cable->state = false;
> > > +               else
> > > +                       cable->state = true;
> > > +       }
> > > +       return 0;
> > > +}
> > > +
> > > +static int ci_extcon_register(struct ci_hdrc *ci)
> > > +{
> > > +       struct ci_hdrc_cable *id, *vbus;
> > > +       int ret;
> > > +
> > > +       id = &ci->platdata->id_extcon;
> > > +       id->ci = ci;
> > > +       if (!IS_ERR(id->edev)) {
> > > +               ret = extcon_register_interest(&id->conn, id->edev->name,
> > > +                                                                                               "USB-HOST", &id->nb);
> > > +               if (ret < 0) {
> > > +                       dev_err(ci->dev, "register ID failed\n");
> > > +                       return ret;
> > > +               }
> > > +       }
> > > +
> > > +       vbus = &ci->platdata->vbus_extcon;
> > > +       vbus->ci = ci;
> > > +       if (!IS_ERR(vbus->edev)) {
> > > +               ret = extcon_register_interest(&vbus->conn, vbus->edev->name,
> > > +                                                                                               "USB", &vbus->nb);
> > > +               if (ret < 0) {
> > > +                       extcon_unregister_interest(&id->conn);
> > > +                       dev_err(ci->dev, "register VBUS failed\n");
> > > +                       return ret;
> > > +               }
> > > +       }
> > > +
> > >         return 0;
> > >  }
> > > 
> > > +static void ci_extcon_unregister(struct ci_hdrc *ci)
> > > +{
> > > +       struct ci_hdrc_cable *cable;
> > > +
> > > +       cable = &ci->platdata->id_extcon;
> > > +       if (!IS_ERR(cable->edev))
> > > +               extcon_unregister_interest(&cable->conn);
> > > +
> > > +       cable = &ci->platdata->vbus_extcon;
> > > +       if (!IS_ERR(cable->edev))
> > > +               extcon_unregister_interest(&cable->conn);
> > > +}
> > > +
> > >  static DEFINE_IDA(ci_ida);
> > > 
> > >  struct platform_device *ci_hdrc_add_device(struct device *dev,
> > > @@ -817,6 +936,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
> > >         if (ret)
> > >                 goto stop;
> > > 
> > > +       ret = ci_extcon_register(ci);
> > > +       if (ret)
> > > +               goto stop;
> > > +
> > >         if (ci->supports_runtime_pm) {
> > >                 pm_runtime_set_active(&pdev->dev);
> > >                 pm_runtime_enable(&pdev->dev);
> > > @@ -834,6 +957,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
> > >         if (!ret)
> > >                 return 0;
> > > 

There is dbg_create_files between these code which may also fail.

> > > +       ci_extcon_unregister(ci);
> > >  stop:
> > >         ci_role_destroy(ci);
> > >  deinit_phy:
> > > @@ -853,6 +977,7 @@ static int ci_hdrc_remove(struct platform_device *pdev)
> > >         }
> > > 
> > >         dbg_remove_files(ci);
> > > +       ci_extcon_unregister(ci);
> > >         ci_role_destroy(ci);
> > >         ci_hdrc_enter_lpm(ci, true);
> > >         ci_usb_phy_exit(ci);
> > > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> > > index ad6c87a..77fe2df 100644
> > > --- a/drivers/usb/chipidea/otg.c
> > > +++ b/drivers/usb/chipidea/otg.c
> > > @@ -30,7 +30,41 @@
> > >   */
> > >  u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
> > >  {
> > > -       return hw_read(ci, OP_OTGSC, mask);
> > > +       struct ci_hdrc_cable *cable;
> > > +       u32 val = hw_read(ci, OP_OTGSC, mask);
> > > +
> > > +       /*
> > > +               * If using extcon framework for VBUS and/or ID signal
> > > +               * detection overwrite OTGSC resiter value
> > > +               */

%s/resiter/register

> > > +       cable = &ci->platdata->vbus_extcon;
> > > +       if (!IS_ERR(cable->edev)) {
> > > +               if (cable->changed)
> > > +                       val |= OTGSC_BSVIS;
> > > +               else
> > > +                       val &= ~OTGSC_BSVIS;
> > > +
> > > +               if (cable->state)
> > > +                       val |= OTGSC_BSV;
> > > +               else
> > > +                       val &= ~OTGSC_BSV;
> > > +       }

You can clear cable->changed after that, then no change for hw_write_otgsc
is needed.

> > > +
> > > +       cable = &ci->platdata->id_extcon;
> > > +       if (!IS_ERR(cable->edev)) {
> > > +               if (cable->changed)
> > > +                       val |= OTGSC_IDIS;
> > > +               else
> > > +                       val &= ~OTGSC_IDIS;
> > > +
> > > +               if (cable->state)
> > > +                       val |= OTGSC_ID;
> > > +               else
> > > +                       val &= ~OTGSC_ID;
> > > +       }
> > > +
> > > +       val &= mask;

It seems you do not need to do &mask again.

> > > +       return val;
> > >  }
> > > 
> > >  /**
> > > @@ -40,7 +74,24 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
> > >   */
> > >  void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 data)
> > >  {
> > > -       hw_write(ci, OP_OTGSC, mask | OTGSC_INT_STATUS_BITS, data);
> > > +       struct ci_hdrc_cable *cable;
> > > +
> > > +       mask |= OTGSC_INT_STATUS_BITS;
> > > +
> > > +       /* clear artificial bits */
> > > +       cable = &ci->platdata->vbus_extcon;
> > > +       if (!IS_ERR(cable->edev)) {
> > > +               if (data & OTGSC_BSVIS)
> > > +                       cable->changed = false;
> > > +       }
> > > +
> > > +       cable = &ci->platdata->id_extcon;
> > > +       if (!IS_ERR(cable->edev)) {
> > > +               if (data & OTGSC_IDIS)
> > > +                       cable->changed = false;
> > > +       }
> > > +
> > > +       hw_write(ci, OP_OTGSC, mask, data);
> > >  }
> > > 
> > >  /**
> > > diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> > > index ab94f78..05915cb1 100644
> > > --- a/include/linux/usb/chipidea.h
> > > +++ b/include/linux/usb/chipidea.h
> > > @@ -5,9 +5,29 @@
> > >  #ifndef __LINUX_USB_CHIPIDEA_H
> > >  #define __LINUX_USB_CHIPIDEA_H
> > > 
> > > +#include <linux/extcon.h>
> > >  #include <linux/usb/otg.h>
> > > 
> > >  struct ci_hdrc;
> > > +
> > > +/**
> > > + * struct ci_hdrc_cable - structure for external connector cable state tracking
> > > + * @state: current state of the line
> > > + * @changed: set to true when extcon event happen
> > > + * @edev: device which generate events
> > > + * @ci: driver state of the chipidea device
> > > + * @nb: hold event notification callback
> > > + * @conn: used for notification registration
> > > + */
> > > +struct ci_hdrc_cable {
> > > +       bool    state;
> > > +       bool    changed;
> > > +       struct extcon_dev*edev;
> > > +       struct ci_hdrc*ci;
> > > +       struct notifier_blocknb;
> > > +       struct extcon_specific_cable_nb conn;
> > > +};
> > > +
> > >  struct ci_hdrc_platform_data {
> > >         const char*name;
> > >         /* offset of the capability registers */
> > > @@ -35,6 +55,10 @@ struct ci_hdrc_platform_data {
> > >         void    (*notify_event) (struct ci_hdrc *ci, unsigned event);
> > >         struct regulator*reg_vbus;
> > >         bool    tpl_support;
> > > +
> > > +       /* VBUS and ID signal state tracking, using extcon framework */
> > > +       struct ci_hdrc_cablevbus_extcon;
> > > +       struct ci_hdrc_cableid_extcon;
> > >  };
> > > 
> > >  /* Default offset of capability registers */
> > > --
> > > 1.9.1
> > > 
> > 
> > 

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
