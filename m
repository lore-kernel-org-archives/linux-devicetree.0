From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v15 12/12] drm: bridge/dw_hdmi: add rockchip rk3288 support
Date: Tue, 02 Dec 2014 20:34:53 +0800
Message-ID: <547DB1ED.7000409@rock-chips.com>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>	 <1417506327-18908-1-git-send-email-andy.yan@rock-chips.com> <1417515882.3411.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417515882.3411.8.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kuma
List-Id: devicetree@vger.kernel.org

Hi Philipp:
On 2014=E5=B9=B412=E6=9C=8802=E6=97=A5 18:24, Philipp Zabel wrote:
> Hi Andy,
>
> Am Dienstag, den 02.12.2014, 15:45 +0800 schrieb Andy Yan:
> [...]
>> +static int dw_hdmi_rockchip_bind(struct device *dev, struct device =
*master,
>> +				 void *data)
>> +{
>> +	struct platform_device *pdev =3D to_platform_device(dev);
>> +	const struct dw_hdmi_plat_data *plat_data;
>> +	const struct of_device_id *match;
>> +	struct drm_device *drm =3D data;
>> +	struct drm_encoder *encoder;
>> +	struct rockchip_hdmi *hdmi;
>> +	int ret;
>> +
>> +	if (!pdev->dev.of_node)
>> +		return -ENODEV;
>> +
>> +	hdmi =3D devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>> +	if (!hdmi)
>> +		return -ENOMEM;
>> +
>> +	match =3D of_match_node(dw_hdmi_rockchip_ids, pdev->dev.of_node);
>> +	plat_data =3D match->data;
>> +	hdmi->dev =3D &pdev->dev;
>> +	encoder =3D &hdmi->encoder;
>> +	platform_set_drvdata(pdev, hdmi);
>> +
>> +	ret =3D rockchip_hdmi_parse_dt(hdmi);
>> +	if (ret) {
>> +		dev_err(hdmi->dev, "Unable to parse OF data\n");
>> +		return ret;
>> +	}
>> +
>> +	ret =3D clk_prepare_enable(hdmi->clk);
>> +	if (ret) {
>> +		dev_err(hdmi->dev, "Cannot enable HDMI clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D clk_prepare_enable(hdmi->hdcp_clk);
>> +	if (ret) {
>> +		dev_err(hdmi->dev, "Cannot enable HDMI hdcp clock: %d\n", ret);
>> +		return ret;
>> +	}
> Could we have a look at the clocks again? Basically the Rockchip cloc=
k
> handling is exactly the same, except the clocks are called by other
> names.
>
> On i.MX6, according to the reference manual, the HDMI TX module has f=
our
> clock inputs: "iahbclk" (bus clock), "icecclk" (32 kHz CEC clock),
> "ihclk" (module clock), and "isfrclk" (27 MHz internal SFR clock).
> The "iahbclk" and "ihclk" are both sourced from the SoC AHB root cloc=
k,
> the 32 kHz reference input can't be gated, and the "isfrclk" has its =
own
> gate.
>
> Does the HDMI TX implementation on Rockchip still have the separate
> external sfr bus and module clock inputs? I assume that your "clk" in=
put
> is a single gate bit for bus and module clocks at the same time?
> If possible, I'd prefer to find a common binding for the clocks with
> some of the clocks being optional, but for that we need to know the
> actual clock inputs to the HDMI TX module.
>
> regards
> Philipp
>
     There are three  individual clock inputs on Rockchip RK3288 HDMI:=20
"hdmi_ctrl_clk",
     "hdmi_cec_clk", "hdmi_hdcp_clk", the three clocks are responsible=20
for different
      functions as their name described, and have their own private gat=
e=20
bit. That is
      to say, the cec_clk and hdcp_clk can all be disabled if we don't=20
need hdcp and cec
      function.
      So I think it's better to make the clk control platform independe=
nt.

     Heiko, do you have any suggestions?
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
