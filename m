Return-Path: <hzpeterchen@gmail.com>
MIME-Version: 1.0
In-Reply-To: <AM4PR04MB213028144706EC69A066EAEE89400@AM4PR04MB2130.eurprd04.prod.outlook.com>
References: <1463133808-10630-1-git-send-email-rogerq@ti.com>
 <1463133808-10630-9-git-send-email-rogerq@ti.com> <574422CA.8080002@ti.com>
 <20160525024427.GA31142@shlinux2> <574598D3.5090405@ti.com> <AM4PR04MB213028144706EC69A066EAEE89400@AM4PR04MB2130.eurprd04.prod.outlook.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Fri, 27 May 2016 16:03:43 +0800
Message-ID: <CAL411-q2Nzo0XApGMBr_12OXHwmzR+vdBkYFegPsog30OwKeYA@mail.gmail.com>
Subject: Re: [PATCH v8 08/14] usb: otg: add OTG/dual-role core
Content-Type: multipart/alternative; boundary=001a114e33a29d16640533ce59e6
To: Jun Li <jun.li@nxp.com>
Cc: Roger Quadros <rogerq@ti.com>, "peter.chen@freescale.com" <peter.chen@freescale.com>, "balbi@kernel.org" <balbi@kernel.org>, "tony@atomide.com" <tony@atomide.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>, "jun.li@freescale.com" <jun.li@freescale.com>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>, "robh@kernel.org" <robh@kernel.org>, "nsekhar@ti.com" <nsekhar@ti.com>, "b-liu@ti.com" <b-liu@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a114e33a29d16640533ce59e6
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2016 at 10:44 PM, Jun Li <jun.li@nxp.com> wrote:

> Hi Roger
>
> > >>
> > >> Here, we should be checking if user needs to disable any OTG
> > >> features. So,
> > >>
> > >>    if (dev->of_node)
> > >>            of_usb_update_otg_caps(dev->of_node, &otg->caps);
> > >>
> > >> Do you agree?
> > >> This means we need to change otg->caps from 'struct usb_otg_caps
> > *caps;'
> > >> to 'struct usb_otg_caps caps;' so that we can modify the local copy
> > >> instead of the one passed by the OTG controller.
> > >
> > > Why can't modify the one from OTG controller directly?
> > >
> >
> > There are 2 things.
> > 1) OTG features supported by hardware. This is the controller's config-
> > >otg_caps
> > 2) OTG features needed by system designer. This can be a subset of (1).
>
> Let's make things simple, we only need this subnet, which can be set
> by controller driver in config->otg_caps before pass (its address)
> to OTG core.
>
> So controller driver should get the capability of HW(+SW) and user config
> by whatever approach, then set its config->otg_caps.
>
> Li Jun
>

We may not use controller's otg capabilities after initialization, so
struct usb_otg_caps
in controller device's structure can standard for board's otg capabilities.

My suggestion is passing controller's cap to usb_otg_register, and update
in it using
of_usb_update_otg_caps, in that case, each controller driver doesn't need
to do it by
each other.

-- 
BR,
Peter Chen

--001a114e33a29d16640533ce59e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 25, 2016 at 10:44 PM, Jun Li <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jun.li@nxp.com" target=3D"_blank">jun.li@nxp.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi Roger<br>
<span class=3D""><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Here, we should be checking if user needs to disable any OTG<=
br>
&gt; &gt;&gt; features. So,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 if (dev-&gt;of_node)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_usb_update_otg_ca=
ps(dev-&gt;of_node, &amp;otg-&gt;caps);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Do you agree?<br>
&gt; &gt;&gt; This means we need to change otg-&gt;caps from &#39;struct us=
b_otg_caps<br>
&gt; *caps;&#39;<br>
&gt; &gt;&gt; to &#39;struct usb_otg_caps caps;&#39; so that we can modify =
the local copy<br>
&gt; &gt;&gt; instead of the one passed by the OTG controller.<br>
&gt; &gt;<br>
&gt; &gt; Why can&#39;t modify the one from OTG controller directly?<br>
&gt; &gt;<br>
&gt;<br>
&gt; There are 2 things.<br>
&gt; 1) OTG features supported by hardware. This is the controller&#39;s co=
nfig-<br>
&gt; &gt;otg_caps<br>
&gt; 2) OTG features needed by system designer. This can be a subset of (1)=
.<br>
<br>
</span>Let&#39;s make things simple, we only need this subnet, which can be=
 set<br>
by controller driver in config-&gt;otg_caps before pass (its address)<br>
to OTG core.<br>
<br>
So controller driver should get the capability of HW(+SW) and user config<b=
r>
by whatever approach, then set its config-&gt;otg_caps.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Li Jun<br>
</font></span></blockquote></div><br>We may not use controller&#39;s otg ca=
pabilities after initialization, so struct usb_otg_caps</div><div class=3D"=
gmail_extra">in controller device&#39;s structure can standard for board&#3=
9;s otg capabilities.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">My suggestion is passing controller&#39;s cap to usb_otg_r=
egister, and update in it using</div><div class=3D"gmail_extra">of_usb_upda=
te_otg_caps, in that case, each controller driver doesn&#39;t need to do it=
 by</div><div class=3D"gmail_extra">each other.</div><div class=3D"gmail_ex=
tra"><div><br></div>-- <br><div class=3D"gmail_signature">BR,<br>Peter Chen=
</div>
</div></div>

--001a114e33a29d16640533ce59e6--
