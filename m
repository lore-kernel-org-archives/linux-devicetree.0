From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Fri, 05 Jun 2015 10:37:07 +0300
Message-ID: <1433489827.6540.0.camel@linaro.org>
References: <1433250873-20780-1-git-send-email-ivan.ivanov@linaro.org>
	 <20150605070332.GI15169@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150605070332.GI15169@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Fri, 2015-06-05 at 15:03 +0800, Peter Chen wrote:
> On Tue, Jun 02, 2015 at 04:14:33PM +0300, Ivan T. Ivanov wrote:
> > On recent Qualcomm platforms VBUS and ID lines are not routed to
> > USB PHY LINK controller. Use extcon framework to receive connect
> > and disconnect ID and VBUS notification.
> >=20
> > Signed-off-by: Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > Changes sice v2 [1].
> >=20
> > * Simulate IRQ on extcon event - used to trigger OTG state machine.
> >=20
>=20
> No, you may not need to trigger complicate OTG FSM, instead, the
> role switch based on ID value is ok.

I have tried this also, but I decided that using IRQ simulation
will handle all use cases.

>=20
> > I have to admit that I couldn't test complete Chipidea OTG state ma=
chine,
> > because my setup is little weird. I am using "qcom,usb-otg-ci" as P=
HY/OTG
> > provider, "qcom,ehci-host" as host controller driver and "qcom,ci-h=
drc" for
> > device role.
> >=20
>=20
> Then, I am puzzled what kinds of flow you have tested in this patch?
> extcon is really needed for chipidea core, but I hope we have tested
> patch set based on it. Rob Herring have tested Marvell's host control=
ler
> can also use chipidea host driver, I think the same for qualcomm's.
> The otg flow at phy-msm-usb.c can be removed and use chipidea's inste=
ad, and
> only remain phy part at it.

I have tried this, but there is too many legacy code which is supposed =
to=20
handle old platforms and I can not distinguish, which should stay in an=
d
what could be taken out. I will take a look again.=20

>=20
> Current role switch and vbus flow are based on otgsc register, you ca=
n
> improve it by adding extcon support.

I am not sure that I get this. Isn't exactly what this patch does?

Regards,
Ivan

>=20
> Peter
>=20
> > There could be patch conflict regarding ci-hdrc-qcom.txt, because R=
ob Herring
> > is consolidating DT binding for all vendors which integrate this de=
vice [2]
> >=20
> > [1] https://lkml.org/lkml/2015/4/15/283
> > [2] http://www.spinics.net/lists/linux-usb/msg125453.html
> >=20
> >  .../devicetree/bindings/usb/ci-hdrc-qcom.txt       |   9 ++
> >  drivers/usb/chipidea/Kconfig                       |   1 +
> >  drivers/usb/chipidea/core.c                        | 125 +++++++++=
++++++++++++
> >  drivers/usb/chipidea/otg.c                         |  55 ++++++++-
> >  include/linux/usb/chipidea.h                       |  24 ++++
> >  5 files changed, 212 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt=
 b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> > index f2899b5..c635aca 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> > @@ -7,6 +7,14 @@ Required properties:
