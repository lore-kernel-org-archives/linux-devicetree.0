From: Anurag Kumar Vulisha <anuragku@xilinx.com>
Subject: RE: [PATCH 3/3] usb: dwc3: gadget: Add support for disabling U1 and
 U2 entries
Date: Tue, 7 May 2019 09:46:33 +0000
Message-ID: <BYAPR02MB5591A7858831136D1C2DA618A7310@BYAPR02MB5591.namprd02.prod.outlook.com>
References: <1556792423-4833-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1556792423-4833-4-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <30102591E157244384E984126FC3CB4F639E7BA8@us01wembx1.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30102591E157244384E984126FC3CB4F639E7BA8@us01wembx1.internal.synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, "Claus H. Stovgaard" <cst@phaseone.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Thinh,

>-----Original Message-----
>From: Thinh Nguyen [mailto:Thinh.Nguyen@synopsys.com]
>Sent: Tuesday, May 07, 2019 12:51 AM
>To: Anurag Kumar Vulisha <anuragku@xilinx.com>; Greg Kroah-Hartman
><gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Mark Rutla=
nd
><mark.rutland@arm.com>; Felipe Balbi <balbi@kernel.org>
>Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; v.anuragkumar@gmail.com
>Subject: Re: [PATCH 3/3] usb: dwc3: gadget: Add support for disabling U1 a=
nd U2
>entries
>
>Hi Anurag,
>
>Anurag Kumar Vulisha wrote:
>> Gadget applications may have a requirement to disable the U1 and U2
>> entry based on the usecase. For example, when performing performance
>> benchmarking on mass storage gadget the U1 and U2 entries can be disable=
d.
>> Another example is when periodic transfers like ISOC transfers are
>> used with bInterval of 1 which doesn't require the link to enter into
>> U1 or U2 state (since ping is issued from host for every uframe
>> interval). In this case the U1 and U2 entry can be disabled. This can
>> be done by setting U1DevExitLat and U2DevExitLat values to 0 in the
>> BOS descriptor. Host on seeing 0 value for U1DevExitLat and
>> U2DevExitLat, it doesn't send SET_SEL commands to the gadget. Thus entry=
 of U1
>and U2 states can be avioded.
>> This patch updates the same
>
>I don't think we should assume that's the case for every host driver.

I agree with you, as Claus already mentioned, observed that windows 10
issues SET_SEL commands even after UxDevExitLat are zero.=20
 =20
>
>>
>> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>> ---
>>  drivers/usb/dwc3/core.c   |  4 ++++
>>  drivers/usb/dwc3/core.h   |  4 ++++
>>  drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>> drivers/usb/dwc3/gadget.h |  6 ++++++
>>  4 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
>> a1b126f..4f0912c 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1285,6 +1285,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  				"snps,dis_u2_susphy_quirk");
>>  	dwc->dis_enblslpm_quirk =3D device_property_read_bool(dev,
>>  				"snps,dis_enblslpm_quirk");
>> +	dwc->dis_u1_entry_quirk =3D device_property_read_bool(dev,
>> +				"snps,dis_u1_entry_quirk");
>> +	dwc->dis_u2_entry_quirk =3D device_property_read_bool(dev,
>> +				"snps,dis_u2_entry_quirk");
>
>Please use "-" rather than "_" in the property names.
>

Okay , will change this

>>  	dwc->dis_rxdet_inp3_quirk =3D device_property_read_bool(dev,
>>  				"snps,dis_rxdet_inp3_quirk");
>>  	dwc->dis_u2_freeclk_exists_quirk =3D device_property_read_bool(dev,
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h index
>> 1528d39..fa398e2 100644
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
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index e293400..f2d3112 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2073,6 +2073,24 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
>>  	return 0;
>>  }
>>
>> +static void dwc3_gadget_config_params(struct usb_gadget *g,
>> +				      struct usb_dcd_config_params *params) {
>> +	struct dwc3		*dwc =3D gadget_to_dwc(g);
>> +
>> +	/* U1 Device exit Latency */
>> +	if (dwc->dis_u1_entry_quirk)
>> +		params->bU1devExitLat =3D 0;
>> +	else
>> +		params->bU1devExitLat =3D DWC3_DEFAULT_U1_DEV_EXIT_LAT;
>> +
>> +	/* U2 Device exit Latency */
>> +	if (dwc->dis_u2_entry_quirk)
>> +		params->bU2DevExitLat =3D 0;
>> +	else
>> +		params->bU2DevExitLat =3D DWC3_DEFAULT_U2_DEV_EXIT_LAT; }
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
>>  /*
>> ----------------------------------------------------------------------
>> ---- */ diff --git a/drivers/usb/dwc3/gadget.h
>> b/drivers/usb/dwc3/gadget.h index 3ed738e..5faf4d1 100644
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
>>  /*
>> ----------------------------------------------------------------------
>> ---- */
>>
>>  #define to_dwc3_request(r)	(container_of(r, struct dwc3_request, reques=
t))
>
>Setting the exit latency for U1/U2 to 0 to prevent U1/U2 entry looks more =
like a
>workaround than actually disabling U1/U2. There are DCTL.INITU1/2ENA and
>DCTL.ACCEPTU1/2ENA for that.
>
>Also, if these properties are set, then the device should rejects
>SET_FEATURE(U1/U2) requests.
>
>You can review Felipe's little code snippet from here to disable U1/U2:
>https://marc.info/?l=3Dlinux-usb&m=3D155419284426942&w=3D2
>

As there are some host platforms (like windows 10) which initiates U1/U2 st=
ates
even after sending zero in UxExitLat of BOS descriptor, I agree with you th=
at the
dwc3 controller should reject the U1/U2 requests from host by configuring D=
CTL.
Along with DCTL changes, I think the changes required for sending zero valu=
e in
UxExitLat field reported in the BOSDescriptor are also required (there is n=
o point
in sending non-zero exit latencies when U1/U2 state entries are disabled). =
So, this
patch changes should be added along with the changes reported by Claus.
Please provide your suggestion on this

Thanks,
Anurag Kumar Vulisha
