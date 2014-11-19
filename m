From: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Wed, 19 Nov 2014 06:15:15 +0000
Message-ID: <75722FEA1977E24EA43DD41D9BEA70D53E8AA669@hbmail01.hb.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi James,

[...]

>>> +=A0=A0=A0 if (offset >=3D efuse_dev->size)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
>>> +
>>> +=A0=A0=A0 data =3D readl(efuse_dev->base + round_down(offset, 4));
>> +=A0=A0=A0 data >>=3D (offset % 4) * 8;
>>> +
>>> +=A0=A0=A0 return data; /* Only return the last byte */

>>  The last byte? You mean the least significant byte?

> Yes, it returns the least significant byte.

Since the return type is u8 the function returns last byte in the resul=
tant data after the right shift operation.
If the user space asks for nth byte (offset =3D n, where  n =3D 0 to 15=
) we will return nth byte from the eFuse shadow RAM.

There are total 128 Bits (16 bytes) of Shadow RAM reserved for eFuse st=
atus.

[...]

Regards,
R.Arul Raj

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
