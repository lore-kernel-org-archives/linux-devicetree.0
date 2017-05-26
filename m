From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] misc: ad525x_dpot_spi: Add device tree support
Date: Fri, 26 May 2017 22:18:38 +0200
Message-ID: <CAK8P3a3wSRTK8wyQwf7E8SO+8HcnazzcL_PUN2-sWCy12hhRSQ@mail.gmail.com>
References: <20170526181746.25896-1-roshni.shah@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170526181746.25896-1-roshni.shah@timesys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roshni Shah <roshni.shah@timesys.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, gregkh <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 8:17 PM, Roshni Shah <roshni.shah@timesys.com> wrote:
> @@ -81,14 +82,26 @@ static const struct ad_dpot_bus_ops bops = {

> +static const struct of_device_id ad_dpot_spi_of_match[] = {
> +       {
> +               .compatible     = "ad,ad5160",
> +               .name           = "ad5160",
> +               .data           = (void *)AD5160_ID,
> +       },
> +       {
> +               .compatible     = "ad,ad5161",
> +               .name           = "ad5161",
> +               .data           = (void *)AD5161_ID,
> +       },

You should only match on 'compatible', not on 'name'. By convention,
the name just describes what the device does.

      Arnd
