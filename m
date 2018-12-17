From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 17 Dec 2018 13:34:00 +0200
Message-ID: <87sgywgzfb.fsf@linux.intel.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com> <1544445555-17325-3-git-send-email-pawell@cadence.com> <87h8fkmfar.fsf@linux.intel.com> <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com> <87a7lbme3m.fsf@linux.intel.com> <BYAPR07MB4709B102102DA96FE975264ADDBC0@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709B102102DA96FE975264ADDBC0@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Pawel Laszczak <pawell@cadence.com> writes:
>>>>> +	case USB_REQ_SET_ISOCH_DELAY:
>>>>> +		sprintf(str, "Set Isochronous Delay Delay: %d ns", wValue);
>>>>> +		break;
>>>>> +	default:
>>>>> +		sprintf(str,
>>>>> +			"SETUP BRT: %02x BR: %02x V: %04x I: %04x L: %04x\n",
>>>>> +			bRequestType, bRequest,
>>>>> +			wValue, wIndex, wLength);
>>>>> +	}
>>>>> +
>>>>> +	return str;
>>>>> +}
>>>>
>>>>All of these are a flat out copy of dwc3's implementation. It's much,
>>>>much better to turn dwc3's implementation into a generic, reusable
>>>>library function then spinning your own as a duplicated effort.
>>> I agree,
>>> It would be nice to have a set of decoding function  in some generic li=
brary. It could be used
>>> also by other drivers.
>>> Who should do this ?
>>
>>since you're the first to reuse it, then it should be you :-)
>
> So I can prepare debug.h  in drivers/usb/gadget directory.=20

no, not there. Host drivers can rely on it too, if they want. Let's have
it on drivers/usb/common/debug.c (or some other name) and a header under in=
clude/linux/usb/

> Function form drivers/usb/dwc3/debug.h that could be common are:=20
>
> static inline void dwc3_decode_get_status(__u8 t, __u16 i, __u16 l, char =
*str)
> static inline void dwc3_decode_get_set_descriptor(__u8 t, __u8 b, __u16 v,
> 						  __u16 i, __u16 l, char *str)
> static inline void dwc3_decode_set_clear_feature(__u8 t, __u8 b, __u16 v,=
 __u16 i, char *str)=09=09=09=09=09=09=09=09=09=09=09=09
> static inline void dwc3_decode_set_address(__u16 v, char *str)
> static inline void dwc3_decode_get_set_descriptor(__u8 t, __u8 b, __u16 v=
, __u16 i, __u16 l, char *str)=09=09=09=09=09=09=20=20
> static inline void dwc3_decode_get_configuration(__u16 l, char *str)
> static inline void dwc3_decode_set_configuration(__u8 v, char *str)
> static inline void dwc3_decode_get_intf(__u16 i, __u16 l, char *str)
> static inline void dwc3_decode_set_intf(__u8 v, __u16 i, char *str)
> static inline void dwc3_decode_synch_frame(__u16 i, __u16 l, char *str)
> static inline const char *dwc3_decode_ctrl(char *str, __u8 bRequestType, =
__u8 bRequest, __u16 wValue, __u16 wIndex, __u16 wLength)
>
> After changed it could looks like:=20
> static inline void usb_decode_get_status(__u8 bRequestType, __u16 wIndex,=
 __u16 wLength, char *str)
> static inline void usb _decode_get_set_descriptor(__u8 bRequestType, __u8=
 bRequest, __u16 wValue,
> 						  __u16 wIndex, __u16 wLength, char *str)
> static inline void usb_decode_set_clear_feature(__u8 bRequestType, __u8 b=
Request, __u16 wValue, __u16 wIndex, char *str)=09=09=09=09=09=09=09=09=09=
=09=09=09
> static inline void usb_decode_set_address(__u16 v, char *str)
> static inline void usb_decode_get_set_descriptor(__u8 bRequestType, __u8 =
bRequest, __u16 wValue, __u16 wIndex, __u16 wLength, char *str)=09=09=09=09=
=09=09=20=20
> static inline void usb_decode_get_configuration(__u16 wLength, char *str)
> static inline void usb_decode_set_configuration(__u8 wValue, char *str)
> static inline void usb_decode_get_intf(__u16 wIndex, __u16 wLength, char =
*str)
> static inline void usb_decode_set_intf(__u8 wValue, __u16 wIndex, char *s=
tr)
> static inline void usb_decode_synch_frame(__u16 wIndex, __u16 wLength, ch=
ar *str)
> static inline const char * usb _decode_ctrl(char *str, __u8 bRequestType,=
 __u8 bRequest, __u16 wValue, __u16 wIndex, __u16 wLength)
>
> Sorry but I prefer some more significant names :)

meh, no worries

> For me functions in drivers/usb/dwc3/debug.h looks ok, but I think that c=
ould be better to
> add additional usb_decode_test_mode and usb_decode_device_feature and lit=
tle simplify usb_decode_get_set_descriptor.=20

sure, just propose patches. Just make sure that your patches do a single
thing per patch. Meaning, first you add a patch moving functions to
drivers/usb/common and updating dwc3, then you add another to decode
test mode (then update dwc3), and another simplifying set_descriptor.

> What do you think about this?
>
> One more question.=20
> Can I add drivers/usb/gadget/debug.h file  as part of my  set patches, or=
 this should be done as separate, new patch ?=20

Your first patch moving functions from dwc3 should move them somewhere ;)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwXiaoACgkQzL64meEa
mQb9+BAA0UfEj50YYeKcKFhqmWi16A5m/NFeikwuBKpNfGBhYln18XPA5NuCCX0t
j1aXzy2C6K11NDXSyA3XSq6LsVNOQP8Xq2B26fnnUNVuuVCdgynNVSxjuOEmfLD3
9o8GmDQ9qvI6QCsjFAM+nZZzakJ8IGYdq87dKDS30rR2+tyRpznD5jXfPqyLB1uK
LtyGcF6z6r851yzJTlEFLtUm4eDJ1pCiRWBJYmqcGPIXXCz1iGTs2Jnmg/fwRoeE
1z6SnQkyoxnKutDTJ7duvY2Y/Oc7H2XwTLtAgEw3jv+AB8UxmlqAF7wxxxK6tXaj
KdsTRPwstiTvOv+PUqFyL/bWx3nJi7IzqpdXZ1UEV4XMxN6O4jSDMSOTmIdteqUH
lMl9i+odGUq58EzPFiiTccufl4m5/Z8u1SR0df0mplQNlJLpV8vkVMrRakmZVOzk
wMUBbx03Pe6JLax1/q6FPFlc2PmtzKiiCUbePQ2J4GAzj7nhSUCtj0OJ4JPTVEw0
umAJ+7F6pIzKpur2RZ4+kETCEjLft/4cyo4yc6jW14hwtXz7FgrAza/0ZtWInhNm
ruiF6umHuyJFcZZT60+Sbp/+YX1Q/brgvWoMYEgmO124giOKTC++H1er0URPTXIN
4YyzAJkdKhVfCJFo85aQmXYN/OCbhI2ffvjYLqTJ6Lz9t8DNB3o=
=qwLD
-----END PGP SIGNATURE-----
--=-=-=--
