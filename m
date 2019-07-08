From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 8 Jul 2019 12:39:07 +0000
Message-ID: <BYAPR07MB470932E0BC5FA1B1753C2C47DDF60@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <87r274lmqk.fsf@linux.intel.com>
 <BYAPR07MB4709EF3753AC0B87606B1182DDF70@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87a7dpm442.fsf@linux.intel.com>
 <BYAPR07MB4709E5BA041BBDDB70E69F62DDF60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <874l3wn5ep.fsf@linux.intel.com>
 <BYAPR07MB47097C3C2A2BBA2AA63C65DEDDF60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <874l3whh4g.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <874l3whh4g.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org


>
>(please send it as a formal patch from now on)
I will send it. I think even today.=20

>
>Hi,
>
>Pawel Laszczak <pawell@cadence.com> writes:
>> The prototype was added , but not all text was past. Sorry for that.
>>
>> Fixed version:  with your changes.
>>
>> ///// v2 corrected
>> commit 4553d48dd0500085d90c8280e28714072279c3dd (HEAD)
>> Author: Pawel Laszczak <pawell@cadence.com>
>> Date:   Mon Jul 8 12:53:47 2019 +0200
>>
>>     usb: common: Add usb_get_dr_mode_from_string and usb_dr_mode_to_stri=
ng.
>>
>>     Patch introduces new function usb_dr_mode_to_string for converting d=
ual role
>>     mod to string and removes static from usb_dr_mode_to_string definiti=
on.
>>
>>     Both changes have made to avoid duplication of code by cdns3 driver.
>
>missing Signed-off-by
>
>> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
>> index 69f1b6328532..c156817672c4 100644
>> --- a/include/linux/usb/otg.h
>> +++ b/include/linux/usb/otg.h
>> @@ -129,4 +129,20 @@ enum usb_dr_mode {
>>   */
>>  extern enum usb_dr_mode usb_get_dr_mode(struct device *dev);
>>
>> +/**
>> + * usb_get_dr_mode_from_string - Convert string to dual role mode.
>> + * @str: Pointer to the given string
>> + *
>> + * The function gets string and returns the correspondig enum usb_dr_mo=
de.
>> + */
>
>why duplicate the documentation? Perhaps put it only in the header,
>otherwise we will need to update two locations whenever these functions
>change.

Ok, I've removed it from drviers/usb/common/common.c.

>
>> +extern enum usb_dr_mode usb_get_dr_mode_from_string(const char *str);
>> +
>> +/**
>> + * usb_dr_mode_to_string - Convert dual role mode to string.
>> + * @dr_mode: Pointer to the given dual role mode
>> + *
>> + * The function gets enum usb_dr_mode, and returns the correspondig str=
ing.
>> + */
>> +extern const char *usb_dr_mode_to_string(const enum usb_dr_mode dr_mode=
);
>
>Don't you need a stub for builds when CONFIG_USB_COMMON=3Dn?
>
We don't need it. It will be enabled when USB_GADGET or USB is enabled.
It should cover all cases. =20

menuconfig USB_GADGET
	tristate "USB Gadget Support"
	select USB_COMMON

config USB
	tristate "Support for Host-side USB"
	depends on USB_ARCH_HAS_HCD
	select USB_COMMON

Pawel

>--
>balbi
