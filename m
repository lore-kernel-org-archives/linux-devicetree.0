Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:50253 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730540AbfFGVNg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Jun 2019 17:13:36 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
Date: Sat, 8 Jun 2019 00:17:54 +0300
MIME-Version: 1.0
In-Reply-To: <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw"
Sender: devicetree-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw
Content-Type: multipart/mixed; boundary="jma27az7xXsVgKEAJG0WTPwlycTek1aX2";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org
Message-ID: <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
In-Reply-To: <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>

--jma27az7xXsVgKEAJG0WTPwlycTek1aX2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Dan,

On 08.06.19 00:04, Dan Murphy wrote:
> Oleh
> But this is not really max_brightness now this is a feature and now
> does not make sense in this context
>>>
>>> You may need to use something different for this property or expose
>>> a file in the driver.
>>>
>>>
>> Protocol for this board define 0x32 as brightness level.
>> This behaviur needed to keep backward compatibity.
>>
>>
> Backwards compatibility to what?
With old/new boards.
>
> This is a new driver there should be no DT that has this compatible or
> definition.
>
> I will let Rob ack or nack this node.
>
> Dan
>



--jma27az7xXsVgKEAJG0WTPwlycTek1aX2--

--8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlz61IYACgkQ0xNJm20p
l4y/iA/8Ck/1WHpVG4Tova/HZpzK87OMD9taPMrVURA2vDwrbyRmc/MCPr3yEqJT
fDEHt4wzZRLb+PErrVyXuimnqjOkLKzCnwi3wDeKmUyhkPKsiJ9QIirYBqA6dYJo
Li5yvxW87hlBAooNKvJ/ZAtBailxBCkp9qMTU6PQyyIdrMUg8cG/rGep/ygMmbFJ
VEnm8GapSLMIhUonI1bhTeBapzCrMSr6z6bXu35kIx+24ZATk2LrHJcjAGV0kxs3
Skf41EIHRTWuAJJVZwfsQybKzslbBbUHiJ7czQADAOh9NzMTP3LCk+6PEFsxBwAi
ZSlb0Qng1HciBLBz0Mc3bZMHHezIq59F84AKeBWmvh2poxsQMXlmdjv63tnUduN/
B5zR9x7kvoyF4RzSQRn/fMnJiRkiY5/qQGKgmywOQbJ9nwTXdW7+OkFxGsy6Ital
JW8wnADHoXGazH10bH7XKCf8kBl0X1iK6wdoc/4uKgVXGwlx3oOCW5uqluQxZ2dS
7KRvqg8foaEdaDT9g5pfCb4zGTMSL5SmYGeHluPW2WvroKfzluAYa/Hx+Woc2GsC
SIdztyQGWDvI22Vmg5e605HYIvq717bpsclyvFh3qzuCKXALumAWEjIyTIPdpq30
mDvc17DUE+mw3WsuhegXilPCDJP22Oc0KAlXkWipG7R+MTBGjDM=
=3+8B
-----END PGP SIGNATURE-----

--8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw--
