From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Fri, 15 May 2015 11:32:12 +0200
Message-ID: <4475721.5hJuZmGMm7@wuerfel>
References: <Pine.LNX.4.44L0.1505141152300.1107-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1505141152300.1107-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 May 2015 11:55:36 Alan Stern wrote:
> 
> > +     hcd->phy = devm_of_phy_get(&pdev->dev, pdev->dev.of_node, NULL);
> > +     if (IS_ERR_OR_NULL(hcd->phy)) {
> > +             retval = PTR_ERR(hcd->phy);
> > +             if (retval != -EPROBE_DEFER && retval != -ENODEV)
> > +                     dev_err(&pdev->dev, "failed to get the phy\n");
> > +             else
> > +                     return -EPROBE_DEFER;
> > +             goto err_put_hcd;
> > +     }
> 
> Please straighten out this convoluted logic.  It should go like this:
> 
>         hcd->phy = devm_of_phy_get(&pdev->dev, pdev->dev.of_node, NULL);
>         if (IS_ERR_OR_NULL(hcd->phy)) {
>                 retval = PTR_ERR(hcd->phy);
>                 if (retval == -EPROBE_DEFER || retval == -ENODEV)
>                         return -EPROBE_DEFER;
>                 dev_err(&pdev->dev, "failed to get the phy\n");
>                 goto err_put_hcd;
>         }
> 

IS_ERR_OR_NULL is almost always wrong. Kernel interfaces that can return
an error pointer should never return a NULL pointer, and I'm pretty sure
that is also the case for the phy subsystem (or else it should be fixed).

In some cases, we have interfaces that return NULL pointers or error pointers,
but those are designed to treat NULL as success.

	Arnd
