Return-Path: <SRS0=/ma2=QK=monstr.eu=monstr@kernel.org>
MIME-Version: 1.0
References: <20190204070951.6933-1-nava.manne@xilinx.com> <20190204070951.6933-2-nava.manne@xilinx.com>
 <d949520b-452f-9e66-42ae-263959a8c549@linaro.org>
In-Reply-To: <d949520b-452f-9e66-42ae-263959a8c549@linaro.org>
From: Michal Simek <monstr@monstr.eu>
Date: Sun, 3 Feb 2019 10:14:51 +0100
Message-ID: <CAHTX3dLk=YBEkEc8seMNkwa=nWCPBJErb_zb-XF5MR7GT2XDrw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] firmware: xilinx: Add zynqmp_pm_get_chipid() API
Content-Type: multipart/alternative; boundary="000000000000c8d2fd0580f9cf5f"
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Nava kishore Manne <nava.manne@xilinx.com>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, jollys@xilinx.com, rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000c8d2fd0580f9cf5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ne, 3. =C3=BAno 2019 9:50 odes=C3=ADlatel Srinivas Kandagatla <
srinivas.kandagatla@linaro.org> napsal:

> Hi Kishore,
>
> I need ack for this patch from Michal Simek to take this via nvmem tree.
>
> thanks,
> srini
>

There will be collisions with other patches. If you can review it then I
will take it via arm soc tree.

Thanks,
Michal





