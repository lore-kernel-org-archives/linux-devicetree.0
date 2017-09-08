From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 3/3] Bluetooth: btqcomsmd: retrieve BD address from DT
 property
Date: Fri, 8 Sep 2017 12:57:40 +0200
Message-ID: <61944931-B998-4349-A2B1-CAF6D5DD070C@holtmann.org>
References: <1504699898-28011-1-git-send-email-loic.poulain@linaro.org>
 <1504699898-28011-3-git-send-email-loic.poulain@linaro.org>
 <AD664D12-31A5-456B-9971-4A76BDC32BA3@holtmann.org>
 <CAMZdPi8gSnS702LadCL7gRKzYbEtOBUZTYUrN1b_1wiycpC1gw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMZdPi8gSnS702LadCL7gRKzYbEtOBUZTYUrN1b_1wiycpC1gw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bluez mailing list <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Loic,

> > +     /* The local-bd-address property is usually injected by the
> > +      * bootloader which has access to the allocated BD address.
> > +      */
> > +     if (!of_property_read_u8_array(pdev->dev.of_node, "local-bd-address",
> > +                                    (u8 *)&btq->bdaddr, sizeof(bdaddr_t))) {
> > +             BT_INFO("BD address %pMR retrieved from device-tree",
> > +                     &btq->bdaddr);
> > +     }
> 
> any reason you are not using bt_dev_info here? I think it would be important to print the device information prefix.
> 
> Yes, hdev does not have any allocated name/number before being registered.
> I can move this after hci_register_dev if you prefer.

if that is possible, then that would be good.

Regards

Marcel
