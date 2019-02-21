From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: RE: [PATCH v4 6/6] usb:cdns3 Fix for stuck packets in on-chip OUT buffer.
Date: Thu, 21 Feb 2019 09:14:30 +0200
Message-ID: <87va1dbokp.fsf@linux.intel.com>
References: <1550173514-23573-1-git-send-email-pawell@cadence.com> <1550173514-23573-7-git-send-email-pawell@cadence.com> <67da432f-9c95-d644-65b5-dbc5b942d24c@ti.com> <BYAPR07MB47091C199971D677DE0FBB84DD7D0@BYAPR07MB4709.namprd07.prod.outlook.com> <e8616274-b0a8-6e59-b6fa-a68fed58bad7@ti.com> <BYAPR07MB470939C6F100336BAF6C41BFDD7D0@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB470939C6F100336BAF6C41BFDD7D0@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

(please break your emails at 80-columns)

Pawel Laszczak <pawell@cadence.com> writes:
>>> One more thing. Workaround has implemented algorithm that decide for wh=
ich
>>> endpoint it should be enabled.  e.g for composite device MSC+NCM+ACM it
>>> should work only for ACM OUT endpoint.
>>>
>>
>>If ACM driver didn't queue the request for ACM OUT endpoint, why does the
>>controller accept the data at all?
>>
>>I didn't understand why we need a workaround for this. It should be stand=
ard
>>behaviour to NAK data if function driver didn't request for all endpoints.
>
> Yes, I agree with you. Controller shouldn=E2=80=99t accept such packet. A=
s I know this
> behavior will be fixed in RTL.
>
> But I assume that some older version of this controller are one the marke=
t,
> and driver should work correct with them.
>
> In the feature this workaround can be limited only to selected controller=
s.
>
> Even now I assume that it can be enabled/disabled by module parameter.

no module parameters, please. Use revision detection in runtime.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlxuT9YACgkQzL64meEa
mQb0KA/9G9q4320JmbOLoOs7lhzSroaa+cRfzRqvFN84Wt1jcLdbt427Hmei9KQD
hSuWJCN8XfbS0SQouEf+ijLXOloQoj++Po57Vr9hhlciVwbfd//pREYlwv3KqEhc
9B29m84tEBl762fesbu+r6jEhyIEFoj5QvKSQQQ6Sn3mjBwDHuX9rT6XPqYBgR93
uemDLnIKVpt/U56jVtkTofBSEFnlaQXnCMjrB7pZhWLUG0WEPABJ+3oyVBGqzEYQ
Cqw8QTh/jr1EB4qj9ArHOXPRqC0NXFhWLNV3N/BuN0No/yVeVv/WntgXMUo4aOQ6
veeG3/YuvO3UxzrR3ChUkqQXpQK0oynIjOdCSEuZ8EyWjHlPfYParu0y0M86RZCN
uMQLBt53g3gOtoyfEq0U9Xn6fxeIXVB2SPWBJrL/dt+0iLfksS634RxD4xH90jp+
RkktSilOQzwHqhlvF+SWC/ilY4Y4NKheFN3MAz7USTyBDhIKaxkQg9aZmQf5Vr/F
puC3+syTKBrnmF6bPaTzvSQJJ+zYO6Dyhs7EsZDET3+ye08BZB7KDC5h3SsISeY2
vHG6NxaZm37kzY9d6MkOC9JYupyQhLbHD0imgYAEjU7DncNjlR2Fb5N1JNgW9pxV
5qQeZbY4dVJycXG8vrrLEnB6oBM4tJFpCiBN6vyG+//+RQ5jmPM=
=9xvx
-----END PGP SIGNATURE-----
--=-=-=--
