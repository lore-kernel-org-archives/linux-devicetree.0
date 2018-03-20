Return-Path: <SRS0=WXNT=GK=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH 2/5] usb: typec: fusb302: remove max_snk_* for sink config
References: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
 <1521541570-25363-3-git-send-email-jun.li@nxp.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d76c9c9-5e73-bf71-c0cd-db4070dadece@redhat.com>
Date: Tue, 20 Mar 2018 13:29:01 +0100
MIME-Version: 1.0
In-Reply-To: <1521541570-25363-3-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On 20-03-18 11:26, Li Jun wrote:
> Since max_snk_* is to be deprecated, so remove max_snk_* by adding a
> variable PDO for sink config.

NACK there are actual users of the device-properties which you are
now breaking. As I mentioned in another thread, you need to instead
add the pdo array to the fusb302_chip struct (so that it is no longer
const) and generate a PDO_VAR pdo based on the device-properties.

Regards,

Hans


> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   drivers/usb/typec/fusb302/fusb302.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
> index da179aa..c183f46 100644
> --- a/drivers/usb/typec/fusb302/fusb302.c
> +++ b/drivers/usb/typec/fusb302/fusb302.c
> @@ -1207,6 +1207,7 @@ static const u32 src_pdo[] = {
>   
>   static const u32 snk_pdo[] = {
>   	PDO_FIXED(5000, 400, PDO_FIXED_FLAGS),
> +	PDO_VAR(800, 5000, 3000),
>   };
>   
>   static const struct tcpc_config fusb302_tcpc_config = {
> @@ -1214,9 +1215,6 @@ static const struct tcpc_config fusb302_tcpc_config = {
>   	.nr_src_pdo = ARRAY_SIZE(src_pdo),
>   	.snk_pdo = snk_pdo,
>   	.nr_snk_pdo = ARRAY_SIZE(snk_pdo),
> -	.max_snk_mv = 5000,
> -	.max_snk_ma = 3000,
> -	.max_snk_mw = 15000,
>   	.operating_snk_mw = 2500,
>   	.type = TYPEC_PORT_DRP,
>   	.default_role = TYPEC_SINK,
> @@ -1784,15 +1782,6 @@ static int fusb302_probe(struct i2c_client *client,
>   	chip->tcpc_dev.config = &chip->tcpc_config;
>   	mutex_init(&chip->lock);
>   
> -	if (!device_property_read_u32(dev, "fcs,max-sink-microvolt", &v))
> -		chip->tcpc_config.max_snk_mv = v / 1000;
> -
> -	if (!device_property_read_u32(dev, "fcs,max-sink-microamp", &v))
> -		chip->tcpc_config.max_snk_ma = v / 1000;
> -
> -	if (!device_property_read_u32(dev, "fcs,max-sink-microwatt", &v))
> -		chip->tcpc_config.max_snk_mw = v / 1000;
> -
>   	if (!device_property_read_u32(dev, "fcs,operating-sink-microwatt", &v))
>   		chip->tcpc_config.operating_snk_mw = v / 1000;
>   
> 
