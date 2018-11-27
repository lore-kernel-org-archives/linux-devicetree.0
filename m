From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 05/15] usb:cdns3: Added DRD support
Date: Tue, 27 Nov 2018 11:29:45 +0000
Message-ID: <BYAPR07MB470901107F1435424D8B0727DDD00@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-6-git-send-email-pawell@cadence.com>
 <5BF8140C.7000605@ti.com>
 <BYAPR07MB470991EB0AE200B6481AEE35DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB470991EB0AE200B6481AEE35DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Roger

>>> Patch adds supports for detecting Host/Device mode.
>>> +
>>> +static int cdns3_otg_get_id(struct cdns3 *cdns)
>>> +{
>>> +	int id;
>>> +
>>> +	id =3D readl(&cdns->otg_regs->sts) & OTGSTS_ID_VALUE;
>>> +	dev_dbg(cdns->dev, "OTG ID: %d", id);
>>> +	return id;
>>> +}
>>> +
>>> +int cdns3_is_host(struct cdns3 *cdns)
>>> +{
>>> +	if (cdns->current_dr_mode =3D=3D USB_DR_MODE_HOST)
>>> +		return 1;
>>
>>Why do you need this?
>
>I assumed that some SoC could have cut DRD /OTG and Device or Host part.
>In such case the driver cannot be based on ID pin.
>For only HOST it's not a problem because
>the standard XHCI driver will be used.  Probably I will remove this fragme=
nt.

I've removed this condition but it is necessary and I've  restored it again=
.=20
When driver works in only HOST mode then ID is always 0.=20
For current_dr_mode =3D=3D USB_DR_MODE_HOST driver has to just simple=20
returns 1. =20
current_dr_mode  can be changed from user space depending on dr_mode field.=
=20

I have the additional question. Because I have many changes in source code =
if I should=20
post the next RFC PATCH v3 or should I wait for comments for rest patches ?

>>
>>> +	else if (cdns->current_dr_mode =3D=3D USB_DR_MODE_OTG)
>>> +		if (!cdns3_otg_get_id(cdns))
>>> +			return 1;
>>> +
>>> +	return 0;
>>> +}
>>> +
Thanks,
Cheers,
Pawel
