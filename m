From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 15/21] drm: sun4i: add support for HVCC
 regulator for DWC HDMI glue
Date: Wed, 02 May 2018 19:51:37 +0800
Message-ID: <2E519B6E-D1BA-4C6F-9105-446E564FBBB6@aosc.io>
References: <20180430114058.5061-1-jagan@amarulasolutions.com> <20180430114058.5061-16-jagan@amarulasolutions.com> <20180502114843.ou4qczp5eaigrdfo@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB36MU3LQKGQEOGM3RMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180502114843.ou4qczp5eaigrdfo@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B45=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=887:4=
8:43, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Apr 30, 2018 at 05:10:52PM +0530, Jagan Teki wrote:
>> From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>=20
>> Allwinner SoCs with DWC HDMI controller have a "HVCC" power pin for
>the
>> HDMI part, and on some boards it's connected to a dedicated regulator
>> rather than the main 3.3v.
>>=20
>> Add support for optional HVCC regulator. For boards that doesn't use
>a
>> dedicated regulator to power it, the default dummy regulator is used.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> ---
>>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 14 ++++++++++++++
>>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |  2 ++
>>  2 files changed, 16 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
>b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
>> index 9f40a44b456b..7c33faff7ad4 100644
>> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
>> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
>> @@ -73,6 +73,12 @@ static int sun8i_dw_hdmi_bind(struct device *dev,
>struct device *master,
>>  	if (encoder->possible_crtcs =3D=3D 0)
>>  		return -EPROBE_DEFER;
>> =20
>> +	hdmi->vcc_hdmi =3D devm_regulator_get(dev, "hvcc");
>> +	if (IS_ERR(hdmi->vcc_hdmi)) {
>> +		dev_err(dev, "Could not get HDMI power supply\n");
>> +		return PTR_ERR(hdmi->vcc_hdmi);
>> +	}
>> +
>
>You're not making it optional here, unlike what your commit log
>says. Not that I'm fine with both, but we need to be consistent :)

If it's not set, regulator subsystem will generate a dummy
regulator as a spaceholder, except using the exclusive variant
of the function.

The word "optional" is from DT perspectove, as it's possible that
it's bound to some critical regulators.

>
>>  	hdmi->rst_ctrl =3D devm_reset_control_get(dev, "ctrl");
>>  	if (IS_ERR(hdmi->rst_ctrl)) {
>>  		dev_err(dev, "Could not get ctrl reset control\n");
>> @@ -91,6 +97,12 @@ static int sun8i_dw_hdmi_bind(struct device *dev,
>struct device *master,
>>  		return ret;
>>  	}
>> =20
>> +	ret =3D regulator_enable(hdmi->vcc_hdmi);
>> +	if (ret) {
>> +		dev_err(dev, "Cannot enable HDMI power supply\n");
>> +		goto err_disable_vcc;
>> +	}
>> +
>>  	ret =3D clk_prepare_enable(hdmi->clk_tmds);
>>  	if (ret) {
>>  		dev_err(dev, "Could not enable tmds clock\n");
>> @@ -143,6 +155,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev,
>struct device *master,
>>  	clk_disable_unprepare(hdmi->clk_tmds);
>>  err_assert_ctrl_reset:
>>  	reset_control_assert(hdmi->rst_ctrl);
>> +err_disable_vcc:
>> +	regulator_disable(hdmi->vcc_hdmi);
>
>
>The err_disable_vcc label will disable the regulator, but if there's
>an error in regulator_enable, it will disable it while it wasn't
>enabled in the first place, which is not really something we want to
>do.
>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
