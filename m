From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v5 4/6] usb: roles: add API to get usb_role_switch by node
Date: Mon, 27 May 2019 13:45:06 +0300
Message-ID: <20190527104506.GA7167@kuha.fi.intel.com>
References: <20190520083601.GE1887@kuha.fi.intel.com>
 <OSBPR01MB2103C4C8920C40E42BC1B2A9B8060@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190521095839.GI1887@kuha.fi.intel.com>
 <OSBPR01MB21032206146152983C8F4E8EB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <1558517436.10179.388.camel@mhfsdcap03>
 <OSBPR01MB21038F2B99EF74831A22727BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190522142640.GN1887@kuha.fi.intel.com>
 <1558606570.10179.403.camel@mhfsdcap03>
 <20190524114036.GO1887@kuha.fi.intel.com>
 <1558926443.10179.438.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1558926443.10179.438.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi,

> > IMO that case should be handled in USB role switch API initially, not
> > in the device connection API. If there is another user for it one day,
> > then we can move it to device connection API, but not before that.
> Ok
> > 
> > How about this on top of the two patches I sent:
> I just test it, it works well.
> I'll prepare a patch and put into this series.
> 
> > 
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index aab795b54c7f..36ac9d181e09 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -114,6 +114,19 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
> >         return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> >  }
> > 
> > +static struct usb_role_switch *
> > +usb_role_switch_is_parent(struct fwnode_handle *parent)
> > +{
> > +       struct device *dev;
> > +
> > +       if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
> > +               return NULL;
> > +
> > +       dev = class_find_device(role_class, NULL, parent, switch_fwnode_match);
> > +
> > +       return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> > +}
> > +
> >  /**
> >   * usb_role_switch_get - Find USB role switch linked with the caller
> >   * @dev: The caller device
> > @@ -125,6 +138,10 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
> >  {
> >         struct usb_role_switch *sw;
> > 
> > +       sw = usb_role_switch_is_parent(fwnode_get_parent(dev_fwnode(dev)));
> > +       if (sw)
> > +               return sw;
> Do we also need to get parent module before return?

Yes.

thanks,

-- 
heikki
