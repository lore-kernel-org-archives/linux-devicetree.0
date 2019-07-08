From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 8 Jul 2019 10:59:39 +0000
Message-ID: <BYAPR07MB4709E5BA041BBDDB70E69F62DDF60@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <87r274lmqk.fsf@linux.intel.com>
 <BYAPR07MB4709EF3753AC0B87606B1182DDF70@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87a7dpm442.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87a7dpm442.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Felipe

Please look at the changes in drivers/usb/common/common.c file.=20
I'm going to add it as next patch to next version.
=20

>Pawel Laszczak <pawell@cadence.com> writes:
>>>> +void cdns3_role_stop(struct cdns3 *cdns)
>
>>>> +static const char *const cdns3_mode[] =3D {
>>>> +	[USB_DR_MODE_UNKNOWN]		=3D "unknown",
>>>> +	[USB_DR_MODE_OTG]		=3D "otg",
>>>> +	[USB_DR_MODE_HOST]		=3D "host",
>>>> +	[USB_DR_MODE_PERIPHERAL]	=3D "device",
>>>> +};
>>>
>>>don't we have a generic version of this under usb/common ?
>>>
>> Yes, there is a similar array, but it is defined also as static
>> and there is no function for converting value to string.
>> There is only function for converting string to value.
>
>right. You can add the missing interface generically instead of
>duplicating the enumeration.
>
>> There is also:
>> [USB_DR_MODE_UNKNOWN]		=3D "",
>> Instead of:
>> [USB_DR_MODE_UNKNOWN]		=3D "unknown",
>>
>> So, for USB_DR_MODE_UNKNOWN user will not see anything information.
>
>But that's what "unknown" means :-) We don't know the information.
>

////// start
commit 607754c60fabc43408f4f2de82d3560c72870787 (HEAD)
Author: Pawel Laszczak <pawell@cadence.com>
Date:   Mon Jul 8 12:53:47 2019 +0200

    usb:common  Added usb_get_dr_mode_from_string and usb_dr_mode_to_string=
.

    Patch introduces new function usb_dr_mode_to_string for converting dual=
 role
    mod to string and removes static from usb_dr_mode_to_string definition.

    Both changes have made to avoid duplication of code by cdns3 driver.

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 18f5dcf58b0d..ab59954deff8 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -118,13 +118,20 @@ static const char *const usb_dr_modes[] =3D {
        [USB_DR_MODE_OTG]               =3D "otg",
 };

-static enum usb_dr_mode usb_get_dr_mode_from_string(const char *str)
+/**
+ * usb_get_dr_mode_from_string - Convert string to dual role mode.
+ * @str: Pointer to the given string
+ *
+ * The function gets string and returns the correspondig enum usb_dr_mode.
+ */
+enum usb_dr_mode usb_get_dr_mode_from_string(const char *str)
 {
        int ret;

        ret =3D match_string(usb_dr_modes, ARRAY_SIZE(usb_dr_modes), str);
        return (ret < 0) ? USB_DR_MODE_UNKNOWN : ret;
 }
+EXPORT_SYMBOL_GPL(usb_get_dr_mode_from_string);

 enum usb_dr_mode usb_get_dr_mode(struct device *dev)
 {
@@ -139,6 +146,21 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_dr_mode);

+/**
+ * usb_dr_mode_to_string - Convert dual role mode to stringi.
+ * @dr_mode: Pointer to the given dual role mode
+ *
+ * The function gets enum usb_dr_mode, and returns the correspondig string=
.
+ */
+const *char usb_dr_mode_to_string(const enum usb_dr_mode dr_mode)
+{
+       if (dr_mode > USB_DR_MODE_UNKNOWN || dr_mode <=3D USB_DR_MODE_PERIP=
HERAL)
+               return usb_dr_modes[dr_mode];
+
+       return usb_dr_modes[USB_DR_MODE_UNKNOWN];
+}
+EXPORT_SYMBOL_GPL(usb_dr_mode_to_string);

///// end

What do you thing about it ?

Pawel
