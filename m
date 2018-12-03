From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 08/15] usb:cdns3: Implements device operations part
 of the API
Date: Mon, 3 Dec 2018 10:19:47 +0000
Message-ID: <BYAPR07MB47098B0E57C9AF98A457D1B5DDAE0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-9-git-send-email-pawell@cadence.com>
 <5BFE8883.7090802@ti.com>
 <BYAPR07MB4709BBB7E78C7A7244270215DDAC0@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709BBB7E78C7A7244270215DDAC0@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>, Felipe Balbi <balbi@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi
>>> +
>>> +static struct usb_ep *cdns3_gadget_match_ep(struct usb_gadget *gadget,
>>> +					    struct usb_endpoint_descriptor *desc,
>>> +					    struct usb_ss_ep_comp_descriptor *comp_desc)
>>> +{
>>> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
>>> +	struct cdns3_endpoint *priv_ep;
>>> +	unsigned long flags;
>>> +
>>> +	priv_ep =3D cdns3_find_available_ss_ep(priv_dev, desc);
>>> +	if (IS_ERR(priv_ep)) {
>>> +		dev_err(&priv_dev->dev, "no available ep\n");
>>> +		return NULL;
>>> +	}
>>> +
>>> +	dev_dbg(&priv_dev->dev, "match endpoint: %s\n", priv_ep->name);
>>> +
>>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>>> +	priv_ep->endpoint.desc =3D desc;
>>> +	priv_ep->dir  =3D usb_endpoint_dir_in(desc) ? USB_DIR_IN : USB_DIR_OU=
T;
>>> +	priv_ep->type =3D usb_endpoint_type(desc);
>>> +
>>> +	list_add_tail(&priv_ep->ep_match_pending_list,
>>> +		      &priv_dev->ep_match_list);
>>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>>> +	return &priv_ep->endpoint;
>>> +}
>>
>>Why do you need a custom match_ep?
>>doesn't usb_ep_autoconfig suffice?
>
>I need to test it but at first glance it  looks like usb_ep_autoconfig suf=
fice.
>
>>
>>You can check if EP is claimed or not by checking the ep->claimed flag.
>>
I checked it and did not work correct. The flag claimed is set in usb_ep_au=
toconf, but=20
a little bit later during USB RESET this flag is cleared.=20
So, I can't base on this flag.  I think that it's incorrect behavior in gad=
get core driver or in function drivers.
Maybe we should have additional flag in usb_ep object used during resetting=
, or usb_ep_autoconf function should be called after each USB RESET.=20

I notice that I can based on ep->address it is set also in usb_ep_autoconf =
and probably is not cleared anywhere.
It's little tricky, but It looks like it works correct. I add some comment =
for this checking.=20
Maybe in feature I will be able to replace it with claimed flag.

Felipe what's your opinion about claimed flag.  It's should be fixed or not=
 ?

Cheers
Pawel
