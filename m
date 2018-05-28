Return-Path: <SRS0=ixdV=IP=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1527232376-5613-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1527232376-5613-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 May 2018 15:47:00 +0300
Message-ID: <CAHp75VcFNkrBXXgCB+pQJHGvHquik7OMD+W=eZn4Gj9b14799w@mail.gmail.com>
Subject: Re: [PATCH v5] usb: gadget: udc: renesas_usb3: Add register of usb
 role switch
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, USB <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, May 25, 2018 at 10:12 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:

> -static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)

Wouldn't be better to choose another name for a new function?

> +       struct renesas_usb3 *usb3 = container_of(work, struct renesas_usb3,
> +                                                role_work);

Matter of style, though I would rather put entire container_of() on
the next line (see for the existing style in the module and use it).

> +               /* This device_attach() might sleep */
> +               if (device_attach(host) < 0)
> +                       dev_err(dev, "device_attach(usb3_port) failed\n");

can't be "usb3_port" part derived from the host variable somehow and
to some extend?

> +       usb3->role_sw = usb_role_switch_register(&pdev->dev,
> +                                       &renesas_usb3_role_switch_desc);
> +       if (!IS_ERR(usb3->role_sw)) {

> +               usb3->host_dev = usb_of_get_companion_dev(&pdev->dev);

Hmm... Can it possible return -EPROBE_DEFER? If so, would it be better
to use other approach to handle it?

> +               if (IS_ERR_OR_NULL(usb3->host_dev)) {
> +                       /* If not found, this driver will not use a role sw */
> +                       usb_role_switch_unregister(usb3->role_sw);
> +                       usb3->role_sw = NULL;
> +               }
> +       } else {
> +               usb3->role_sw = NULL;
> +       }


-- 
With Best Regards,
Andy Shevchenko
