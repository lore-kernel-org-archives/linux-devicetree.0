From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v6 19/39] media: Add i.MX media core driver
Date: Thu, 6 Apr 2017 16:51:08 -0700
Message-ID: <fafcad5e-1717-cd85-6763-b52e242ea2f1@gmail.com>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-20-git-send-email-steve_longerbeam@mentor.com>
 <1491471814.2392.11.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491471814.2392.11.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/06/2017 02:43 AM, Philipp Zabel wrote:
> On Mon, 2017-03-27 at 17:40 -0700, Steve Longerbeam wrote:
>> Add the core media driver for i.MX SOC.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> [...]
>> diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
>> new file mode 100644
>> index 0000000..b383be4
>> --- /dev/null
>> +++ b/drivers/staging/media/imx/imx-media-of.c
>> @@ -0,0 +1,267 @@
> [...]
>> +/*
>> + * find the remote device node and remote port id (remote pad #)
>> + * given local endpoint node
>> + */
>> +static void of_get_remote_pad(struct device_node *epnode,
>> +			      struct device_node **remote_node,
>> +			      int *remote_pad)
>> +{
>> +	struct device_node *rp, *rpp;
>> +	struct device_node *remote;
>> +
>> +	rp = of_graph_get_remote_port(epnode);
>> +	rpp = of_graph_get_remote_port_parent(epnode);
>> +
>> +	if (of_device_is_compatible(rpp, "fsl,imx6q-ipu")) {
>> +		/* the remote is one of the CSI ports */
>> +		remote = rp;
>> +		*remote_pad = 0;
>> +		of_node_put(rpp);
>> +	} else {
>> +		remote = rpp;
>> +		of_property_read_u32(rp, "reg", remote_pad);
>
> If this fails because there is no reg property, *remote_pad will keep
> the previous value. It should be set to 0 in this case.

Ok, I will apply this change.

Steve

>
> ----------8<----------
> --- a/drivers/staging/media/imx/imx-media-of.c
> +++ b/drivers/staging/media/imx/imx-media-of.c
> @@ -85,7 +85,9 @@ static void of_get_remote_pad(struct device_node *epnode,
>                 of_node_put(rpp);
>         } else {
>                 remote = rpp;
> -               of_property_read_u32(rp, "reg", remote_pad);
> +               /* FIXME port number and pad index are not the same */
> +               if (of_property_read_u32(rp, "reg", remote_pad))
> +                       *remote_pad = 0;
>                 of_node_put(rp);
>         }
>
> ---------->8----------
>
> regards
> Philipp
>
