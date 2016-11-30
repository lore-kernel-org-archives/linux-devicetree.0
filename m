From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Thu, 01 Dec 2016 01:33:30 +0800
Message-ID: <1971681480527210@web5g.yandex.ru>
References: <cover.1480414715.git.moinejf@free.fr>
	<4614815.L3DQhhBy6d@avalon>
	<20161130102757.9eec1f7f3377d0f4787e3829@free.fr>
	<3478036.d2UQM8n6lv@avalon> <20161130114415.2280151e2965280733a629e5@free.fr>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB3E27TAQKGQE5EL62YQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130114415.2280151e2965280733a629e5-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



30.11.2016, 18:44, "Jean-Francois Moine" <moinejf-GANU6spQydw@public.gmane.org>:
> On Wed, 30 Nov 2016 11:52:25 +0200
> Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
>
>> =C2=A0Hi Jean-Fran=C3=A7ois,
>>
>> =C2=A0On Wednesday 30 Nov 2016 10:27:57 Jean-Francois Moine wrote:
>> =C2=A0> On Wed, 30 Nov 2016 10:20:21 +0200 Laurent Pinchart wrote:
>> =C2=A0> >> Well, I don't see what this connector can be.
>> =C2=A0> >> May you give me a DT example?
>> =C2=A0> >
>> =C2=A0> > Sure.
>> =C2=A0> >
>> =C2=A0> > arch/arm/boot/dts/r8a7791-koelsch.dts
>> =C2=A0> >
>> =C2=A0> > /* HDMI encoder */
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[snip]
>> =C2=A0> > /* HDMI connector */
>> =C2=A0> >
>> =C2=A0> > hdmi-out {
>> =C2=A0> > compatible =3D "hdmi-connector";
>> =C2=A0> > type =3D "a";
>> =C2=A0> >
>> =C2=A0> > port {
>> =C2=A0> > hdmi_con: endpoint {
>> =C2=A0> > remote-endpoint =3D <&adv7511_out>;
>> =C2=A0> > };
>> =C2=A0> > };
>> =C2=A0> > };
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[snip]
>> =C2=A0> - what does the software do with the connector type?
>>
>> =C2=A0That's up to the software to decide, the DT bindings should descri=
be the
>> =C2=A0hardware in the most accurate and usable way for the OS as possibl=
e. One of my
>> =C2=A0longer term goals is to add connector drivers to handle DDC and HP=
D when
>> =C2=A0they're not handled by the encoder (they are in the above example)=
.
>>
>> =C2=A0If the DDC was connected to a general-purpose I2C bus of the SoC, =
and the HPD
>> =C2=A0to a GPIO, we would have
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hdmi-out {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "hdmi-connector";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type =3D "a";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* I2C bus and GPIO references are made up fo=
r the example */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ddc-i2c-bus =3D <&i2c4>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hpd-gpios =3D <&gpio4 7 GPIO_ACTIVE_HIGH>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0port {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0hdmi_con: endpoint {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0remote-endpoint =3D <&ad=
v7511_out>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0};
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>>
>> =C2=A0and both HPD and EDID reading should be handled by the connector d=
river.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[snip]
>
> Hi Laurent,
>
> OK. I understand. This connector complexity should be added in all DTs,
> and the same code would be used.
>
> Actually, for component binding, I use drm_of_component_probe():
>
> - from the DRM master, loop on the "ports" phandle array and bind the
> =C2=A0=C2=A0CRTCs,
>
> - for each CRTC, loop on the first remote port level and bind the
> =C2=A0=C2=A0encoders/connectors
>
> Now, this should be:
>
> - from the DRM master, loop on the first remote ports level and bind
> =C2=A0=C2=A0the CRTCs,
>
> - for each CRTC, loop on the second remote port level and bind the
> =C2=A0=C2=A0encoders (and bridges?),
>
> - for each encoder, loop on the third remote port level and bind the
> =C2=A0=C2=A0connectors.
>
> Then, it would be nice to have a generic function for doing this job.
>
> Otherwise, from your description:
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hdmi-out {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "hdmi-connector";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type =3D "a";
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* I2C bus and GPIO references are made up fo=
r the example */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ddc-i2c-bus =3D <&i2c4>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hpd-gpios =3D <&gpio4 7 GPIO_ACTIVE_HIGH>
>
> the "hdmi-connector" is a big piece of software. It must handle a lot
> of more and more exotic connectors.
> So, I hope that you have written a "simple-hdmi-connector" which does
> nothing but setting the connector type.
> Where is it?

I suddenly thought about something...

If a DVI connector instead of a HDMI connector is soldered, how should such=
 a
device tree be written?

How about solder a HDMI-to-VGA bridge on the board? (Maybe there should be
"dumb-hdmi-dvi-bridge" and "dumb-hdmi-vga-bridge" drivers?)

>
> --
> Ken ar c'henta=C3=B1 | ** Breizh ha Linux atav! **
> Jef | http://moinejf.free.fr/
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
