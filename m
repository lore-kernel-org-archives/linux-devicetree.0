From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v2] usb: typec: get the vbus source and charge values from  the devicetree
Date: Sun, 09 Sep 2018 14:09:34 -0600
Message-ID: <d4ce0dd4974c9550dc3da0f5245a762d@www.akkea.ca>
References: <20180906192644.24587-1-angus@akkea.ca>
 <20180909180531.28092-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180909180531.28092-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: groeck7@gmail.com, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

+Mark
+Rob

On 2018-09-09 12:05, Angus Ainslie (Purism) wrote:
> If the board is being powered by USB disabling the source and sink
> can remove power from the board. Allow the source and sink to be
> initallized based on devicetree values.
> 
> Changed since V1:
> 
> use devicetree values instead of hardcoded initialization.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  .../bindings/connector/usb-connector.txt           |  4 ++++
>  drivers/usb/typec/tcpm.c                           | 14 +++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/connector/usb-connector.txt
> b/Documentation/devicetree/bindings/connector/usb-connector.txt
> index 8855bfcfd778..afe851a713c3 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> @@ -22,6 +22,10 @@ Optional properties for usb-c-connector:
>    or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
>  - data-role: should be one of "host", "device", "dual"(DRD) if typec
>    connector supports USB data.
> +- init-vbus-source: set the initalization value for vbus-source to 
> true.
> +  If this property is not present the initial value will be false.
> +- init-vbus-charge: set the initalization value for vbus-charge to 
> true.
> +  If this property is not present the initial value will be false.
> 
>  Required properties for usb-c-connector with power delivery support:
>  - source-pdos: An array of u32 with each entry providing supported 
> power
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index ca7bedb46f7f..7f5d4f209e07 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -2462,9 +2462,7 @@ static int tcpm_init_vbus(struct tcpm_port *port)
>  {
>  	int ret;
> 
> -	ret = port->tcpc->set_vbus(port->tcpc, false, false);
> -	port->vbus_source = false;
> -	port->vbus_charge = false;
> +	ret = port->tcpc->set_vbus(port->tcpc, port->vbus_source, 
> port->vbus_charge);
>  	return ret;
>  }
> 
> @@ -4266,6 +4264,16 @@ static int tcpm_fw_get_caps(struct tcpm_port 
> *port,
>  		return -EINVAL;
>  	port->port_type = port->typec_caps.type;
> 
> +	if (fwnode_property_present(fwnode, "init-vbus-source"))
> +		port->vbus_source = true;
> +	else
> +		port->vbus_source = false;
> +
> +	if (fwnode_property_present(fwnode, "init-vbus-charge"))
> +	        port->vbus_charge = true;
> +	else
> +	        port->vbus_charge = false;
> +
>  	if (port->port_type == TYPEC_PORT_SNK)
>  		goto sink;
