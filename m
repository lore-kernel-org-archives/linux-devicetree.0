From: Anurag Kumar Vulisha <anuragku@xilinx.com>
Subject: RE: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabling U1
 and U2 entries
Date: Thu, 9 May 2019 07:33:46 +0000
Message-ID: <BL0PR02MB5587B28B6CCAC0FD790F8335A7330@BL0PR02MB5587.namprd02.prod.outlook.com>
References: <1557302091-7455-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1557302091-7455-4-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <30102591E157244384E984126FC3CB4F639E9823@us01wembx1.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30102591E157244384E984126FC3CB4F639E9823@us01wembx1.internal.synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, "Claus H. Stovgaard" <cst@phaseone.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>
List-Id: devicetree@vger.kernel.org


Hi Thinh,

>-----Original Message-----
>From: Thinh Nguyen [mailto:Thinh.Nguyen@synopsys.com]
>Sent: Thursday, May 09, 2019 1:03 AM
>To: Anurag Kumar Vulisha <anuragku@xilinx.com>; Greg Kroah-Hartman
><gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Mark Rutla=
nd
><mark.rutland@arm.com>; Felipe Balbi <balbi@kernel.org>; Thinh Nguyen
><Thinh.Nguyen@synopsys.com>; Claus H. Stovgaard <cst@phaseone.com>
>Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; v.anuragkumar@gmail.com
>Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabling U=
1 and U2
>entries
>
>Hi Anurag,
>
>Anurag Kumar Vulisha wrote:
>> Gadget applications may have a requirement to disable the U1 and U2
>> entry based on the usecase. Below are few usecases where the disabling
>> U1/U2 entries may be possible.
>>
>> Usecase 1:
>> When combining dwc3 with an redriver for a USB Type-C device solution, i=
t
>> sometimes have problems with leaving U1/U2 for certain hosts, resulting =
in
>> link training errors and reconnects. For this U1/U2 state entries may be
>> avoided.
>>
>> Usecase 2:
>> When performing performance benchmarking on mass storage gadget the
>> U1 and U2 entries can be disabled.
>>
>> Usecase 3:
>> When periodic transfers like ISOC transfers are used with bInterval
>> of 1 which doesn't require the link to enter into U1 or U2 state entry
>> (since ping is issued from host for every uframe interval). In this
>> case the U1 and U2 entry can be disabled.
>>
>> Disablement of U1/U2 can be done by setting U1DevExitLat and U2DevExitLa=
t
>> values to 0 in the BOS descriptor. Host on seeing 0 value for U1DevExitL=
at
>> and U2DevExitLat, it doesn't send SET_SEL requests to the gadget. There
>> may be some hosts which may send SET_SEL requests even after seeing 0 in
>> the UxDevExitLat of BOS descriptor. To aviod U1/U2 entries for these typ=
e
>> of hosts, dwc3 controller can be programmed to reject those U1/U2 reques=
ts
>> by not enabling ACCEPTUxENA bits in DCTL register.
>>
>> This patch updates the same.
>>
>> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>> Signed-off-by: Claus H. Stovgaard <cst@phaseone.com>
>> ---
>>  Changes in v2
>> 	1. As suggested by Thinh Nguyen changed the "snps,dis_u1_entry_quirk"
>> 	   to "snps,dis-u1-entry-quirk"
>> 	2. Merged the changes done by Claus H. Stovgaard in ep0.c for rejecting
>> 	   U1/U2 requests into this patch. Changes done by Claus can be found
>> 	   here https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__marc.inf=
o_-
>3Fl-3Dlinux-2Dkernel-26m-3D155722068820568-26w-
>3D2&d=3DDwIBAg&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3Du9FYoxKtyhjrGFcyixFYqTjw1ZX0=
Vs
>G2d8FCmzkTY-
>w&m=3DdJMdvubLsepuGRDdkLZNJ00bhu52jPV7TZaFkDGD0Vs&s=3DwT7eyWpRKPAqXmLf
>dfiArbnZ7vE9Vi8DOfRdULmeIqY&e=3D
>> 	3. Changed the commit message.
>> ---
>>  drivers/usb/dwc3/core.c   |  4 ++++
>>  drivers/usb/dwc3/core.h   |  4 ++++
>>  drivers/usb/dwc3/ep0.c    |  9 ++++++++-
>>  drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>>  drivers/usb/dwc3/gadget.h |  6 ++++++
>>  5 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index a1b126f..180239b 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1285,6 +1285,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  				"snps,dis_u2_susphy_quirk");
>>  	dwc->dis_enblslpm_quirk =3D device_property_read_bool(dev,
>>  				"snps,dis_enblslpm_quirk");
>> +	dwc->dis_u1_entry_quirk =3D device_property_read_bool(dev,
>> +				"snps,dis-u1-entry-quirk");
>> +	dwc->dis_u2_entry_quirk =3D device_property_read_bool(dev,
>> +				"snps,dis-u2-entry-quirk");
>>  	dwc->dis_rxdet_inp3_quirk =3D device_property_read_bool(dev,
>>  				"snps,dis_rxdet_inp3_quirk");
>>  	dwc->dis_u2_freeclk_exists_quirk =3D device_property_read_bool(dev,
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index 1528d39..fa398e2 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1015,6 +1015,8 @@ struct dwc3_scratchpad_array {
>>   * @dis_u2_susphy_quirk: set if we disable usb2 suspend phy
>>   * @dis_enblslpm_quirk: set if we clear enblslpm in GUSB2PHYCFG,
>>   *                      disabling the suspend signal to the PHY.
>> + * @dis_u1_entry_quirk: set if link entering into U1 state needs to be =
disabled.
>> + * @dis_u2_entry_quirk: set if link entering into U2 state needs to be =
disabled.
>>   * @dis_rxdet_inp3_quirk: set if we disable Rx.Detect in P3
>>   * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
>>   *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
>> @@ -1206,6 +1208,8 @@ struct dwc3 {
>>  	unsigned		dis_u3_susphy_quirk:1;
>>  	unsigned		dis_u2_susphy_quirk:1;
>>  	unsigned		dis_enblslpm_quirk:1;
>> +	unsigned		dis_u1_entry_quirk:1;
>> +	unsigned		dis_u2_entry_quirk:1;
>>  	unsigned		dis_rxdet_inp3_quirk:1;
>>  	unsigned		dis_u2_freeclk_exists_quirk:1;
>>  	unsigned		dis_del_phy_power_chg_quirk:1;
>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 8efde17..8e94efc 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -379,6 +379,8 @@ static int dwc3_ep0_handle_u1(struct dwc3 *dwc, enum
>usb_device_state state,
>>  	if ((dwc->speed !=3D DWC3_DSTS_SUPERSPEED) &&
>>  			(dwc->speed !=3D DWC3_DSTS_SUPERSPEED_PLUS))
>>  		return -EINVAL;
>> +	if (dwc->dis_u1_entry_quirk)
>
>We only need to reject on SET_FEATURE(enable U1/U2) and not
>SET_FEATURE(disable U1/U2).
>
>Let's change the if condition to if (set && dis_u1_entry_quirk).
>

Thanks for reviewing the patch.
I agree. Will correct it in the next series.

>> +		return -EINVAL;
>>
>>  	reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
>>  	if (set)
>> @@ -401,6 +403,8 @@ static int dwc3_ep0_handle_u2(struct dwc3 *dwc, enum
>usb_device_state state,
>>  	if ((dwc->speed !=3D DWC3_DSTS_SUPERSPEED) &&
>>  			(dwc->speed !=3D DWC3_DSTS_SUPERSPEED_PLUS))
>>  		return -EINVAL;
>> +	if (dwc->dis_u2_entry_quirk)
>
>Same comment as previous.
>

Will fix it in the next series

>> +		return -EINVAL;
>>
>>  	reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
>>  	if (set)
>> @@ -626,7 +630,10 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, st=
ruct
>usb_ctrlrequest *ctrl)
>>  			 * nothing is pending from application.
>>  			 */
>>  			reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
>> -			reg |=3D (DWC3_DCTL_ACCEPTU1ENA |
>DWC3_DCTL_ACCEPTU2ENA);
>> +			if (!dwc->dis_u1_entry_quirk)
>> +				reg |=3D DWC3_DCTL_ACCEPTU1ENA;
>> +			if (!dwc->dis_u2_entry_quirk)
>> +				reg |=3D DWC3_DCTL_ACCEPTU2ENA;
>>  			dwc3_writel(dwc->regs, DWC3_DCTL, reg);
>>  		}
>>  		break;
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index e293400..f2d3112 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2073,6 +2073,24 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
>>  	return 0;
>>  }
>>
>> +static void dwc3_gadget_config_params(struct usb_gadget *g,
>> +				      struct usb_dcd_config_params *params)
>> +{
>> +	struct dwc3		*dwc =3D gadget_to_dwc(g);
>> +
>> +	/* U1 Device exit Latency */
>> +	if (dwc->dis_u1_entry_quirk)
>> +		params->bU1devExitLat =3D 0;
>
>It doesn't make sense to have exit latency of 0. Rejecting
>SET_FEATURE(enable U1/U2) should already let the host know that the
>device doesn't support U1/U2.
>
I am okay to remove this, but I feel that it is better to report zero value=
 instead
of a non-zero value in exit latency of BOS when U1 or U2 entries are not su=
pported.=20
Advantage of reporting 0 is that some hosts doesn't even send SET_FEATURE(U=
1/U2)
requests on seeing zero value in BOS descriptor. Also there can be cases wh=
ere U1 is
disabled and U2 entry is allowed or vice versa, for these kind of cases the=
 driver can
set zero exit latency value for U1 and non-zero exit latency value for U2 .=
 Based on this
I think it would be better to report 0 when U1/U2 states are not enabled. P=
lease provide
your opinion on this.

>> +	else
>> +		params->bU1devExitLat =3D DWC3_DEFAULT_U1_DEV_EXIT_LAT;
>> +
>> +	/* U2 Device exit Latency */
>> +	if (dwc->dis_u2_entry_quirk)
>> +		params->bU2DevExitLat =3D 0;
>> +	else
>> +		params->bU2DevExitLat =3D DWC3_DEFAULT_U2_DEV_EXIT_LAT;
>
>This is a le16 value. Assign it with cpu_to_le16().
>
Sure, will correct this in next series

Thanks,
Anurag Kumar Vulisha

>> +}
>> +
>>  static void dwc3_gadget_set_speed(struct usb_gadget *g,
>>  				  enum usb_device_speed speed)
>>  {
>> @@ -2142,6 +2160,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops=
 =3D {
>>  	.udc_start		=3D dwc3_gadget_start,
>>  	.udc_stop		=3D dwc3_gadget_stop,
>>  	.udc_set_speed		=3D dwc3_gadget_set_speed,
>> +	.get_config_params	=3D dwc3_gadget_config_params,
>>  };
>>
>>  /* --------------------------------------------------------------------=
------ */
>> diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
>> index 3ed738e..5faf4d1 100644
>> --- a/drivers/usb/dwc3/gadget.h
>> +++ b/drivers/usb/dwc3/gadget.h
>> @@ -48,6 +48,12 @@ struct dwc3;
>>  /* DEPXFERCFG parameter 0 */
>>  #define DWC3_DEPXFERCFG_NUM_XFER_RES(n)	((n) & 0xffff)
>>
>> +/* U1 Device exit Latency */
>> +#define DWC3_DEFAULT_U1_DEV_EXIT_LAT	0x0A	/* Less then 10 microsec */
>> +
>> +/* U2 Device exit Latency */
>> +#define DWC3_DEFAULT_U2_DEV_EXIT_LAT	0x1FF	/* Less then 511 microsec
>*/
>> +
>>  /* --------------------------------------------------------------------=
------ */
>>
>>  #define to_dwc3_request(r)	(container_of(r, struct dwc3_request, reques=
t))
>
>BR,
>Thinh