> On 04/02/2019 07:09, Nava kishore Manne wrote:
> > This patch adds a new API to provide access to the
> > hardware related data like soc revision, IDCODE... etc.
> >
> > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> > ---
> > Changes for v2:
> >               -None.
> > Changes for v1:
> >                  -None.
> >
> > Changes for RFC-V3:
> >                  -corrected typo error in commit msg.
> >
> > Changes for RFC-v2:
> >                  -New Patch.
> >
> >   drivers/firmware/xilinx/zynqmp.c     | 24 ++++++++++++++++++++++++
> >   include/linux/firmware/xlnx-zynqmp.h |  2 ++
> >   2 files changed, 26 insertions(+)
> >
> > diff --git a/drivers/firmware/xilinx/zynqmp.c
> b/drivers/firmware/xilinx/zynqmp.c
> > index 9a1c72a9280f..af2a209fc2da 100644
> > --- a/drivers/firmware/xilinx/zynqmp.c
> > +++ b/drivers/firmware/xilinx/zynqmp.c
> > @@ -186,6 +186,29 @@ static int zynqmp_pm_get_api_version(u32 *version)
> >       return ret;
> >   }
> >
> > +/**
> > + * zynqmp_pm_get_chipid - Get silicon ID registers
> > + * @idcode:     IDCODE register
> > + * @version:    version register
> > + *
> > + * Return:      Returns the status of the operation and the idcode and
> version
> > + *              registers in @idcode and @version.
> > + */
> > +static int zynqmp_pm_get_chipid(u32 *idcode, u32 *version)
> > +{
> > +     u32 ret_payload[PAYLOAD_ARG_CNT];
> > +     int ret;
> > +
> > +     if (!idcode || !version)
> > +             return -EINVAL;
> > +
> > +     ret =3D zynqmp_pm_invoke_fn(PM_GET_CHIPID, 0, 0, 0, 0, ret_payloa=
d);
> > +     *idcode =3D ret_payload[1];
> > +     *version =3D ret_payload[2];
> > +
> > +     return ret;
> > +}
> > +
> >   /**
> >    * zynqmp_pm_get_trustzone_version() - Get secure trustzone firmware
> version
> >    * @version:        Returned version value
> > @@ -471,6 +494,7 @@ static int zynqmp_pm_ioctl(u32 node_id, u32
> ioctl_id, u32 arg1, u32 arg2,
> >
> >   static const struct zynqmp_eemi_ops eemi_ops =3D {
> >       .get_api_version =3D zynqmp_pm_get_api_version,
> > +     .get_chipid =3D zynqmp_pm_get_chipid,
> >       .query_data =3D zynqmp_pm_query_data,
> >       .clock_enable =3D zynqmp_pm_clock_enable,
> >       .clock_disable =3D zynqmp_pm_clock_disable,
> > diff --git a/include/linux/firmware/xlnx-zynqmp.h
> b/include/linux/firmware/xlnx-zynqmp.h
> > index 3c3c28eff56a..c435f4b35adf 100644
> > --- a/include/linux/firmware/xlnx-zynqmp.h
> > +++ b/include/linux/firmware/xlnx-zynqmp.h
> > @@ -34,6 +34,7 @@
> >
> >   enum pm_api_id {
> >       PM_GET_API_VERSION =3D 1,
> > +     PM_GET_CHIPID =3D 22,
> >       PM_IOCTL =3D 34,
> >       PM_QUERY_DATA,
> >       PM_CLOCK_ENABLE,
> > @@ -91,6 +92,7 @@ struct zynqmp_pm_query_data {
> >
> >   struct zynqmp_eemi_ops {
> >       int (*get_api_version)(u32 *version);
> > +     int (*get_chipid)(u32 *idcode, u32 *version);
> >       int (*query_data)(struct zynqmp_pm_query_data qdata, u32 *out);
> >       int (*clock_enable)(u32 clock_id);
> >       int (*clock_disable)(u32 clock_id);
> >
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--000000000000c8d2fd0580f9cf5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
ne, 3. =C3=BAno 2019 9:50 odes=C3=ADlatel Srinivas Kandagatla &lt;<a href=
=3D"mailto:srinivas.kandagatla@linaro.org">srinivas.kandagatla@linaro.org</=
a>&gt; napsal:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Kishore,<br>
<br>
I need ack for this patch from Michal Simek to take this via nvmem tree.<br=
>
<br>
thanks,<br>
srini<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">There will be collisions with other patches. If you can review it then=
 I will take it via arm soc tree.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,</div><div dir=3D"auto">Michal</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
On 04/02/2019 07:09, Nava kishore Manne wrote:<br>
&gt; This patch adds a new API to provide access to the<br>
&gt; hardware related data like soc revision, IDCODE... etc.<br>
&gt; <br>
&gt; Signed-off-by: Nava kishore Manne &lt;<a href=3D"mailto:nava.manne@xil=
inx.com" target=3D"_blank" rel=3D"noreferrer">nava.manne@xilinx.com</a>&gt;=
<br>
&gt; ---<br>
&gt; Changes for v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-None.<br>
&gt; Changes for v1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -None.<b=
r>
&gt; <br>
&gt; Changes for RFC-V3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -correct=
ed typo error in commit msg.<br>
&gt; <br>
&gt; Changes for RFC-v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -New Pat=
ch.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/firmware/xilinx/zynqmp.c=C2=A0 =C2=A0 =C2=A0| 24 +=
+++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0include/linux/firmware/xlnx-zynqmp.h |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 26 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilin=
x/zynqmp.c<br>
&gt; index 9a1c72a9280f..af2a209fc2da 100644<br>
&gt; --- a/drivers/firmware/xilinx/zynqmp.c<br>
&gt; +++ b/drivers/firmware/xilinx/zynqmp.c<br>
&gt; @@ -186,6 +186,29 @@ static int zynqmp_pm_get_api_version(u32 *version=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * zynqmp_pm_get_chipid - Get silicon ID registers<br>
&gt; + * @idcode:=C2=A0 =C2=A0 =C2=A0IDCODE register<br>
&gt; + * @version:=C2=A0 =C2=A0 version register<br>
&gt; + *<br>
&gt; + * Return:=C2=A0 =C2=A0 =C2=A0 Returns the status of the operation an=
d the idcode and version<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 registers in @idco=
de and @version.<br>
&gt; + */<br>
&gt; +static int zynqmp_pm_get_chipid(u32 *idcode, u32 *version)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ret_payload[PAYLOAD_ARG_CNT];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!idcode || !version)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D zynqmp_pm_invoke_fn(PM_GET_CHIPID, 0, 0, =
0, 0, ret_payload);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*idcode =3D ret_payload[1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*version =3D ret_payload[2];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 * zynqmp_pm_get_trustzone_version() - Get secure trustzon=
e firmware version<br>
&gt;=C2=A0 =C2=A0 * @version:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Returned version v=
alue<br>
&gt; @@ -471,6 +494,7 @@ static int zynqmp_pm_ioctl(u32 node_id, u32 ioctl_=
id, u32 arg1, u32 arg2,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const struct zynqmp_eemi_ops eemi_ops =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_api_version =3D zynqmp_pm_get_api_versi=
on,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_chipid =3D zynqmp_pm_get_chipid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.query_data =3D zynqmp_pm_query_data,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock_enable =3D zynqmp_pm_clock_enable,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock_disable =3D zynqmp_pm_clock_disable,<=
br>
&gt; diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firm=
ware/xlnx-zynqmp.h<br>
&gt; index 3c3c28eff56a..c435f4b35adf 100644<br>
&gt; --- a/include/linux/firmware/xlnx-zynqmp.h<br>
&gt; +++ b/include/linux/firmware/xlnx-zynqmp.h<br>
&gt; @@ -34,6 +34,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0enum pm_api_id {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PM_GET_API_VERSION =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PM_GET_CHIPID =3D 22,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PM_IOCTL =3D 34,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PM_QUERY_DATA,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PM_CLOCK_ENABLE,<br>
&gt; @@ -91,6 +92,7 @@ struct zynqmp_pm_query_data {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0struct zynqmp_eemi_ops {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*get_api_version)(u32 *version);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*get_chipid)(u32 *idcode, u32 *version);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*query_data)(struct zynqmp_pm_query_dat=
a qdata, u32 *out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*clock_enable)(u32 clock_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*clock_disable)(u32 clock_id);<br>
&gt; <br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blank" r=
el=3D"noreferrer">linux-arm-kernel@lists.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://lists.infradead.org/ma=
ilman/listinfo/linux-arm-kernel</a><br>
</blockquote></div></div></div>

--000000000000c8d2fd0580f9cf5f--
