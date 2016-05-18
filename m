Return-Path: <hzpeterchen@gmail.com>
MIME-Version: 1.0
In-Reply-To: <57398C16.5050805@ti.com>
References: <1463133808-10630-1-git-send-email-rogerq@ti.com>
 <1463133808-10630-9-git-send-email-rogerq@ti.com> <57398C16.5050805@ti.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Wed, 18 May 2016 15:45:51 +0800
Message-ID: <CAL411-qb0dHQrn+AarSApCq6L=toKPRerLKDcx_H+5WDWu_VDg@mail.gmail.com>
Subject: Re: [PATCH v8 08/14] usb: otg: add OTG/dual-role core
Content-Type: multipart/alternative; boundary=001a11c372dc23c1e50533190d24
To: Roger Quadros <rogerq@ti.com>
Cc: Peter Chen <peter.chen@freescale.com>, balbi@kernel.org, tony@atomide.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dan.j.williams@intel.com, mathias.nyman@linux.intel.com, Joao.Pinto@synopsys.com, sergei.shtylyov@cogentembedded.com, jun.li@freescale.com, grygorii.strashko@ti.com, yoshihiro.shimoda.uh@renesas.com, robh@kernel.org, nsekhar@ti.com, b-liu@ti.com, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-omap@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a11c372dc23c1e50533190d24
Content-Type: text/plain; charset=UTF-8

On Mon, May 16, 2016 at 5:00 PM, Roger Quadros <rogerq@ti.com> wrote:

> On 13/05/16 13:03, Roger Quadros wrote:
> > It provides APIs for the following tasks
> >
> > - Registering an OTG/dual-role capable controller
> > - Registering Host and Gadget controllers to OTG core
> > - Providing inputs to and kicking the OTG state machine
> >
> > Provide a dual-role device (DRD) state machine.
> > DRD mode is a reduced functionality OTG mode. In this mode
> > we don't support SRP, HNP and dynamic role-swap.
> >
> > In DRD operation, the controller mode (Host or Peripheral)
> > is decided based on the ID pin status. Once a cable plug (Type-A
> > or Type-B) is attached the controller selects the state
> > and doesn't change till the cable in unplugged and a different
> > cable type is inserted.
> >
> > As we don't need most of the complex OTG states and OTG timers
> > we implement a lean DRD state machine in usb-otg.c.
> > The DRD state machine is only interested in 2 hardware inputs
> > 'id' and 'b_sess_vld'.
> >
> > Signed-off-by: Roger Quadros <rogerq@ti.com>
> > ---
> >  drivers/usb/common/Makefile  |    2 +-
> >  drivers/usb/common/usb-otg.c | 1042
> ++++++++++++++++++++++++++++++++++++++++++
> >  drivers/usb/core/Kconfig     |    4 +-
> >  include/linux/usb/gadget.h   |    2 +
> >  include/linux/usb/hcd.h      |    1 +
> >  include/linux/usb/otg-fsm.h  |    7 +
> >  include/linux/usb/otg.h      |  154 ++++++-
> >  7 files changed, 1206 insertions(+), 6 deletions(-)
> >  create mode 100644 drivers/usb/common/usb-otg.c
>
>
> This patch causes the following build issues when CONFIG_USB_GADGET=m,
> CONFIG_USB=m,
> CONFIG_USB_COMMON=m and CONFIG_USB_OTG=y
>
> ERROR: "usb_otg_register_gadget" [drivers/usb/gadget/udc/udc-core.ko]
> undefined!
> ERROR: "usb_otg_unregister_gadget" [drivers/usb/gadget/udc/udc-core.ko]
> undefined!
> ERROR: "usb_otg_register_hcd" [drivers/usb/core/usbcore.ko] undefined!
> ERROR: "usb_otg_unregister_hcd" [drivers/usb/core/usbcore.ko] undefined!
> ERROR: "otg_statemachine" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
> scripts/Makefile.modpost:91: recipe for target '__modpost' failed
> make[1]: *** [__modpost] Error 1
> Makefile:1141: recipe for target 'modules' failed
> make: *** [modules] Error 2
> make: *** Waiting for unfinished jobs....
>
> drivers/built-in.o: In function `drd_set_state':
> usb-otg.c:(.text+0x2b4242): undefined reference to `usb_otg_state_string'
> drivers/built-in.o: In function `drd_statemachine':
> (.text+0x2b4b4c): undefined reference to `usb_otg_state_string'
> Makefile:937: recipe for target 'vmlinux' failed
>
> I'll fix it up with the following diff.
>
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index dca7856..16a5b55 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -59,5 +59,6 @@ obj-$(CONFIG_USB_RENESAS_USBHS)       += renesas_usbhs/
>  obj-$(CONFIG_USB_GADGET)       += gadget/
>
>  obj-$(CONFIG_USB_COMMON)       += common/
> +obj-$(CONFIG_USB_OTG)          += common/
>
>  obj-$(CONFIG_USBIP_CORE)       += usbip/
> diff --git a/drivers/usb/common/usb-otg.c b/drivers/usb/common/usb-otg.c
> index 77048aa..17e449e 100644
> --- a/drivers/usb/common/usb-otg.c
> +++ b/drivers/usb/common/usb-otg.c
> @@ -56,6 +56,30 @@ static int usb_otg_hcd_is_primary_hcd(struct usb_hcd
> *hcd)
>         return hcd == hcd->primary_hcd;
>  }
>
> +static const char *otg_state_string(enum usb_otg_state state)
> +{
> +       static const char *const names[] = {
> +               [OTG_STATE_A_IDLE] = "a_idle",
> +               [OTG_STATE_A_WAIT_VRISE] = "a_wait_vrise",
> +               [OTG_STATE_A_WAIT_BCON] = "a_wait_bcon",
> +               [OTG_STATE_A_HOST] = "a_host",
> +               [OTG_STATE_A_SUSPEND] = "a_suspend",
> +               [OTG_STATE_A_PERIPHERAL] = "a_peripheral",
> +               [OTG_STATE_A_WAIT_VFALL] = "a_wait_vfall",
> +               [OTG_STATE_A_VBUS_ERR] = "a_vbus_err",
> +               [OTG_STATE_B_IDLE] = "b_idle",
> +               [OTG_STATE_B_SRP_INIT] = "b_srp_init",
> +               [OTG_STATE_B_PERIPHERAL] = "b_peripheral",
> +               [OTG_STATE_B_WAIT_ACON] = "b_wait_acon",
> +               [OTG_STATE_B_HOST] = "b_host",
> +       };
> +
> +       if (state < 0 || state >= ARRAY_SIZE(names))
> +               return "UNDEFINED";
> +
> +       return names[state];
> +}
> +
>


