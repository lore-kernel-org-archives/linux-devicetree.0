Return-Path: <r.sh.open@gmail.com>
MIME-Version: 1.0
Sender: r.sh.open@gmail.com
In-Reply-To: <1398879850-9111-7-git-send-email-dianders@chromium.org>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
	<1398879850-9111-7-git-send-email-dianders@chromium.org>
Date: Tue, 6 May 2014 16:25:54 +0530
Message-ID: <CAPdUM4N_HRL+i+YpScK+W7xOzKEB=Sa4MaVMdMP8yNcGOmHLPA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] i2c: ChromeOS EC tunnel driver
From: Rahul Sharma <rahul.sharma@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
To: Doug Anderson <dianders@chromium.org>
Cc: lee.jones@linaro.org, Stephen Warren <swarren@nvidia.com>, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, Olof Johansson <olof@lixom.net>, sjg@chromium.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-tegra@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, rdunlap@infradead.org, sameo@linux.intel.com, jdelvare@suse.de, shane.huang@amd.com, Maxime Ripard <maxime.ripard@free-electrons.com>, laurent.pinchart+renesas@ideasonboard.com, u.kleine-koenig@pengutronix.de, bjorn.andersson@sonymobile.com, kevin.strasser@linux.intel.com, linux@prisktech.co.nz, andrew@lunn.ch, andriy.shevchenko@linux.intel.com, schwidefsky@de.ibm.com, matt.porter@linaro.org, ch.naveen@samsung.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org, sunil joshi <joshi@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Hi Doug,

On 30 April 2014 23:14, Doug Anderson <dianders@chromium.org> wrote:
> On ARM Chromebooks we have a few devices that are accessed by both the
> AP (the main "Application Processor") and the EC (the Embedded
> Controller).  These are:
[snip]

> +       .remove = ec_i2c_remove,
> +       .driver = {
> +               .name = "cros-ec-i2c-tunnel",
> +       },
> +};
> +
> +module_platform_driver(ec_i2c_tunnel_driver);

In peach-pit, tps65090 is connected to i2c tunnel which provides
regulators for lcd, led and hdmi. We need to make all regulators
available before platform devices get probed. Shall it be changed to
subsys_initcall like other i2c controllers ?

Regards,
Rahul Sharma

> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("EC I2C tunnel driver");
> +MODULE_ALIAS("platform:cros-ec-i2c-tunnel");
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index c58ab96..61bc909 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -90,6 +90,11 @@ static const struct mfd_cell cros_devs[] = {
>                 .id = 1,
>                 .of_compatible = "google,cros-ec-keyb",
>         },
> +       {
> +               .name = "cros-ec-i2c-tunnel",
> +               .id = 2,
> +               .of_compatible = "google,cros-ec-i2c-tunnel",
> +       },
>  };
>
>  int cros_ec_register(struct cros_ec_device *ec_dev)
> --
> 1.9.1.423.g4596e3a
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
