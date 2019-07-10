From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 10 Jul 2019 08:25:08 +0000
Message-ID: <BYAPR07MB47090E2221C96D0B8178235CDDF00@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <87r274lmqk.fsf@linux.intel.com>
 <BYAPR07MB4709EF3753AC0B87606B1182DDF70@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709EF3753AC0B87606B1182DDF70@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Felipe

>>> +
>>> +static int cdns3_idle_init(struct cdns3 *cdns)
>>> +{
>>> +	struct cdns3_role_driver *rdrv;
>>> +
>>> +	rdrv =3D devm_kzalloc(cdns->dev, sizeof(*rdrv), GFP_KERNEL);
>>> +	if (!rdrv)
>>> +		return -ENOMEM;
>>> +
>>> +	rdrv->start =3D cdns3_idle_role_start;
>>> +	rdrv->stop =3D cdns3_idle_role_stop;
>>> +	rdrv->state =3D CDNS3_ROLE_STATE_INACTIVE;
>>> +	rdrv->suspend =3D NULL;
>>> +	rdrv->resume =3D NULL;
>>> +	rdrv->name =3D "idle";
>>
>>why don't you use the mux framework for this? This looks a bit fishy
>>too. Why do you have your own driver registration structure for your
>>driver only?
>>
>
>I assume you mean interface defined in include/linux/usb/role.h.
>It's quite new framework and probably was added after I've start implement=
ing cdns3 driver.
>At first glance it's look that I could use it.

I've started integrating driver with role switch framework. =20

Even if I use role switch interface , I still need this internal driver reg=
istration.=20
It's convenient to use fallowing structure.=20

struct cdns3_role_driver {
	int (*start)(struct cdns3 *cdns);
	void (*stop)(struct cdns3 *cdns);
	int (*suspend)(struct cdns3 *cdns, bool do_wakeup);
	int (*resume)(struct cdns3 *cdns, bool hibernated);
	const char *name;
#define CDNS3_ROLE_STATE_INACTIVE	0
#define CDNS3_ROLE_STATE_ACTIVE		1
	int state;
};

Driver can supports: only Host, only Device or DRD - depending on configura=
tion.

If current configuration support only Host then driver assigns:
	rdrv_host->start	=3D __cdns3_host_init;
	rdrv_host->stop	=3D cdns3_host_exit;

	cdns->roles[CDNS3_ROLE_HOST]  =3D 	rdrv_host
	cdns->roles[CDNS3_ROLE_GADGET	=3D NULL;
if support only Device then:
	rdrv_dev->start	=3D __cdns3_ gadget _init;
	rdrv_dev->stop	=3D cdns3_ gadget _exit;
	cdns->roles[CDNS3_ROLE_HOST]	=3D NULL;
for DRD:
	cdns->roles[CDNS3_ROLE_HOST =3D rdrv_host;
	cdns->roles[CDNS3_ROLE_GADGET] =3D rdrv_dev;

So for DRD we will have both filled, but for only Device or Host we=20
will have filled single element of array.=20

With such array we can easily start/stop role by=20
	if (!cdns->roles[role])
		not supported by configuration.
	else
		cdns->roles[role]->start / cdns->roles[role]->stop

I don't need any extra: switch instruction or #ifdef statement.=20

The name cdns3_role_driver can be misleading.=20
Driver doesn't register the driver but rather the interface to Device/Host.=
=20

Maybe I should change this name to  cdns3_role_interface or cdns3_role_acti=
on ?

Now I have my private enum:
enum cdns3_roles {
	CDNS3_ROLE_IDLE =3D 0,
	CDNS3_ROLE_HOST,
	CDNS3_ROLE_GADGET,
	CDNS3_ROLE_END,
};

I think I could replace it with usb_role. I need one extra state for IDLE b=
ut
Instead of CDNS3_ROLE_IDLE I can use USB_ROLE_NONE.

It should little simplify the driver and improve readability.=20

Do you have any comments or suggestion ?

Cheers,=20
Pawel

>
>>> +
>>> +	cdns->roles[CDNS3_ROLE_IDLE] =3D rdrv;
>>> +
>>> +	return 0;
>>> +}
>>> +
