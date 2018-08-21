From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] usb: typec: fusb302: Populate tcpc fwnode for TCPM
 property handling
Date: Tue, 21 Aug 2018 07:03:38 -0700
Message-ID: <20180821140338.GE17160@roeck-us.net>
References: <cover.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
 <5ab35968fea28abb54326423523af38dd887ddcc.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5ab35968fea28abb54326423523af38dd887ddcc.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 21, 2018 at 01:28:23PM +0100, Adam Thomson wrote:
> This update populates the tcpc handle's fwnode pointer with the
> child usb-connector node, if it exists, so that TCPM can perform
> generic property handling to define the ports capabilities.
> 
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/fusb302/fusb302.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
> index 82bed98..1b464c9 100644
> --- a/drivers/usb/typec/fusb302/fusb302.c
> +++ b/drivers/usb/typec/fusb302/fusb302.c
> @@ -1736,6 +1736,9 @@ static int fusb302_probe(struct i2c_client *client,
>  	chip->tcpc_dev.config = &chip->tcpc_config;
>  	mutex_init(&chip->lock);
>  
> +	chip->tcpc_dev.fwnode =
> +		device_get_named_child_node(dev, "connector");
> +
>  	if (!device_property_read_u32(dev, "fcs,operating-sink-microwatt", &v))
>  		chip->tcpc_config.operating_snk_mw = v / 1000;
>  
> -- 
> 1.9.1
> 
