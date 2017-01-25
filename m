Return-Path: <SRS0=HuG7=ZH=us.ibm.com=eajames@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b47e5359-5587-cc89-43e2-379eb9e95fc8@roeck-us.net>
Subject: Re: [PATCH linux v3 3/6] hwmon: occ: Add I2C transport implementation for
 SCOM operations
From: "Edward James" <eajames@us.ibm.com>
Date: Wed, 25 Jan 2017 17:51:09 -0600
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-4-git-send-email-eajames.ibm@gmail.com>
 <b47e5359-5587-cc89-43e2-379eb9e95fc8@roeck-us.net>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A20DF1211718f9e8a93df938690918c8FBB0A20DF121171"
Content-Disposition: inline
Message-Id: <OFBB2BBBFB.F941B8D4-ON002580B3.008197E1-862580B3.008306EF@notes.na.collabserv.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net, devicetree@vger.kernel.org, eajames.ibm@gmail.com, jdelvare@suse.com, joel@jms.id.au, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
List-ID: <devicetree@vger.kernel.org>


--0__=8FBB0A20DF1211718f9e8a93df938690918c8FBB0A20DF121171
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Guenter Roeck <linux@roeck-us.net> wrote on 01/21/2017 12:11:21 PM:
> On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
> >
> > Add functions to send SCOM operations over I2C bus. The BMC can
> > communicate with the Power8 host processor over I2C, but needs to use
SCOM
> > operations in order to access the OCC register space.
> >
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/hwmon/occ/occ=5Fscom=5Fi2c.c | 72 +++++++++++++++++++++++++++
> +++++++++++++
> >  drivers/hwmon/occ/occ=5Fscom=5Fi2c.h | 26 +++++++++++++++
> >  2 files changed, 98 insertions(+)
> >  create mode 100644 drivers/hwmon/occ/occ=5Fscom=5Fi2c.c
> >  create mode 100644 drivers/hwmon/occ/occ=5Fscom=5Fi2c.h
> >
> > diff --git a/drivers/hwmon/occ/occ=5Fscom=5Fi2c.c b/drivers/hwmon/occ/
> occ=5Fscom=5Fi2c.c
> > new file mode 100644
> > index 0000000..8b4ca13
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fscom=5Fi2c.c
> > @@ -0,0 +1,72 @@
> > +/*
> > + * occ=5Fscom=5Fi2c.c - hwmon OCC driver
> > + *
> > + * This file contains the functions for performing SCOM
> operations over I2C bus
> > + * to access the OCC.
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or
modify
> > + * it under the terms of the GNU General Public License as published
by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "occ=5Fscom=5Fi2c.h"
> > +#include "scom.h"
> > +
> > +int occ=5Fi2c=5Fgetscom(void *bus, u32 address, u64 *data)
> > +{
> > +   ssize=5Ft rc;
> > +   u64 buf;
> > +   struct i2c=5Fclient *client =3D bus;
> > +
> > +   rc =3D i2c=5Fmaster=5Fsend(client, (const char *)&address, sizeof(u=
32));
> > +   if (rc < 0)
> > +      return rc;
> > +   else if (rc !=3D sizeof(u32))
> > +      return -EIO;
> > +
> > +   rc =3D i2c=5Fmaster=5Frecv(client, (char *)&buf, sizeof(u64));
> > +   if (rc < 0)
> > +      return rc;
> > +   else if (rc !=3D sizeof(u64))
> > +      return -EIO;
> > +
> > +   *data =3D be64=5Fto=5Fcpu(buf);
> > +
> > +   return 0;
> > +}
> > +EXPORT=5FSYMBOL(occ=5Fi2c=5Fgetscom);
> > +
> > +int occ=5Fi2c=5Fputscom(void *bus, u32 address, u32 data0, u32 data1)
> > +{
> > +   u32 buf[3];
> > +   ssize=5Ft rc;
> > +   struct i2c=5Fclient *client =3D bus;
> > +
> > +   buf[0] =3D address;
> > +   buf[1] =3D data1;
> > +   buf[2] =3D data0;
> > +
>
> Receive data is converted from be64 to host byte order, transmit
> data is sent as-is.
> Yet, if I recall correctly, some of the calling code passes in
> constants. Are you sure
> this works on both little and big endian systems ?

Spent a lot of time testing this and trying to make it more endian
agnostic. I didn't have any luck. Most of the data passed to putscom is
just magic number constants initializing and setting up the OCC command.
See all the #defines at the top of occ.c. These have to be hardcoded to
some endianness anyway, so may as well just hardcode them to just work
as-is.

If you flip the byte order of all those constants and then use cpu=5Fto=5Fb=
e,
I still don't think that works on big-endian systems? I couldn't get that
working today.

This code will never run on anything except a bmc, which is an arm core.
If the bmc is changing dramatically enough to change endianness, I suspect
this driver may have other problems.

What do you think Guenter? Can we leave those constants as-is and do the
putscoms raw?

Thanks,
Eddie

>
> > +   rc =3D i2c=5Fmaster=5Fsend(client, (const char *)buf, sizeof(u32) *=
 3);
> > +   if (rc < 0)
> > +      return rc;
> > +   else if (rc !=3D sizeof(u32) * 3)
> > +      return -EIO;
> > +
> > +   return 0;
> > +}
> > +EXPORT=5FSYMBOL(occ=5Fi2c=5Fputscom);
> > +
> > +MODULE=5FAUTHOR("Eddie James <eajames@us.ibm.com>");
> > +MODULE=5FDESCRIPTION("I2C OCC SCOM transport");
> > +MODULE=5FLICENSE("GPL");
> > diff --git a/drivers/hwmon/occ/occ=5Fscom=5Fi2c.h b/drivers/hwmon/occ/
> occ=5Fscom=5Fi2c.h
> > new file mode 100644
> > index 0000000..945739c
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ=5Fscom=5Fi2c.h
> > @@ -0,0 +1,26 @@
> > +/*
> > + * occ=5Fscom=5Fi2c.h - hwmon OCC driver
> > + *
> > + * This file contains function protoypes for peforming SCOM
> operations over I2C
> > + * bus to access the OCC.
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or
modify
> > + * it under the terms of the GNU General Public License as published
by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef =5F=5FOCC=5FSCOM=5FI2C=5FH=5F=5F
> > +#define =5F=5FOCC=5FSCOM=5FI2C=5FH=5F=5F
> > +
> > +int occ=5Fi2c=5Fgetscom(void *bus, u32 address, u64 *data);
> > +int occ=5Fi2c=5Fputscom(void *bus, u32 address, u32 data0, u32 data1);
> > +
> > +#endif /* =5F=5FOCC=5FSCOM=5FI2C=5FH=5F=5F */
> >
>

