From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [RFC PATCH 03/11] drm: sun4i: ignore swapped
 mixer<->tcon connection for DE2
Date: Sat, 20 May 2017 02:00:22 +0800
Message-ID: <ECF29F56-DF18-4E3C-9C85-B29F89BD4228@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io> <20170517164354.16399-4-icenowy@aosc.io> <20170519175753.sygqnwopk7tuv35n@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBP7F7TEAKGQEWWJUA7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170519175753.sygqnwopk7tuv35n-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881:=
57:53, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Thu, May 18, 2017 at 12:43:46AM +0800, Icenowy Zheng wrote:
>> Some SoC's DE2 has two mixers. Defaultly the mixer0 is connected to
>> tcon0 and mixer1 is connected to tcon1; however by setting a bit
>> the connection can be swapped.
>>=20
>> As we now hardcode the default connection, ignore the bonus endpoint
>for
>> the mixer's output and the TCON's input, as they stands for the
>swapped
>> connection.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  drivers/gpu/drm/sun4i/sun4i_drv.c  | 27 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 39
>+++++++++++++++++++++++++++++---------
>>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
>>  3 files changed, 59 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c
>b/drivers/gpu/drm/sun4i/sun4i_drv.c
>> index 1dd1948025d2..29bf1325ded6 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
>> @@ -173,6 +173,13 @@ static bool sun4i_drv_node_is_frontend(struct
>device_node *node)
>>  		of_device_is_compatible(node,
>"allwinner,sun8i-a33-display-frontend");
>>  }
>> =20
>> +static bool sun4i_drv_node_is_swappable_de2_mixer(struct device_node
>*node)
>> +{
>> +	/* The V3s has only one mixer-tcon pair, so it's not listed here.
>*/
>> +	return of_device_is_compatible(node,
>"allwinner,sun8i-h3-de2-mixer0") ||
>> +		of_device_is_compatible(node, "allwinner,sun8i-h3-de2-mixer1");
>> +}
>> +
>>  static bool sun4i_drv_node_is_tcon(struct device_node *node)
>>  {
>>  	return of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||
>> @@ -249,6 +256,26 @@ static int sun4i_drv_add_endpoints(struct device
>*dev,
>>  			}
>>  		}
>> =20
>> +		/*
>> +		 * The second endpoint of the output of a swappable DE2 mixer
>> +		 * is the TCON after connection swapping.
>> +		 * Ignore it now, as we now hardcode mixer0->tcon0,
>> +		 * mixer1->tcon1 connection.
>> +		 */
>> +		if (sun4i_drv_node_is_swappable_de2_mixer(node)) {
>> +			struct of_endpoint endpoint;
>> +
>> +			if (of_graph_parse_endpoint(ep, &endpoint)) {
>> +				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
>> +				continue;
>> +			}
>> +
>> +			if (endpoint.id) {
>> +				DRM_DEBUG_DRIVER("Endpoint is an unused connection for DE2
>mixer... skipping\n");
>> +				continue;
>> +			}
>> +		}
>> +
>>  		/* Walk down our tree */
>>  		count +=3D sun4i_drv_add_endpoints(dev, match, remote);
>> =20
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> index f44a37a5993d..89a215ff2370 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> @@ -425,7 +425,8 @@ static int sun4i_tcon_init_regmap(struct device
>*dev,
>>   * requested via the get_id function of the engine.
>>   */
>>  static struct sunxi_engine *sun4i_tcon_find_engine(struct sun4i_drv
>*drv,
>> -						   struct device_node *node)
>> +						   struct device_node *node,
>> +						   bool skip_bonus_ep)
>>  {
>>  	struct device_node *port, *ep, *remote;
>>  	struct sunxi_engine *engine;
>> @@ -439,6 +440,20 @@ static struct sunxi_engine
>*sun4i_tcon_find_engine(struct sun4i_drv *drv,
>>  		if (!remote)
>>  			continue;
>> =20
>> +		if (skip_bonus_ep) {
>> +			struct of_endpoint endpoint;
>> +
>> +			if (of_graph_parse_endpoint(ep, &endpoint)) {
>> +				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
>> +				continue;
>> +			}
>> +
>> +			if (endpoint.id) {
>> +				DRM_DEBUG_DRIVER("Skipping bonus mixer->TCON connection when
>searching engine\n");
>> +				continue;
>> +			}
>> +		}
>> +
>
>You don't list the mixers in the tcon's output, why do you need that
>exactly?

Mixers are TCONs' input, not output...

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
