From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: Add support for disabling U1 and
 U2 entries
Date: Mon, 6 May 2019 19:21:02 +0000
Message-ID: <30102591E157244384E984126FC3CB4F639E7BA8@us01wembx1.internal.synopsys.com>
References: <1556792423-4833-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1556792423-4833-4-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Anurag,=0A=
=0A=
Anurag Kumar Vulisha wrote:=0A=
> Gadget applications may have a requirement to disable the U1 and U2=0A=
> entry based on the usecase. For example, when performing performance=0A=
> benchmarking on mass storage gadget the U1 and U2 entries can be disabled=
.=0A=
> Another example is when periodic transfers like ISOC transfers are used=
=0A=
> with bInterval of 1 which doesn't require the link to enter into U1 or U2=
=0A=
> state (since ping is issued from host for every uframe interval). In this=
=0A=
> case the U1 and U2 entry can be disabled. This can be done by setting=0A=
> U1DevExitLat and U2DevExitLat values to 0 in the BOS descriptor. Host on=
=0A=
> seeing 0 value for U1DevExitLat and U2DevExitLat, it doesn't send SET_SEL=
=0A=
> commands to the gadget. Thus entry of U1 and U2 states can be avioded.=0A=
> This patch updates the same=0A=
=0A=
I don't think we should assume that's the case for every host driver.=0A=
=0A=
>=0A=
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>=0A=
> ---=0A=
>  drivers/usb/dwc3/core.c   |  4 ++++=0A=
>  drivers/usb/dwc3/core.h   |  4 ++++=0A=
>  drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++=0A=
>  drivers/usb/dwc3/gadget.h |  6 ++++++=0A=
>  4 files changed, 33 insertions(+)=0A=
>=0A=
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c=0A=
> index a1b126f..4f0912c 100644=0A=
> --- a/drivers/usb/dwc3/core.c=0A=
> +++ b/drivers/usb/dwc3/core.c=0A=
> @@ -1285,6 +1285,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)=
=0A=
>  				"snps,dis_u2_susphy_quirk");=0A=
>  	dwc->dis_enblslpm_quirk =3D device_property_read_bool(dev,=0A=
>  				"snps,dis_enblslpm_quirk");=0A=
> +	dwc->dis_u1_entry_quirk =3D device_property_read_bool(dev,=0A=
> +				"snps,dis_u1_entry_quirk");=0A=
> +	dwc->dis_u2_entry_quirk =3D device_property_read_bool(dev,=0A=
> +				"snps,dis_u2_entry_quirk");=0A=
=0A=
Please use "-" rather than "_" in the property names.=0A=
=0A=
>  	dwc->dis_rxdet_inp3_quirk =3D device_property_read_bool(dev,=0A=
>  				"snps,dis_rxdet_inp3_quirk");=0A=
>  	dwc->dis_u2_freeclk_exists_quirk =3D device_property_read_bool(dev,=0A=
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h=0A=
> index 1528d39..fa398e2 100644=0A=
> --- a/drivers/usb/dwc3/core.h=0A=
> +++ b/drivers/usb/dwc3/core.h=0A=
> @@ -1015,6 +1015,8 @@ struct dwc3_scratchpad_array {=0A=
>   * @dis_u2_susphy_quirk: set if we disable usb2 suspend phy=0A=
>   * @dis_enblslpm_quirk: set if we clear enblslpm in GUSB2PHYCFG,=0A=
>   *                      disabling the suspend signal to the PHY.=0A=
> + * @dis_u1_entry_quirk: set if link entering into U1 state needs to be d=
isabled.=0A=
> + * @dis_u2_entry_quirk: set if link entering into U2 state needs to be d=
isabled.=0A=
>   * @dis_rxdet_inp3_quirk: set if we disable Rx.Detect in P3=0A=
>   * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists=0A=
>   *			in GUSB2PHYCFG, specify that USB2 PHY doesn't=0A=
> @@ -1206,6 +1208,8 @@ struct dwc3 {=0A=
>  	unsigned		dis_u3_susphy_quirk:1;=0A=
>  	unsigned		dis_u2_susphy_quirk:1;=0A=
>  	unsigned		dis_enblslpm_quirk:1;=0A=
> +	unsigned		dis_u1_entry_quirk:1;=0A=
> +	unsigned		dis_u2_entry_quirk:1;=0A=
>  	unsigned		dis_rxdet_inp3_quirk:1;=0A=
>  	unsigned		dis_u2_freeclk_exists_quirk:1;=0A=
>  	unsigned		dis_del_phy_power_chg_quirk:1;=0A=
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c=0A=
> index e293400..f2d3112 100644=0A=
> --- a/drivers/usb/dwc3/gadget.c=0A=
> +++ b/drivers/usb/dwc3/gadget.c=0A=
> @@ -2073,6 +2073,24 @@ static int dwc3_gadget_stop(struct usb_gadget *g)=
=0A=
>  	return 0;=0A=
>  }=0A=
>  =0A=
> +static void dwc3_gadget_config_params(struct usb_gadget *g,=0A=
> +				      struct usb_dcd_config_params *params)=0A=
> +{=0A=
> +	struct dwc3		*dwc =3D gadget_to_dwc(g);=0A=
> +=0A=
> +	/* U1 Device exit Latency */=0A=
> +	if (dwc->dis_u1_entry_quirk)=0A=
> +		params->bU1devExitLat =3D 0;=0A=
> +	else=0A=
> +		params->bU1devExitLat =3D DWC3_DEFAULT_U1_DEV_EXIT_LAT;=0A=
> +=0A=
> +	/* U2 Device exit Latency */=0A=
> +	if (dwc->dis_u2_entry_quirk)=0A=
> +		params->bU2DevExitLat =3D 0;=0A=
> +	else=0A=
> +		params->bU2DevExitLat =3D DWC3_DEFAULT_U2_DEV_EXIT_LAT;=0A=
> +}=0A=
> +=0A=
>  static void dwc3_gadget_set_speed(struct usb_gadget *g,=0A=
>  				  enum usb_device_speed speed)=0A=
>  {=0A=
> @@ -2142,6 +2160,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops =
=3D {=0A=
>  	.udc_start		=3D dwc3_gadget_start,=0A=
>  	.udc_stop		=3D dwc3_gadget_stop,=0A=
>  	.udc_set_speed		=3D dwc3_gadget_set_speed,=0A=
> +	.get_config_params	=3D dwc3_gadget_config_params,=0A=
>  };=0A=
>  =0A=
>  /* ---------------------------------------------------------------------=
----- */=0A=
> diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h=0A=
> index 3ed738e..5faf4d1 100644=0A=
> --- a/drivers/usb/dwc3/gadget.h=0A=
> +++ b/drivers/usb/dwc3/gadget.h=0A=
> @@ -48,6 +48,12 @@ struct dwc3;=0A=
>  /* DEPXFERCFG parameter 0 */=0A=
>  #define DWC3_DEPXFERCFG_NUM_XFER_RES(n)	((n) & 0xffff)=0A=
>  =0A=
> +/* U1 Device exit Latency */=0A=
> +#define DWC3_DEFAULT_U1_DEV_EXIT_LAT	0x0A	/* Less then 10 microsec */=0A=
> +=0A=
> +/* U2 Device exit Latency */=0A=
> +#define DWC3_DEFAULT_U2_DEV_EXIT_LAT	0x1FF	/* Less then 511 microsec */=
=0A=
> +=0A=
>  /* ---------------------------------------------------------------------=
----- */=0A=
>  =0A=
>  #define to_dwc3_request(r)	(container_of(r, struct dwc3_request, request=
))=0A=
=0A=
Setting the exit latency for U1/U2 to 0 to prevent U1/U2 entry looks=0A=
more like a workaround than actually disabling U1/U2. There are=0A=
DCTL.INITU1/2ENA and DCTL.ACCEPTU1/2ENA for that.=0A=
=0A=
Also, if these properties are set, then the device should rejects=0A=
SET_FEATURE(U1/U2) requests.=0A=
=0A=
You can review Felipe's little code snippet from here to disable U1/U2:=0A=
https://marc.info/?l=3Dlinux-usb&m=3D155419284426942&w=3D2=0A=
=0A=
BR,=0A=
Thinh=0A=