--0__=8FBB0A20DF1211718f9e8a93df938690918c8FBB0A20DF121171
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Guenter Roeck &lt;linux@roeck-us.net&gt; wrote on 01/21/=
2017 12:11:21 PM:<br>&gt; On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wro=
te:<br>&gt; &gt; From: &quot;Edward A. James&quot; &lt;eajames@us.ibm.com&g=
t;<br>&gt; &gt;<br>&gt; &gt; Add functions to send SCOM operations over I2C=
 bus. The BMC can<br>&gt; &gt; communicate with the Power8 host processor o=
ver I2C, but needs to use SCOM<br>&gt; &gt; operations in order to access t=
he OCC register space.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Edward A. J=
ames &lt;eajames@us.ibm.com&gt;<br>&gt; &gt; Signed-off-by: Andrew Jeffery =
&lt;andrew@aj.id.au&gt;<br>&gt; &gt; ---<br>&gt; &gt; &nbsp;drivers/hwmon/o=
cc/occ=5Fscom=5Fi2c.c | 72 +++++++++++++++++++++++++++<br>&gt; ++++++++++++=
+<br>&gt; &gt; &nbsp;drivers/hwmon/occ/occ=5Fscom=5Fi2c.h | 26 ++++++++++++=
+++<br>&gt; &gt; &nbsp;2 files changed, 98 insertions(+)<br>&gt; &gt; &nbsp=
;create mode 100644 drivers/hwmon/occ/occ=5Fscom=5Fi2c.c<br>&gt; &gt; &nbsp=
;create mode 100644 drivers/hwmon/occ/occ=5Fscom=5Fi2c.h<br>&gt; &gt;<br>&g=
t; &gt; diff --git a/drivers/hwmon/occ/occ=5Fscom=5Fi2c.c b/drivers/hwmon/o=
cc/<br>&gt; occ=5Fscom=5Fi2c.c<br>&gt; &gt; new file mode 100644<br>&gt; &g=
t; index 0000000..8b4ca13<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/dri=
vers/hwmon/occ/occ=5Fscom=5Fi2c.c<br>&gt; &gt; @@ -0,0 +1,72 @@<br>&gt; &gt=
; +/*<br>&gt; &gt; + * occ=5Fscom=5Fi2c.c - hwmon OCC driver<br>&gt; &gt; +=
 *<br>&gt; &gt; + * This file contains the functions for performing SCOM <b=
r>&gt; operations over I2C bus<br>&gt; &gt; + * to access the OCC.<br>&gt; =
&gt; + *<br>&gt; &gt; + * Copyright 2016 IBM Corp.<br>&gt; &gt; + *<br>&gt;=
 &gt; + * This program is free software; you can redistribute it and/or mod=
ify<br>&gt; &gt; + * it under the terms of the GNU General Public License a=
s published by<br>&gt; &gt; + * the Free Software Foundation; either versio=
n 2 of the License, or<br>&gt; &gt; + * (at your option) any later version.=
<br>&gt; &gt; + *<br>&gt; &gt; + * This program is distributed in the hope =
that it will be useful,<br>&gt; &gt; + * but WITHOUT ANY WARRANTY; without =
even the implied warranty of<br>&gt; &gt; + * MERCHANTABILITY or FITNESS FO=
R A PARTICULAR PURPOSE. &nbsp;See the<br>&gt; &gt; + * GNU General Public L=
icense for more details.<br>&gt; &gt; + */<br>&gt; &gt; +<br>&gt; &gt; +#in=
clude &lt;linux/i2c.h&gt;<br>&gt; &gt; +#include &lt;linux/kernel.h&gt;<br>=
&gt; &gt; +#include &lt;linux/module.h&gt;<br>&gt; &gt; +#include &quot;occ=
=5Fscom=5Fi2c.h&quot;<br>&gt; &gt; +#include &quot;scom.h&quot;<br>&gt; &gt=
; +<br>&gt; &gt; +int occ=5Fi2c=5Fgetscom(void *bus, u32 address, u64 *data=
)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; ssize=5Ft rc;<br>&gt; &gt; + &nbsp;=
 u64 buf;<br>&gt; &gt; + &nbsp; struct i2c=5Fclient *client =3D bus;<br>&gt=