> >  - usb-phy:      phandle for the PHY device
> >  - dr_mode:      Should be "peripheral"
> >=20
> > +Optional properties:
> > +- extcon:       phandles to external connector devices. First phan=
dle
> > +                should point to external connector, which provide =
"USB"
> > +                cable events, the second should point to external =
connector
> > +                device, which provide "USB-HOST" cable events. If =
one of
> > +                the external connector devices is not required, em=
pty <0>
> > +                phandle should be specified.
> > +
> >  Examples:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gadget@f9a55000 {
> >                 compatible =3D "qcom,ci-hdrc";
> > @@ -14,4 +22,5 @@ Examples:
> >                 dr_mode =3D "peripheral";
> >                 interrupts =3D <0 134 0>;
> >                 usb-phy =3D <&usbphy0>;
> > +               extcon =3D <0>, <&usb_id>;
> >         };
> > diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kc=
onfig
> > index 5ce3f1d..5619b8c 100644
> > --- a/drivers/usb/chipidea/Kconfig
> > +++ b/drivers/usb/chipidea/Kconfig
> > @@ -1,6 +1,7 @@
> >  config USB_CHIPIDEA
> >         tristate "ChipIdea Highspeed Dual Role Controller"
> >         depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD &=
& !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
> > +       select EXTCON
> >         help
> >                         Say Y here if your system has a dual role h=
igh speed USB
> >                         controller based on ChipIdea silicon IP. Cu=
rrently, only the
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/cor=
e.c
> > index 74fea4f..2ae2c09 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -47,6 +47,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/extcon.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/module.h>
> > @@ -557,9 +558,47 @@ static irqreturn_t ci_irq(int irq, void *data)
> >         return ret;
> >  }
> >=20
> > +static int ci_vbus_notifier(struct notifier_block *nb, unsigned lo=
ng event,
> > +                                                       void *ptr)
> > +{
> > +       struct ci_hdrc_cable *vbus =3D container_of(nb, struct ci_h=
drc_cable, nb);
> > +       struct ci_hdrc *ci =3D vbus->ci;
> > +
> > +       if (event)
> > +               vbus->state =3D true;
> > +       else
> > +               vbus->state =3D false;
> > +
> > +       vbus->changed =3D true;
> > +
> > +       ci_irq(ci->irq, ci);
> > +       return NOTIFY_DONE;
> > +}
> > +
> > +static int ci_id_notifier(struct notifier_block *nb, unsigned long=
 event,
> > +                                       void *ptr)
> > +{
> > +       struct ci_hdrc_cable *id =3D container_of(nb, struct ci_hdr=
c_cable, nb);
> > +       struct ci_hdrc *ci =3D id->ci;
> > +
> > +       if (event)
> > +               id->state =3D false;
> > +       else
> > +               id->state =3D true;
> > +
> > +       id->changed =3D true;
> > +
> > +       ci_irq(ci->irq, ci);
> > +       return NOTIFY_DONE;
> > +}
> > +
> >  static int ci_get_platdata(struct device *dev,
> >                 struct ci_hdrc_platform_data *platdata)
> >  {
> > +       struct extcon_dev *ext_vbus, *ext_id;
> > +       struct ci_hdrc_cable *cable;
> > +       int ret;
> > +
> >         if (!platdata->phy_mode)
> >                 platdata->phy_mode =3D of_usb_get_phy_mode(dev->of_=
node);
> >=20
> > @@ -591,9 +630,89 @@ static int ci_get_platdata(struct device *dev,
> >         if (of_usb_get_maximum_speed(dev->of_node) =3D=3D USB_SPEED=
_FULL)
> >                 platdata->flags |=3D CI_HDRC_FORCE_FULLSPEED;
> >=20
> > +       ext_id =3D ERR_PTR(-ENODEV);
> > +       ext_vbus =3D ERR_PTR(-ENODEV);
> > +       if (of_property_read_bool(dev->of_node, "extcon")) {
> > +               /* Each one of them is not mandatory */
> > +               ext_vbus =3D extcon_get_edev_by_phandle(dev, 0);
> > +               if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) !=3D -ENO=
DEV)
> > +                       return PTR_ERR(ext_vbus);
> > +
> > +               ext_id =3D extcon_get_edev_by_phandle(dev, 1);
> > +               if (IS_ERR(ext_id) && PTR_ERR(ext_id) !=3D -ENODEV)
> > +                       return PTR_ERR(ext_id);
> > +       }
> > +
> > +       cable =3D &platdata->vbus_extcon;
> > +       cable->nb.notifier_call =3D ci_vbus_notifier;
> > +       cable->edev =3D ext_vbus;
> > +
> > +       if (!IS_ERR(ext_vbus)) {
> > +               ret =3D extcon_get_cable_state(cable->edev, "USB");
> > +               if (ret)
> > +                       cable->state =3D true;
> > +               else
> > +                       cable->state =3D false;
> > +       }
> > +
> > +       cable =3D &platdata->id_extcon;
> > +       cable->nb.notifier_call =3D ci_id_notifier;
> > +       cable->edev =3D ext_id;
> > +
> > +       if (!IS_ERR(ext_id)) {
> > +               ret =3D extcon_get_cable_state(cable->edev, "USB-HO=
ST");
> > +               if (ret)
> > +                       cable->state =3D false;
> > +               else
> > +                       cable->state =3D true;
> > +       }
> > +       return 0;
> > +}
> > +
> > +static int ci_extcon_register(struct ci_hdrc *ci)
> > +{
> > +       struct ci_hdrc_cable *id, *vbus;
> > +       int ret;
> > +
> > +       id =3D &ci->platdata->id_extcon;
> > +       id->ci =3D ci;
> > +       if (!IS_ERR(id->edev)) {
> > +               ret =3D extcon_register_interest(&id->conn, id->ede=
v->name,
> > +                                                                  =
                             "USB-HOST", &id->nb);
> > +               if (ret < 0) {
> > +                       dev_err(ci->dev, "register ID failed\n");
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       vbus =3D &ci->platdata->vbus_extcon;
> > +       vbus->ci =3D ci;
> > +       if (!IS_ERR(vbus->edev)) {
> > +               ret =3D extcon_register_interest(&vbus->conn, vbus-=
>edev->name,
> > +                                                                  =
                             "USB", &vbus->nb);
> > +               if (ret < 0) {
> > +                       extcon_unregister_interest(&id->conn);
> > +                       dev_err(ci->dev, "register VBUS failed\n");
> > +                       return ret;
> > +               }
> > +       }
> > +
> >         return 0;
> >  }
> >=20
> > +static void ci_extcon_unregister(struct ci_hdrc *ci)
> > +{
> > +       struct ci_hdrc_cable *cable;
> > +
> > +       cable =3D &ci->platdata->id_extcon;
> > +       if (!IS_ERR(cable->edev))
> > +               extcon_unregister_interest(&cable->conn);
> > +
> > +       cable =3D &ci->platdata->vbus_extcon;
> > +       if (!IS_ERR(cable->edev))
> > +               extcon_unregister_interest(&cable->conn);
> > +}
> > +
> >  static DEFINE_IDA(ci_ida);
> >=20
> >  struct platform_device *ci_hdrc_add_device(struct device *dev,
> > @@ -817,6 +936,10 @@ static int ci_hdrc_probe(struct platform_devic=
e *pdev)
> >         if (ret)
> >                 goto stop;
> >=20
> > +       ret =3D ci_extcon_register(ci);
> > +       if (ret)
> > +               goto stop;
> > +
> >         if (ci->supports_runtime_pm) {
> >                 pm_runtime_set_active(&pdev->dev);
> >                 pm_runtime_enable(&pdev->dev);
> > @@ -834,6 +957,7 @@ static int ci_hdrc_probe(struct platform_device=
 *pdev)
> >         if (!ret)
> >                 return 0;
> >=20
> > +       ci_extcon_unregister(ci);
> >  stop:
> >         ci_role_destroy(ci);
> >  deinit_phy:
> > @@ -853,6 +977,7 @@ static int ci_hdrc_remove(struct platform_devic=
e *pdev)
> >         }
> >=20
> >         dbg_remove_files(ci);
> > +       ci_extcon_unregister(ci);
> >         ci_role_destroy(ci);
> >         ci_hdrc_enter_lpm(ci, true);
> >         ci_usb_phy_exit(ci);
> > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.=
c
> > index ad6c87a..77fe2df 100644
> > --- a/drivers/usb/chipidea/otg.c
> > +++ b/drivers/usb/chipidea/otg.c
> > @@ -30,7 +30,41 @@
> >   */
> >  u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
> >  {
> > -       return hw_read(ci, OP_OTGSC, mask);
> > +       struct ci_hdrc_cable *cable;
> > +       u32 val =3D hw_read(ci, OP_OTGSC, mask);
> > +
> > +       /*
> > +               * If using extcon framework for VBUS and/or ID sign=
al
> > +               * detection overwrite OTGSC resiter value
> > +               */
> > +       cable =3D &ci->platdata->vbus_extcon;
> > +       if (!IS_ERR(cable->edev)) {
> > +               if (cable->changed)
> > +                       val |=3D OTGSC_BSVIS;
> > +               else
> > +                       val &=3D ~OTGSC_BSVIS;
> > +
> > +               if (cable->state)
> > +                       val |=3D OTGSC_BSV;
> > +               else
> > +                       val &=3D ~OTGSC_BSV;
> > +       }
> > +
> > +       cable =3D &ci->platdata->id_extcon;
> > +       if (!IS_ERR(cable->edev)) {
> > +               if (cable->changed)
> > +                       val |=3D OTGSC_IDIS;
> > +               else
> > +                       val &=3D ~OTGSC_IDIS;
> > +
> > +               if (cable->state)
> > +                       val |=3D OTGSC_ID;
> > +               else
> > +                       val &=3D ~OTGSC_ID;
> > +       }
> > +
> > +       val &=3D mask;
> > +       return val;
> >  }
> >=20
> >  /**
> > @@ -40,7 +74,24 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
> >   */
> >  void hw_write_otgsc(struct ci_hdrc *ci, u32 mask, u32 data)
> >  {
> > -       hw_write(ci, OP_OTGSC, mask | OTGSC_INT_STATUS_BITS, data);
> > +       struct ci_hdrc_cable *cable;
> > +
> > +       mask |=3D OTGSC_INT_STATUS_BITS;
> > +
> > +       /* clear artificial bits */
> > +       cable =3D &ci->platdata->vbus_extcon;
> > +       if (!IS_ERR(cable->edev)) {
> > +               if (data & OTGSC_BSVIS)
> > +                       cable->changed =3D false;
> > +       }
> > +
> > +       cable =3D &ci->platdata->id_extcon;
> > +       if (!IS_ERR(cable->edev)) {
> > +               if (data & OTGSC_IDIS)
> > +                       cable->changed =3D false;
> > +       }
> > +
> > +       hw_write(ci, OP_OTGSC, mask, data);
> >  }
> >=20
> >  /**
> > diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipi=
dea.h
> > index ab94f78..05915cb1 100644
> > --- a/include/linux/usb/chipidea.h
> > +++ b/include/linux/usb/chipidea.h
> > @@ -5,9 +5,29 @@
> >  #ifndef __LINUX_USB_CHIPIDEA_H
> >  #define __LINUX_USB_CHIPIDEA_H
> >=20
> > +#include <linux/extcon.h>
> >  #include <linux/usb/otg.h>
> >=20
> >  struct ci_hdrc;
> > +
> > +/**
> > + * struct ci_hdrc_cable - structure for external connector cable s=
tate tracking
> > + * @state: current state of the line
> > + * @changed: set to true when extcon event happen
> > + * @edev: device which generate events
> > + * @ci: driver state of the chipidea device
> > + * @nb: hold event notification callback
> > + * @conn: used for notification registration
> > + */
> > +struct ci_hdrc_cable {
> > +       bool    state;
> > +       bool    changed;
> > +       struct extcon_dev*edev;
> > +       struct ci_hdrc*ci;
> > +       struct notifier_blocknb;
> > +       struct extcon_specific_cable_nb conn;
> > +};
> > +
> >  struct ci_hdrc_platform_data {
> >         const char*name;
> >         /* offset of the capability registers */
> > @@ -35,6 +55,10 @@ struct ci_hdrc_platform_data {
> >         void    (*notify_event) (struct ci_hdrc *ci, unsigned event=
);
> >         struct regulator*reg_vbus;
> >         bool    tpl_support;
> > +
> > +       /* VBUS and ID signal state tracking, using extcon framewor=
k */
> > +       struct ci_hdrc_cablevbus_extcon;
> > +       struct ci_hdrc_cableid_extcon;
> >  };
> >=20
> >  /* Default offset of capability registers */
> > --
> > 1.9.1
> >=20
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