>From my point, make another copy for otg stuff is not a good way,
could we make folder under usb/ named otg for dedicated otg stuffs,
in that case, build otg stuffs can not depend on USB_COMMON.

Peter


>  /**
>   * Check if the OTG device is in our wait list and return
>   * otg_wait_data, else NULL.
> @@ -433,7 +457,7 @@ static void drd_set_state(struct otg_fsm *fsm, enum
> usb_otg_state new_state)
>
>         fsm->state_changed = 1;
>         dev_dbg(otg->dev, "otg: set state: %s\n",
> -               usb_otg_state_string(new_state));
> +               otg_state_string(new_state));
>         switch (new_state) {
>         case OTG_STATE_B_IDLE:
>                 drd_set_protocol(fsm, PROTO_UNDEF);
> @@ -449,7 +473,7 @@ static void drd_set_state(struct otg_fsm *fsm, enum
> usb_otg_state new_state)
>                 break;
>         default:
>                 dev_warn(otg->dev, "%s: otg: invalid state: %s\n",
> -                        __func__, usb_otg_state_string(new_state));
> +                        __func__, otg_state_string(new_state));
>                 break;
>         }
>
> @@ -507,7 +531,7 @@ int drd_statemachine(struct usb_otg *otg)
>
>         default:
>                 dev_err(otg->dev, "%s: otg: invalid usb-drd state: %s\n",
> -                       __func__, usb_otg_state_string(state));
> +                       __func__, otg_state_string(state));
>                 break;
>         }
>
> --
> cheers,
> -roger
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
BR,
Peter Chen

--001a11c372dc23c1e50533190d24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 16, 2016 at 5:00 PM, Roger Quadros <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rogerq@ti.com" target=3D"_blank">rogerq@ti.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div clas=
s=3D"h5">On 13/05/16 13:03, Roger Quadros wrote:<br>
&gt; It provides APIs for the following tasks<br>
&gt;<br>
&gt; - Registering an OTG/dual-role capable controller<br>
&gt; - Registering Host and Gadget controllers to OTG core<br>
&gt; - Providing inputs to and kicking the OTG state machine<br>
&gt;<br>
&gt; Provide a dual-role device (DRD) state machine.<br>
&gt; DRD mode is a reduced functionality OTG mode. In this mode<br>
&gt; we don&#39;t support SRP, HNP and dynamic role-swap.<br>
&gt;<br>
&gt; In DRD operation, the controller mode (Host or Peripheral)<br>
&gt; is decided based on the ID pin status. Once a cable plug (Type-A<br>
&gt; or Type-B) is attached the controller selects the state<br>
&gt; and doesn&#39;t change till the cable in unplugged and a different<br>
&gt; cable type is inserted.<br>
&gt;<br>
&gt; As we don&#39;t need most of the complex OTG states and OTG timers<br>
&gt; we implement a lean DRD state machine in usb-otg.c.<br>
&gt; The DRD state machine is only interested in 2 hardware inputs<br>
&gt; &#39;id&#39; and &#39;b_sess_vld&#39;.<br>
&gt;<br>
&gt; Signed-off-by: Roger Quadros &lt;<a href=3D"mailto:rogerq@ti.com">roge=
rq@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/usb/common/Makefile=C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 drivers/usb/common/usb-otg.c | 1042 ++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/usb/core/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<=
br>
&gt;=C2=A0 include/linux/usb/gadget.h=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 include/linux/usb/hcd.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<b=
r>
&gt;=C2=A0 include/linux/usb/otg-fsm.h=C2=A0 |=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 include/linux/usb/otg.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 154 ++++++-<=
br>
&gt;=C2=A0 7 files changed, 1206 insertions(+), 6 deletions(-)<br>
&gt;=C2=A0 create mode 100644 drivers/usb/common/usb-otg.c<br>
<br>
<br>
</div></div>This patch causes the following build issues when CONFIG_USB_GA=
DGET=3Dm, CONFIG_USB=3Dm,<br>
CONFIG_USB_COMMON=3Dm and CONFIG_USB_OTG=3Dy<br>
<br>
ERROR: &quot;usb_otg_register_gadget&quot; [drivers/usb/gadget/udc/udc-core=
.ko] undefined!<br>
ERROR: &quot;usb_otg_unregister_gadget&quot; [drivers/usb/gadget/udc/udc-co=
re.ko] undefined!<br>
ERROR: &quot;usb_otg_register_hcd&quot; [drivers/usb/core/usbcore.ko] undef=
ined!<br>
ERROR: &quot;usb_otg_unregister_hcd&quot; [drivers/usb/core/usbcore.ko] und=
efined!<br>
ERROR: &quot;otg_statemachine&quot; [drivers/usb/chipidea/ci_hdrc.ko] undef=
ined!<br>
scripts/Makefile.modpost:91: recipe for target &#39;__modpost&#39; failed<b=
r>
make[1]: *** [__modpost] Error 1<br>
Makefile:1141: recipe for target &#39;modules&#39; failed<br>
make: *** [modules] Error 2<br>
make: *** Waiting for unfinished jobs....<br>
<br>
drivers/built-in.o: In function `drd_set_state&#39;:<br>
usb-otg.c:(.text+0x2b4242): undefined reference to `usb_otg_state_string&#3=
9;<br>
drivers/built-in.o: In function `drd_statemachine&#39;:<br>
(.text+0x2b4b4c): undefined reference to `usb_otg_state_string&#39;<br>
Makefile:937: recipe for target &#39;vmlinux&#39; failed<br>
<br>
I&#39;ll fix it up with the following diff.<br>
<br>
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile<br>
index dca7856..16a5b55 100644<br>
--- a/drivers/usb/Makefile<br>
+++ b/drivers/usb/Makefile<br>
@@ -59,5 +59,6 @@ obj-$(CONFIG_USB_RENESAS_USBHS)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D renesas_usbhs/<br>
=C2=A0obj-$(CONFIG_USB_GADGET)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D gadget/<br>
<br>
=C2=A0obj-$(CONFIG_USB_COMMON)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D common/<br>
+obj-$(CONFIG_USB_OTG)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D common/<br>
<br>
=C2=A0obj-$(CONFIG_USBIP_CORE)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D usbip/<br>
diff --git a/drivers/usb/common/usb-otg.c b/drivers/usb/common/usb-otg.c<br=
>
index 77048aa..17e449e 100644<br>
--- a/drivers/usb/common/usb-otg.c<br>
+++ b/drivers/usb/common/usb-otg.c<br>
@@ -56,6 +56,30 @@ static int usb_otg_hcd_is_primary_hcd(struct usb_hcd *hc=
d)<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 return hcd =3D=3D hcd-&gt;prim=
ary_hcd;<br>
=C2=A0}<br>
<br>
</span>+static const char *otg_state_string(enum usb_otg_state state)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0static const char *const names[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_IDLE] =
=3D &quot;a_idle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_WAIT_V=
RISE] =3D &quot;a_wait_vrise&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_WAIT_B=
CON] =3D &quot;a_wait_bcon&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_HOST] =
=3D &quot;a_host&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_SUSPEN=
D] =3D &quot;a_suspend&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_PERIPH=
ERAL] =3D &quot;a_peripheral&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_WAIT_V=
FALL] =3D &quot;a_wait_vfall&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_A_VBUS_E=
RR] =3D &quot;a_vbus_err&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_B_IDLE] =
=3D &quot;b_idle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_B_SRP_IN=
IT] =3D &quot;b_srp_init&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_B_PERIPH=
ERAL] =3D &quot;b_peripheral&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_B_WAIT_A=
CON] =3D &quot;b_wait_acon&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[OTG_STATE_B_HOST] =
=3D &quot;b_host&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (state &lt; 0 || state &gt;=3D ARRAY_SIZE(na=
mes))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;UNDEFI=
NED&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return names[state];<br>
+}<br>
+<br></blockquote><div><br></div><div><br></div><div>From my point, make an=
other copy for otg stuff is not a good way,</div><div>could we make folder =
under usb/ named otg for dedicated otg stuffs,</div><div>in that case, buil=
d otg stuffs can not depend on USB_COMMON.</div><div><br></div><div>Peter</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0/**<br>
<span class=3D"">=C2=A0 * Check if the OTG device is in our wait list and r=
eturn<br>
</span>=C2=A0 * otg_wait_data, else NULL.<br>
@@ -433,7 +457,7 @@ static void drd_set_state(struct otg_fsm *fsm, enum usb=
_otg_state new_state)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsm-&gt;state_changed =3D 1;<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_dbg(otg-&gt;dev, &quot;otg=
: set state: %s\n&quot;,<br>
</span>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_otg_stat=
e_string(new_state));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0otg_state_string(ne=
w_state));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (new_state) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case OTG_STATE_B_IDLE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drd_set_protocol(fs=
m, PROTO_UNDEF);<br>
@@ -449,7 +473,7 @@ static void drd_set_state(struct otg_fsm *fsm, enum usb=
_otg_state new_state)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 de=
v_warn(otg-&gt;dev, &quot;%s: otg: invalid state: %s\n&quot;,<br>
</span>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__, usb_otg_state_string(new_state));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __func__, otg_state_string(new_state));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -507,7 +531,7 @@ int drd_statemachine(struct usb_otg *otg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 de=
v_err(otg-&gt;dev, &quot;%s: otg: invalid usb-drd state: %s\n&quot;,<br>
</span>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, usb_otg_state_string(state));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__func__, otg_state_string(state));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
--<br>
cheers,<br>
-roger<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-usb&qu=
ot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/majord=
omo-info.html</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">BR,<br>Peter Chen</div>
</div></div>

--001a11c372dc23c1e50533190d24--