; &gt; +<br>&gt; &gt; + &nbsp; rc =3D i2c=5Fmaster=5Fsend(client, (const ch=
ar *)&amp;address, sizeof(u32));<br>&gt; &gt; + &nbsp; if (rc &lt; 0)<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; + &nbsp; else if (rc =
!=3D sizeof(u32))<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EIO;<br>&gt; &=
gt; +<br>&gt; &gt; + &nbsp; rc =3D i2c=5Fmaster=5Frecv(client, (char *)&amp=
;buf, sizeof(u64));<br>&gt; &gt; + &nbsp; if (rc &lt; 0)<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp;return rc;<br>&gt; &gt; + &nbsp; else if (rc !=3D sizeof(u=
64))<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EIO;<br>&gt; &gt; +<br>&gt;=
 &gt; + &nbsp; *data =3D be64=5Fto=5Fcpu(buf);<br>&gt; &gt; +<br>&gt; &gt; =
+ &nbsp; return 0;<br>&gt; &gt; +}<br>&gt; &gt; +EXPORT=5FSYMBOL(occ=5Fi2c=
=5Fgetscom);<br>&gt; &gt; +<br>&gt; &gt; +int occ=5Fi2c=5Fputscom(void *bus=
, u32 address, u32 data0, u32 data1)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; =
u32 buf[3];<br>&gt; &gt; + &nbsp; ssize=5Ft rc;<br>&gt; &gt; + &nbsp; struc=
t i2c=5Fclient *client =3D bus;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; buf[0]=
 =3D address;<br>&gt; &gt; + &nbsp; buf[1] =3D data1;<br>&gt; &gt; + &nbsp;=
 buf[2] =3D data0;<br>&gt; &gt; +<br>&gt; <br>&gt; Receive data is converte=
d from be64 to host byte order, transmit <br>&gt; data is sent as-is.<br>&g=
t; Yet, if I recall correctly, some of the calling code passes in <br>&gt; =
constants. Are you sure<br>&gt; this works on both little and big endian sy=
stems ?</tt><br><br><tt>Spent a lot of time testing this and trying to make=
 it more endian</tt><br><tt>agnostic. I didn't have any luck. Most of the d=
