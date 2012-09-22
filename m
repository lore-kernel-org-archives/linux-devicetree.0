From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Kirkwood: ehci-orion: Add device tree binding
Date: Fri, 21 Sep 2012 22:02:32 -0700
Message-ID: <CAOesGMh1x8QMNBi_xKEfZ0druiAZbafVuXEQkktwVbQODDmR8w@mail.gmail.com>
References: <1346491586-23480-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346491586-23480-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Sorry for the late feedback but I didn't notice this until I looked at
the pull request from Jason.

Please go back and revisit these bindings. I'll merge in the current
version but they need to be fixed up.

Also, always cc devicetree-discuss and the DT maintainers on new bindings.

On Sat, Sep 1, 2012 at 2:26 AM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> Based on previous work by Michael Walle and Jason Cooper.
>
> Made their work actually work, which required added interrupt from DT
> and auxdata, along with setting the dma_mask, which DT does not
> currently do.
>
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ehci-orion.txt         |   19 +++++++
>  drivers/usb/host/ehci-orion.c                      |   59 +++++++++++++++++++-
>  2 files changed, 75 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/ehci-orion.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/ehci-orion.txt b/Documentation/devicetree/bindings/usb/ehci-orion.txt
> new file mode 100644
> index 0000000..1bd704e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ehci-orion.txt
> @@ -0,0 +1,19 @@
> +* EHCI controller, Orion Marvell variants
> +
> +Required properties:
> +- compatible: must be "marvell,orion-ehci"
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- interrupts: The EHCI interrupt
> +- phy-version: Can be one of:
> +  "NA" - Don't touch the phy, something else has already configured it.
> +  "orion5x" - PHY setup as specified by the Orion5x Errata
> +
> +Example:
> +
> +       ehci@50000 {
> +               compatible = "marvell,orion-ehci";
> +               reg = <0x50000 0x1000>;
> +               interrupts = <19>;
> +               phy-version = "NA";
> +       };

This isn't an appropriate binding for phy. I know, it maps straight
over from the platform data, but it doesn't focus on what the actual
hardware is.

A couple of options. What probably makes most sense depending on how
other phy bindings are moving ahead is to add a phy node under the
ehci controller for the "orion5x" case, and have an appropriate
compatible value there. No node means the same as "NA" in the above
binding. Alternatively, have a phy phandle that points to the phy
device if it sits on an i2c bus, etc.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
