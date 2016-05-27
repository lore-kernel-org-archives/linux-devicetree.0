Return-Path: <hzpeterchen@gmail.com>
MIME-Version: 1.0
In-Reply-To: <574598D3.5090405@ti.com>
References: <1463133808-10630-1-git-send-email-rogerq@ti.com>
 <1463133808-10630-9-git-send-email-rogerq@ti.com> <574422CA.8080002@ti.com>
 <20160525024427.GA31142@shlinux2> <574598D3.5090405@ti.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Fri, 27 May 2016 16:12:29 +0800
Message-ID: <CAL411-oK+q9HLbd-sY_fzRuD=0RhxiWfjHyNPtOyT6w1yzdLig@mail.gmail.com>
Subject: Re: [PATCH v8 08/14] usb: otg: add OTG/dual-role core
Content-Type: multipart/alternative; boundary=94eb2c041d82ec1d440533ce787c
To: Roger Quadros <rogerq@ti.com>
Cc: Peter Chen <peter.chen@freescale.com>, balbi@kernel.org, tony@atomide.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dan.j.williams@intel.com, mathias.nyman@linux.intel.com, Joao.Pinto@synopsys.com, sergei.shtylyov@cogentembedded.com, jun.li@freescale.com, grygorii.strashko@ti.com, yoshihiro.shimoda.uh@renesas.com, robh@kernel.org, nsekhar@ti.com, b-liu@ti.com, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-omap@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c041d82ec1d440533ce787c
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2016 at 8:21 PM, Roger Quadros <rogerq@ti.com> wrote:

