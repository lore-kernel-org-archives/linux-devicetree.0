From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v4 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Wed, 20 Feb 2019 06:28:59 +0000
Message-ID: <BYAPR07MB47096562AEB2B07800130D7ADD7D0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1550173514-23573-1-git-send-email-pawell@cadence.com>
 <1550173514-23573-3-git-send-email-pawell@cadence.com>
 <20190219131402.GB20719@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219131402.GB20719@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>On Thu, Feb 14, 2019 at 07:45:10PM +0000, Pawel Laszczak wrote:
>> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
>> to driver/usb/common/debug.c file. These moved functions include:
>>     dwc3_decode_get_status
>>     dwc3_decode_set_clear_feature
>>     dwc3_decode_set_address
>>     dwc3_decode_get_set_descriptor
>>     dwc3_decode_get_configuration
>>     dwc3_decode_set_configuration
>>     dwc3_decode_get_intf
>>     dwc3_decode_set_intf
>>     dwc3_decode_synch_frame
>>     dwc3_decode_set_sel
>>     dwc3_decode_set_isoch_delay
>>     dwc3_decode_ctrl
>>
>> These functions are used also in inroduced cdns3 driver.
>>
>> All functions prefixes were changed from dwc3 to usb.
>> Also, function's parameters has been extended according to the name
>> of fields in standard SETUP packet.
>> Additionally, patch adds usb_decode_ctrl function to
>> include/linux/usb/ch9.h file.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/common/Makefile |   2 +-
>>  drivers/usb/common/debug.c  | 270 ++++++++++++++++++++++++++++++++++++
>>  drivers/usb/dwc3/debug.h    | 249 ---------------------------------
>>  drivers/usb/dwc3/trace.h    |   2 +-
>>  include/linux/usb/ch9.h     |  25 ++++
>>  5 files changed, 297 insertions(+), 251 deletions(-)
>>  create mode 100644 drivers/usb/common/debug.c
>>
>> diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
>> index fb4d5ef4165c..3d3d2962ea4b 100644
>> --- a/drivers/usb/common/Makefile
>> +++ b/drivers/usb/common/Makefile
>> @@ -4,7 +4,7 @@
>>  #
>>
>>  obj-$(CONFIG_USB_COMMON)	  +=3D usb-common.o
>> -usb-common-y			  +=3D common.o
>> +usb-common-y			  +=3D common.o debug.o
>
>It's nice to have these in a common place, but you just bloated all of
>the USB-enabled systems in the world for the use of 2 odd-ball system
>controllers that almost no one has :)
>
>So, any way to only pull in this file if you actually need these
>functions?
>
Yes, I'm using these functions a lot for debugging. It's only way to check =
what driver does.
We are also going to upstreaming 3.1 controller so there will be a third dr=
iver using them :).=20
 =20
I'm not sure If anyone will use them on host side, so we can consider wheth=
er they should be
in usb/common directory. Maybe usb/gadget will be better place.=20

Felipe, do you have any comments in this topic?  =20

Thanks=20
Pawel
