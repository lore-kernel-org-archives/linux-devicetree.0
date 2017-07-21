Return-Path: <SRS0=Kezz=6Y=mmayer.net=mmayer@kernel.org>
MIME-Version: 1.0
Sender: mmayer@mmayer.net
In-Reply-To: <1b44dcc1381fda8ab3f29c97718e9999@milecki.pl>
References: <20170721192735.6546-1-code@mmayer.net> <20170721192735.6546-3-code@mmayer.net>
 <1b44dcc1381fda8ab3f29c97718e9999@milecki.pl>
From: Markus Mayer <code@mmayer.net>
Date: Fri, 21 Jul 2017 13:12:53 -0700
Message-ID: <CANEuBv5A_9UDm0j9R3b0ydAKT=Y6uDxiyLQKaJ+iozcPLTbffA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] thermal: add brcmstb AVS TMON driver
Content-Type: multipart/alternative; boundary="001a11426c1c88ae560554d97d67"
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Markus Mayer <code@mmayer.net>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Berger <opendmb@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Power Management List <linux-pm@vger.kernel.org>, Device Tree List <devicetree@vger.kernel.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Markus Mayer <mmayer@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

--001a11426c1c88ae560554d97d67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 21 July 2017 at 13:04, Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> wrote:

> I'm far from being thermal expert, to me it looks OK, only 1 trivial issu=
e
> noticed (see below).
>
> On 2017-07-21 21:27, Markus Mayer wrote:
>
>> +static void avs_tmon_trip_enable(struct brcmstb_thermal_priv *priv,
>> +                                enum avs_tmon_trip_type type, int en)
>> +{
>> +       struct avs_tmon_trip *trip =3D &avs_tmon_trips[type];
>> +       u32 val =3D __raw_readl(priv->tmon_base + trip->enable_offs);
>> +
>> +       pr_debug("%sable trip, type %d\n", en ? "en" : "dis", type);
>>
>
> This probably could be dev_dbg?
>

Indeed. I made the change in my local copy for all three instances. I'll
wait for more feedback before re-sending.

+static void avs_tmon_set_trip_temp(struct brcmstb_thermal_priv *priv,
>> +                                  enum avs_tmon_trip_type type,
>> +                                  int temp)
>> +{
>> +       struct avs_tmon_trip *trip =3D &avs_tmon_trips[type];
>> +       u32 val, orig;
>> +
>> +       pr_debug("set temp %d to %d\n", type, temp);
>>
>
> Same here.
>
>
> +static int brcmstb_set_trips(void *data, int low, int high)
>> +{
>> +       struct brcmstb_thermal_priv *priv =3D data;
>> +
>> +       pr_debug("set trips %d <--> %d\n", low, high);
>>
>
> And the last time here.
>

--001a11426c1c88ae560554d97d67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
1 July 2017 at 13:04, Rafa=C5=82 Mi=C5=82ecki <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rafal@milecki.pl" target=3D"_blank">rafal@milecki.pl</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">I&#39;m far from being thermal=
 expert, to me it looks OK, only 1 trivial issue<br>
noticed (see below).<br>
<br>
On 2017-07-21 21:27, Markus Mayer wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+static void avs_tmon_trip_enable(struct brcmstb_thermal_priv *priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum avs_tmon_trip_type type, int en=
)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct avs_tmon_trip *trip =3D &amp;avs_tmon_tr=
ips[type];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D __raw_readl(priv-&gt;tmon_base + tr=
ip-&gt;enable_offs);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%sable trip, type %d\n&quot;, en=
 ? &quot;en&quot; : &quot;dis&quot;, type);<br>
</blockquote>
<br>
This probably could be dev_dbg?<br></blockquote><div>=C2=A0<br></div><div>I=
ndeed. I made the change in my local copy for all three instances. I&#39;ll=
 wait for more feedback before re-sending.<br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+static void avs_tmon_set_trip_temp(struct brcmstb_thermal_priv *priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum avs_tmon_trip_type type,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int temp)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct avs_tmon_trip *trip =3D &amp;avs_tmon_tr=
ips[type];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val, orig;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;set temp %d to %d\n&quot;, type,=
 temp);<br>
</blockquote>
<br>
Same here.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+static int brcmstb_set_trips(void *data, int low, int high)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct brcmstb_thermal_priv *priv =3D data;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;set trips %d &lt;--&gt; %d\n&quo=
t;, low, high);<br>
</blockquote>
<br>
And the last time here.<br>
</blockquote></div><br></div></div>

--001a11426c1c88ae560554d97d67--