> On 25/05/16 05:44, Peter Chen wrote:
> > On Tue, May 24, 2016 at 12:45:46PM +0300, Roger Quadros wrote:
> >> Hi Peter,
> >>
> >> I have one question here. Please see below.
> >>
> >> On 13/05/16 13:03, Roger Quadros wrote:
> >>> It provides APIs for the following tasks
> >>>
> >>> - Registering an OTG/dual-role capable controller
> >>> - Registering Host and Gadget controllers to OTG core
> >>> - Providing inputs to and kicking the OTG state machine
> >>>
> >>> Provide a dual-role device (DRD) state machine.
> >>> DRD mode is a reduced functionality OTG mode. In this mode
> >>> we don't support SRP, HNP and dynamic role-swap.
> >>>
> >>> In DRD operation, the controller mode (Host or Peripheral)
> >>> is decided based on the ID pin status. Once a cable plug (Type-A
> >>> or Type-B) is attached the controller selects the state
> >>> and doesn't change till the cable in unplugged and a different
> >>> cable type is inserted.
> >>>
> >>> As we don't need most of the complex OTG states and OTG timers
> >>> we implement a lean DRD state machine in usb-otg.c.
> >>> The DRD state machine is only interested in 2 hardware inputs
> >>> 'id' and 'b_sess_vld'.
> >>>
> >>> Signed-off-by: Roger Quadros <rogerq@ti.com>
> >>> ---
> >>>  drivers/usb/common/Makefile  |    2 +-
> >>>  drivers/usb/common/usb-otg.c | 1042
> ++++++++++++++++++++++++++++++++++++++++++
> >>>  drivers/usb/core/Kconfig     |    4 +-
> >>>  include/linux/usb/gadget.h   |    2 +
> >>>  include/linux/usb/hcd.h      |    1 +
> >>>  include/linux/usb/otg-fsm.h  |    7 +
> >>>  include/linux/usb/otg.h      |  154 ++++++-
> >>>  7 files changed, 1206 insertions(+), 6 deletions(-)
> >>>  create mode 100644 drivers/usb/common/usb-otg.c
> >>>
> >>
> >> <snip>
> >>
> >>> +
> >>> +/**
> >>> + * usb_otg_register() - Register the OTG/dual-role device to OTG core
> >>> + * @dev: OTG/dual-role controller device.
> >>> + * @config: OTG configuration.
> >>> + *
> >>> + * Registers the OTG/dual-role controller device with the USB OTG
> core.
> >>> + *
> >>> + * Return: struct usb_otg * if success, ERR_PTR() if error.
> >>> + */
> >>> +struct usb_otg *usb_otg_register(struct device *dev,
> >>> +                            struct usb_otg_config *config)
> >>> +{
> >>> +   struct usb_otg *otg;
> >>> +   struct otg_wait_data *wait;
> >>> +   int ret = 0;
> >>> +
> >>> +   if (!dev || !config || !config->fsm_ops)
> >>> +           return ERR_PTR(-EINVAL);
> >>> +
> >>> +   /* already in list? */
> >>> +   mutex_lock(&otg_list_mutex);
> >>> +   if (usb_otg_get_data(dev)) {
> >>> +           dev_err(dev, "otg: %s: device already in otg list\n",
> >>> +                   __func__);
> >>> +           ret = -EINVAL;
> >>> +           goto unlock;
> >>> +   }
> >>> +
> >>> +   /* allocate and add to list */
> >>> +   otg = kzalloc(sizeof(*otg), GFP_KERNEL);
> >>> +   if (!otg) {
> >>> +           ret = -ENOMEM;
> >>> +           goto unlock;
> >>> +   }
> >>> +
> >>> +   otg->dev = dev;
> >>> +   otg->caps = config->otg_caps;
> >>
> >> Here, we should be checking if user needs to disable any OTG features.
> So,
> >>
> >>      if (dev->of_node)
> >>              of_usb_update_otg_caps(dev->of_node, &otg->caps);
> >>
> >> Do you agree?
> >> This means we need to change otg->caps from 'struct usb_otg_caps *caps;'
> >> to 'struct usb_otg_caps caps;' so that we can modify the local copy
> instead
> >> of the one passed by the OTG controller.
> >
> > Why can't modify the one from OTG controller directly?
> >
>
>
>
> udc_bind_to_driver gets called only when both, udc driver and function
> driver
> are available. Defer probing will have to be done in
> usb_add_gadget_udc_release().
>
>
Yes, you are right.


> >
> > I am wonder if we can implement defer probe for gadget/udc/host driver
> > if otg driver is not probed, in that case, some designs can be simpler
> > like wait list in otg driver.
>
> Agree with you on that. Should I work on implementing -EPROBE_DEFER for
> hcd.c and udc-core.c if hcd/udc is meant for otg and OTG controller is not
> yet probed?
>
>
No,  you only need to return  -EPROBE_DEFER if otg is not register when hcd
or
udc tries to register itself to otg framework. Each host or udc driver's
probe will
get this error, and re-probe after the driver which register otg has probed
successfully.

-- 
BR,
Peter Chen

--94eb2c041d82ec1d440533ce787c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 25, 2016 at 8:21 PM, Roger Quadros <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rogerq@ti.com" target=3D"_blank">rogerq@ti.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div class=3D""><div class=3D"h5">On 25/05/16=
 05:44, Peter Chen wrote:<br>
&gt; On Tue, May 24, 2016 at 12:45:46PM +0300, Roger Quadros wrote:<br>
&gt;&gt; Hi Peter,<br>
&gt;&gt;<br>
&gt;&gt; I have one question here. Please see below.<br>
&gt;&gt;<br>
&gt;&gt; On 13/05/16 13:03, Roger Quadros wrote:<br>
&gt;&gt;&gt; It provides APIs for the following tasks<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Registering an OTG/dual-role capable controller<br>
&gt;&gt;&gt; - Registering Host and Gadget controllers to OTG core<br>
&gt;&gt;&gt; - Providing inputs to and kicking the OTG state machine<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Provide a dual-role device (DRD) state machine.<br>
&gt;&gt;&gt; DRD mode is a reduced functionality OTG mode. In this mode<br>
&gt;&gt;&gt; we don&#39;t support SRP, HNP and dynamic role-swap.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In DRD operation, the controller mode (Host or Peripheral)<br>
&gt;&gt;&gt; is decided based on the ID pin status. Once a cable plug (Type=
-A<br>
&gt;&gt;&gt; or Type-B) is attached the controller selects the state<br>
&gt;&gt;&gt; and doesn&#39;t change till the cable in unplugged and a diffe=
rent<br>
&gt;&gt;&gt; cable type is inserted.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As we don&#39;t need most of the complex OTG states and OTG ti=
mers<br>
&gt;&gt;&gt; we implement a lean DRD state machine in usb-otg.c.<br>
&gt;&gt;&gt; The DRD state machine is only interested in 2 hardware inputs<=
br>
&gt;&gt;&gt; &#39;id&#39; and &#39;b_sess_vld&#39;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Roger Quadros &lt;<a href=3D"mailto:rogerq@ti.c=
om">rogerq@ti.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 drivers/usb/common/Makefile=C2=A0 |=C2=A0 =C2=A0 2 +-<br=
>
&gt;&gt;&gt;=C2=A0 drivers/usb/common/usb-otg.c | 1042 ++++++++++++++++++++=
++++++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 drivers/usb/core/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 4 +-<br>
&gt;&gt;&gt;=C2=A0 include/linux/usb/gadget.h=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 =
+<br>
&gt;&gt;&gt;=C2=A0 include/linux/usb/hcd.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
&gt;&gt;&gt;=C2=A0 include/linux/usb/otg-fsm.h=C2=A0 |=C2=A0 =C2=A0 7 +<br>
&gt;&gt;&gt;=C2=A0 include/linux/usb/otg.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 154 =
++++++-<br>
&gt;&gt;&gt;=C2=A0 7 files changed, 1206 insertions(+), 6 deletions(-)<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 drivers/usb/common/usb-otg.c<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &lt;snip&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +/**<br>
&gt;&gt;&gt; + * usb_otg_register() - Register the OTG/dual-role device to =
OTG core<br>
&gt;&gt;&gt; + * @dev: OTG/dual-role controller device.<br>
&gt;&gt;&gt; + * @config: OTG configuration.<br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * Registers the OTG/dual-role controller device with the USB=
 OTG core.<br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * Return: struct usb_otg * if success, ERR_PTR() if error.<b=
r>
&gt;&gt;&gt; + */<br>
&gt;&gt;&gt; +struct usb_otg *usb_otg_register(struct device *dev,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct usb_otg_config *config)<br>
&gt;&gt;&gt; +{<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0struct usb_otg *otg;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0struct otg_wait_data *wait;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0int ret =3D 0;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0if (!dev || !config || !config-&gt;fsm_ops)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINV=
AL);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0/* already in list? */<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0mutex_lock(&amp;otg_list_mutex);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0if (usb_otg_get_data(dev)) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;o=
tg: %s: device already in otg list\n&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__func__);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unlock;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0/* allocate and add to list */<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0otg =3D kzalloc(sizeof(*otg), GFP_KERNEL);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0if (!otg) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unlock;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0otg-&gt;dev =3D dev;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0otg-&gt;caps =3D config-&gt;otg_caps;<br>
&gt;&gt;<br>
&gt;&gt; Here, we should be checking if user needs to disable any OTG featu=
res. So,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (dev-&gt;of_node)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_usb_update_otg_=
caps(dev-&gt;of_node, &amp;otg-&gt;caps);<br>
&gt;&gt;<br>
&gt;&gt; Do you agree?<br>
&gt;&gt; This means we need to change otg-&gt;caps from &#39;struct usb_otg=
_caps *caps;&#39;<br>
&gt;&gt; to &#39;struct usb_otg_caps caps;&#39; so that we can modify the l=
ocal copy instead<br>
&gt;&gt; of the one passed by the OTG controller.<br>
&gt;<br>
&gt; Why can&#39;t modify the one from OTG controller directly?<br>
&gt;<br>
<br>
</div></div><span class=3D""><br></span><span class=3D"">=C2=A0<br>
</span>udc_bind_to_driver gets called only when both, udc driver and functi=
on driver<br>
are available. Defer probing will have to be done in usb_add_gadget_udc_rel=
ease().<br>
<span class=3D""><br></span></blockquote><div><br></div><div>Yes, you are r=
ight.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-l=
eft-color:rgb(204,204,204);padding-left:1ex"><span class=3D"">
&gt;<br>
&gt; I am wonder if we can implement defer probe for gadget/udc/host driver=
<br>
&gt; if otg driver is not probed, in that case, some designs can be simpler=
<br>
&gt; like wait list in otg driver.<br>
<br>
</span>Agree with you on that. Should I work on implementing -EPROBE_DEFER =
for<br>
hcd.c and udc-core.c if hcd/udc is meant for otg and OTG controller is not<=
br>
yet probed?<br><br></blockquote><div><br></div><div>No, =C2=A0you only need=
 to return =C2=A0-EPROBE_DEFER if otg is not register when hcd or</div><div=
>udc tries to register itself to otg framework. Each host or udc driver&#39=
;s probe will</div><div>get this error, and re-probe after the driver which=
 register otg has probed successfully.</div></div><div><br></div>-- <br><di=
v class=3D"gmail_signature">BR,<br>Peter Chen</div>
</div></div>

--94eb2c041d82ec1d440533ce787c--
