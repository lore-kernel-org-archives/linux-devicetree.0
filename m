From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 5/6] usb: roles: add USB Type-B GPIO connector driver
Date: Tue, 21 May 2019 15:44:53 +0800
Message-ID: <1558424693.10179.374.camel@mhfsdcap03>
References: <1557823643-8616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1557823643-8616-6-git-send-email-chunfeng.yun@mediatek.com>
 <20190520083151.GD1887@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190520083151.GD1887@kuha.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 2019-05-20 at 11:31 +0300, Heikki Krogerus wrote:
> On Tue, May 14, 2019 at 04:47:22PM +0800, Chunfeng Yun wrote:
> > +static int usb_conn_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node = dev->of_node;
> > +	struct device_node *remote_node;
> > +	struct usb_conn_info *info;
> > +	int ret = 0;
> > +
> > +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> > +	if (!info)
> > +		return -ENOMEM;
> > +
> > +	info->dev = dev;
> > +	info->id_gpiod = devm_gpiod_get_optional(dev, "id", GPIOD_IN);
> > +	if (IS_ERR(info->id_gpiod))
> > +		return PTR_ERR(info->id_gpiod);
> > +
> > +	info->vbus_gpiod = devm_gpiod_get_optional(dev, "vbus", GPIOD_IN);
> > +	if (IS_ERR(info->vbus_gpiod))
> > +		return PTR_ERR(info->vbus_gpiod);
> > +
> > +	if (!info->id_gpiod && !info->vbus_gpiod) {
> > +		dev_err(dev, "failed to get gpios\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (info->id_gpiod)
> > +		ret = gpiod_set_debounce(info->id_gpiod, USB_GPIO_DEB_US);
> > +	if (!ret && info->vbus_gpiod)
> > +		ret = gpiod_set_debounce(info->vbus_gpiod, USB_GPIO_DEB_US);
> > +	if (ret < 0)
> > +		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEB_MS);
> > +
> > +	INIT_DELAYED_WORK(&info->dw_det, usb_conn_detect_cable);
> > +
> > +	info->vbus = devm_regulator_get(dev, "vbus");
> > +	if (IS_ERR(info->vbus)) {
> > +		dev_err(dev, "failed to get vbus\n");
> > +		return PTR_ERR(info->vbus);
> > +	}
> > +
> > +	remote_node = of_graph_get_remote_node(node, -1, 0);
> 
> This is really not ideal. In practice this code will only work if
> there is only one endpoint described for this device, or if the first
> endpoint is always the one we are looking for. There is no way to
> guarantee that.
Yes, it is.
I'll modify it as case 2, see reply [v5, 4/6] in this series.

> 
> The code really has to walk through the entire graph, and identify the
> remote endpoint it's looking for (and for that we have the boolean
> device property).
> 
> > +	if (!remote_node) {
> > +		dev_err(dev, "failed to get remote node\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	info->role_sw =
> > +		fwnode_usb_role_switch_get(of_fwnode_handle(remote_node));
> 
> So fwnode_usb_role_switch_get() needs be the one that walks through
> the graph, not the drivers. Otherwise every driver will do the same
> exact steps (boilerplate). Here you need to be able to just pass the
> node of this device, not the remote endpoint:
> 
>         info->role_sw = fwnode_usb_role_switch_get(dev_fwnode(&client->dev));
> 
> But why do you need that function at all? Why wouldn't
> usb_role_switch_get() work?
> 
>         info->role_sw = usb_role_switch_get(&client->dev);
> 
see reply [v5, 4/6] in this series

Thanks a lot.

> > +	of_node_put(remote_node);
> > +	if (IS_ERR(info->role_sw)) {
> > +		dev_err(dev, "failed to get role switch\n");
> > +		return PTR_ERR(info->role_sw);
> > +	}
> > +
> > +	if (info->id_gpiod) {
> > +		info->id_irq = gpiod_to_irq(info->id_gpiod);
> > +		if (info->id_irq < 0) {
> > +			dev_err(dev, "failed to get ID IRQ\n");
> > +			ret = info->id_irq;
> > +			goto put_role_sw;
> > +		}
> > +
> > +		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
> > +						usb_conn_isr, USB_CONN_IRQF,
> > +						pdev->name, info);
> > +		if (ret < 0) {
> > +			dev_err(dev, "failed to request ID IRQ\n");
> > +			goto put_role_sw;
> > +		}
> > +	}
> > +
> > +	if (info->vbus_gpiod) {
> > +		info->vbus_irq = gpiod_to_irq(info->vbus_gpiod);
> > +		if (info->vbus_irq < 0) {
> > +			dev_err(dev, "failed to get VBUS IRQ\n");
> > +			ret = info->vbus_irq;
> > +			goto put_role_sw;
> > +		}
> > +
> > +		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
> > +						usb_conn_isr, USB_CONN_IRQF,
> > +						pdev->name, info);
> > +		if (ret < 0) {
> > +			dev_err(dev, "failed to request VBUS IRQ\n");
> > +			goto put_role_sw;
> > +		}
> > +	}
> > +
> > +	platform_set_drvdata(pdev, info);
> > +
> > +	/* Perform initial detection */
> > +	usb_conn_queue_dwork(info, 0);
> > +
> > +	return 0;
> > +
> > +put_role_sw:
> > +	usb_role_switch_put(info->role_sw);
> > +	return ret;
> > +}
> 
> thanks,
> 
