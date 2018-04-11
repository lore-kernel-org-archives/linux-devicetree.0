Return-Path: <SRS0=2R+r=HA=linux.intel.com=heikki.krogerus@kernel.org>
Date: Wed, 11 Apr 2018 11:01:37 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] usb: role: rcar-usb3-role-switch: add support for R-Car
 SoCs
Message-ID: <20180411080137.GB7517@kuha.fi.intel.com>
References: <1523361826-8772-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAHp75Vd20+dQewCsy-UPpSw+5OkuVhok=MEYLJ8OqPHEQKSZdA@mail.gmail.com>
 <TY1PR06MB0992CB520090B80CB8B68104D8BD0@TY1PR06MB0992.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0992CB520090B80CB8B68104D8BD0@TY1PR06MB0992.apcprd06.prod.outlook.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, USB <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 11, 2018 at 03:15:23AM +0000, Yoshihiro Shimoda wrote:
> > > +       host_node = of_parse_phandle(pdev->dev.of_node, "renesas,host", 0);
> > > +       if (!host_node)
> > > +               return -ENODEV;
> > > +
> > > +       pdev_host = of_find_device_by_node(host_node);
> > > +       if (!pdev_host)
> > > +               return -ENODEV;
> > > +
> > > +       of_node_put(host_node);
> > 
> > Isn't what Heikki tried to solve with graphs and stuff like that?
> 
> Heikki prepared "device connection" framework (devcon) [1] to get a device pointer.
> However, IIUC, we need to improve the framework for device tree environment because:
>  - The devcon needs each dev_name() through the endpoint array of struct device_connection.
>  - Each dev_name() on device tree environment will be <base address register>.<device name>,
>    f.e. "ee020000.usb". So, I don???t think adding such strings to a driver is a good way.

That is how the build-in connection descriptions are handled, but in
this case you want to describe them in your bindings, and to do that you
should use remote-endpoints, ie. OF graph bindings: bindings/graph.txt

> So, I wrote such a code by using existing APIs.
> Should I improve the framework first somehow? Or, is my understanding incorrect?

You don't necessarily need to propose any changes to the device
connection framework at this point, but you do need to use graph for
describing that connection. Once we add device graph handling to the
device connection framework, it is no problem to update this driver.

Of course, if you have time and interest in preparing a proposal for
graph handling to the device connection framework, I would appreciate
it.


Thanks,

-- 
heikki
