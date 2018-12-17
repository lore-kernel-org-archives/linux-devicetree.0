From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 17 Dec 2018 11:25:58 +0000
Message-ID: <BYAPR07MB4709B102102DA96FE975264ADDBC0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87a7lbme3m.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87a7lbme3m.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Felipe
>
>Pawel Laszczak <pawell@cadence.com> writes:
><snip>
>
>>>> +	case USB_REQ_SET_ISOCH_DELAY:
>>>> +		sprintf(str, "Set Isochronous Delay Delay: %d ns", wValue);
>>>> +		break;
>>>> +	default:
>>>> +		sprintf(str,
>>>> +			"SETUP BRT: %02x BR: %02x V: %04x I: %04x L: %04x\n",
>>>> +			bRequestType, bRequest,
>>>> +			wValue, wIndex, wLength);
>>>> +	}
>>>> +
>>>> +	return str;
>>>> +}
>>>
>>>All of these are a flat out copy of dwc3's implementation. It's much,
>>>much better to turn dwc3's implementation into a generic, reusable
>>>library function then spinning your own as a duplicated effort.
>> I agree,
>> It would be nice to have a set of decoding function  in some generic lib=
rary. It could be used
>> also by other drivers.
>> Who should do this ?
>
>since you're the first to reuse it, then it should be you :-)

So I can prepare debug.h  in drivers/usb/gadget directory.=20

Function form drivers/usb/dwc3/debug.h that could be common are:=20

static inline void dwc3_decode_get_status(__u8 t, __u16 i, __u16 l, char *s=
tr)
static inline void dwc3_decode_get_set_descriptor(__u8 t, __u8 b, __u16 v,
						  __u16 i, __u16 l, char *str)
static inline void dwc3_decode_set_clear_feature(__u8 t, __u8 b, __u16 v, _=
_u16 i, char *str)											=09
static inline void dwc3_decode_set_address(__u16 v, char *str)
static inline void dwc3_decode_get_set_descriptor(__u8 t, __u8 b, __u16 v, =
__u16 i, __u16 l, char *str)						 =20
static inline void dwc3_decode_get_configuration(__u16 l, char *str)
static inline void dwc3_decode_set_configuration(__u8 v, char *str)
static inline void dwc3_decode_get_intf(__u16 i, __u16 l, char *str)
static inline void dwc3_decode_set_intf(__u8 v, __u16 i, char *str)
static inline void dwc3_decode_synch_frame(__u16 i, __u16 l, char *str)
static inline const char *dwc3_decode_ctrl(char *str, __u8 bRequestType, __=
u8 bRequest, __u16 wValue, __u16 wIndex, __u16 wLength)

After changed it could looks like:=20
static inline void usb_decode_get_status(__u8 bRequestType, __u16 wIndex, _=
_u16 wLength, char *str)
static inline void usb _decode_get_set_descriptor(__u8 bRequestType, __u8 b=
Request, __u16 wValue,
						  __u16 wIndex, __u16 wLength, char *str)
static inline void usb_decode_set_clear_feature(__u8 bRequestType, __u8 bRe=
quest, __u16 wValue, __u16 wIndex, char *str)											=09
static inline void usb_decode_set_address(__u16 v, char *str)
static inline void usb_decode_get_set_descriptor(__u8 bRequestType, __u8 bR=
equest, __u16 wValue, __u16 wIndex, __u16 wLength, char *str)						 =20
static inline void usb_decode_get_configuration(__u16 wLength, char *str)
static inline void usb_decode_set_configuration(__u8 wValue, char *str)
static inline void usb_decode_get_intf(__u16 wIndex, __u16 wLength, char *s=
tr)
static inline void usb_decode_set_intf(__u8 wValue, __u16 wIndex, char *str=
)
static inline void usb_decode_synch_frame(__u16 wIndex, __u16 wLength, char=
 *str)
static inline const char * usb _decode_ctrl(char *str, __u8 bRequestType, _=
_u8 bRequest, __u16 wValue, __u16 wIndex, __u16 wLength)

Sorry but I prefer some more significant names :)

For me functions in drivers/usb/dwc3/debug.h looks ok, but I think that cou=
ld be better to
add additional usb_decode_test_mode and usb_decode_device_feature and littl=
e simplify usb_decode_get_set_descriptor.=20

What do you think about this?

One more question.=20
Can I add drivers/usb/gadget/debug.h file  as part of my  set patches, or t=
his should be done as separate, new patch ?=20

Cheers,
Pawel