ata passed to putscom is</tt><br><tt>just magic number constants initializi=
ng and setting up the OCC command.</tt><br><tt>See all the #defines at the =
top of occ.c. These have to be hardcoded to</tt><br><tt>some endianness any=
way, so may as well just hardcode them to just work</tt><br><tt>as-is.</tt>=
<br><br><tt>If you flip the byte order of all those constants and then use =
cpu=5Fto=5Fbe,</tt><br><tt>I still don't think that works on big-endian sys=
tems? I couldn't get that</tt><br><tt>working today.</tt><br><br><tt>This c=
ode will never run on anything except a bmc, which is an arm core.</tt><br>=
<tt>If the bmc is changing dramatically enough to change endianness, I susp=
ect</tt><br><tt>this driver may have other problems.</tt><br><br><tt>What d=
o you think Guenter? Can we leave those constants as-is and do the</tt><br>=
<tt>putscoms raw?</tt><br><br><tt>Thanks,</tt><br><tt>Eddie</tt><br><tt><br=
>&gt; <br>&gt; &gt; + &nbsp; rc =3D i2c=5Fmaster=5Fsend(client, (const char=
 *)buf, sizeof(u32) * 3);<br>&gt; &gt; + &nbsp; if (rc &lt; 0)<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; + &nbsp; else if (rc !=3D si=
zeof(u32) * 3)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EIO;<br>&gt; &gt;=
 +<br>&gt; &gt; + &nbsp; return 0;<br>&gt; &gt; +}<br>&gt; &gt; +EXPORT=5FS=
YMBOL(occ=5Fi2c=5Fputscom);<br>&gt; &gt; +<br>&gt; &gt; +MODULE=5FAUTHOR(&q=
uot;Eddie James &lt;eajames@us.ibm.com&gt;&quot;);<br>&gt; &gt; +MODULE=5FD=
ESCRIPTION(&quot;I2C OCC SCOM transport&quot;);<br>&gt; &gt; +MODULE=5FLICE=
NSE(&quot;GPL&quot;);<br>&gt; &gt; diff --git a/drivers/hwmon/occ/occ=5Fsco=
m=5Fi2c.h b/drivers/hwmon/occ/<br>&gt; occ=5Fscom=5Fi2c.h<br>&gt; &gt; new =
file mode 100644<br>&gt; &gt; index 0000000..945739c<br>&gt; &gt; --- /dev/=
null<br>&gt; &gt; +++ b/drivers/hwmon/occ/occ=5Fscom=5Fi2c.h<br>&gt; &gt; @=
@ -0,0 +1,26 @@<br>&gt; &gt; +/*<br>&gt; &gt; + * occ=5Fscom=5Fi2c.h - hwmo=
n OCC driver<br>&gt; &gt; + *<br>&gt; &gt; + * This file contains function =
protoypes for peforming SCOM <br>&gt; operations over I2C<br>&gt; &gt; + * =
bus to access the OCC.<br>&gt; &gt; + *<br>&gt; &gt; + * Copyright 2016 IBM=
 Corp.<br>&gt; &gt; + *<br>&gt; &gt; + * This program is free software; you=
 can redistribute it and/or modify<br>&gt; &gt; + * it under the terms of t=
he GNU General Public License as published by<br>&gt; &gt; + * the Free Sof=
tware Foundation; either version 2 of the License, or<br>&gt; &gt; + * (at =
your option) any later version.<br>&gt; &gt; + *<br>&gt; &gt; + * This prog=
ram is distributed in the hope that it will be useful,<br>&gt; &gt; + * but=
 WITHOUT ANY WARRANTY; without even the implied warranty of<br>&gt; &gt; + =
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. &nbsp;See the<br>&gt=
; &gt; + * GNU General Public License for more details.<br>&gt; &gt; + */<b=
r>&gt; &gt; +<br>&gt; &gt; +#ifndef =5F=5FOCC=5FSCOM=5FI2C=5FH=5F=5F<br>&gt=
; &gt; +#define =5F=5FOCC=5FSCOM=5FI2C=5FH=5F=5F<br>&gt; &gt; +<br>&gt; &gt=
; +int occ=5Fi2c=5Fgetscom(void *bus, u32 address, u64 *data);<br>&gt; &gt;=
 +int occ=5Fi2c=5Fputscom(void *bus, u32 address, u32 data0, u32 data1);<br=
>&gt; &gt; +<br>&gt; &gt; +#endif /* =5F=5FOCC=5FSCOM=5FI2C=5FH=5F=5F */<br=
>&gt; &gt;<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A20DF1211718f9e8a93df938690918c8FBB0A20DF121171--
