From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Initial register settings in Device Tree?
Date: Sun, 22 Jun 2014 20:18:50 +0200
Message-ID: <4560059.E2lhedgi9o@wuerfel>
References: <53A71474.7030704@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A71474.7030704-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <notro-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 22 June 2014 19:37:56 Noralf Tr=F8nnes wrote:
>=20
> I see two possibilities:
> * add a special marker value to separate the registers, as I do now
> * add a flag to indicate a register number. So far I've only seen 8 a=
nd=20
> 16-bit register number widths: register 20h could thus be written as=20
> 10000020, 1000020, 100020 or 10020
>=20
> Example (skipped state changes from previous example):
> <100B1 01 2C 2D
>   100B2 01 2C 2D
>   100B3 01 2C 2D 01 2C 2D
>   100B4 07 C0 A2 02 84
>   100C1 C5 C2 0A 00
>   100C3 8A 2A
>   100C4 8A EE
>   100C5 0E
>   10020
>   10036 C0
>   1003A 05
>   100E0 0f 1a 0f 18 2f 28 20 22 1f 1b 23 37 00 07 02 10
>   100E1 0f 1b 0f 17 33 2c 29 2e 30 30 39 3f 00 07 03 10>
>=20
> Is this a viable solution?

We normally use high-level descriptions of the timings that the driver
then converts into register-level settings. See
Documentation/devicetree/bindings/video/display-timing.txt and
other files in that directory for how existing drivers handle this.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
