Return-Path: <SRS0=GFjx=NK=gmail.com=alcooperx@kernel.org>
MIME-Version: 1.0
From: Alan Cooper <alcooperx@gmail.com>
Date: Tue, 30 Oct 2018 14:20:05 -0400
Message-ID: <CAOGqxeVfZaJWCVvjNq6_N_eQBvW-8z7NaOmRcQb6hE_c416v6A@mail.gmail.com>
Subject: [PATCH V2 4/6] usb: ohci-platform: Add support for Broadcom STB SoC's
Content-Type: multipart/alternative; boundary="00000000000032a48e0579763e99"
To: Arnd Bergmann <arnd@arndb.de>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, gregkh <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <devicetree@vger.kernel.org>

--00000000000032a48e0579763e99
Content-Type: text/plain; charset="UTF-8"

> On 10/24/18 3:11 AM, Arnd Bergmann wrote:
>
> On Wed, Oct 17, 2018 at 11:30 PM Al Cooper <alcooperx@gmail.com> wrote:
>
> Add support for Broadcom STB SoC's to the ohci platform driver.
>
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  drivers/usb/host/ohci-platform.c | 35 +++++++++++++++++++++++++++++------
>  include/linux/usb/ohci_pdriver.h |  1 +
>  2 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/host/ohci-platform.c
b/drivers/usb/host/ohci-platform.c
> index 65a1c3fdc88c..363d6fa676a5 100644
> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
> @@ -22,6 +22,7 @@
>  #include <linux/module.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> @@ -99,12 +100,24 @@ static int ohci_platform_probe(struct
platform_device *dev)
>         if (usb_disabled())
>                 return -ENODEV;
>
> -       /*
> -        * Use reasonable defaults so platforms don't have to provide
these
> -        * with DT probing on ARM.
> -        */
> -       if (!pdata)
> -               pdata = &ohci_platform_defaults;
> +       if (!pdata) {
> +               const struct usb_ohci_pdata *match_pdata;
> +
> +               match_pdata = of_device_get_match_data(&dev->dev);
> +               if (match_pdata) {
> +                       pdata = devm_kzalloc(&dev->dev, sizeof(*pdata),
> +                                            GFP_KERNEL);
> +                       if (!pdata)
> +                               return -ENOMEM;
> +                       *pdata = *match_pdata;
>
> It looks like you copy the const pdata to get a non-const version.
> Have you tried
> propagating the 'const' modifier so that users can rely on that here?

The problem is that the const pdata from of_device_get_match() needs to be
saved in device->platform_data which is not a const pointer (and can't be
changed). How can I propagate the "const" to solve the problem?

>
> +               } else {
> +                       /*
> +                        * Use reasonable defaults so platforms don't have
> +                        * to provide these with DT probing on ARM.
> +                        */
> +                       pdata = &ohci_platform_defaults;
> +               }
> +       }
>
> That would also allow you to unify it with the else path by listing
> the ohci_platform_defaults
> in the id table for all other compatible strings.
>
>        Arnd

--00000000000032a48e0579763e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; On 10/24/18 3:11 AM, Arnd Bergmann w=
rote:<br>&gt;<br>&gt; On Wed, Oct 17, 2018 at 11:30 PM Al Cooper &lt;<a hre=
f=3D"mailto:alcooperx@gmail.com">alcooperx@gmail.com</a>&gt; wrote:<br>&gt;=
<br>&gt; Add support for Broadcom STB SoC&#39;s to the ohci platform driver=
.<br>&gt;<br>&gt; Signed-off-by: Al Cooper &lt;<a href=3D"mailto:alcooperx@=
gmail.com">alcooperx@gmail.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0drivers/us=
b/host/ohci-platform.c | 35 +++++++++++++++++++++++++++++------<br>&gt; =C2=
=A0include/linux/usb/ohci_pdriver.h | =C2=A01 +<br>&gt; =C2=A02 files chang=
ed, 30 insertions(+), 6 deletions(-)<br>&gt;<br>&gt; diff --git a/drivers/u=
sb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c<br>&gt; index 65=
a1c3fdc88c..363d6fa676a5 100644<br>&gt; --- a/drivers/usb/host/ohci-platfor=
m.c<br>&gt; +++ b/drivers/usb/host/ohci-platform.c<br>&gt; @@ -22,6 +22,7 @=
@<br>&gt; =C2=A0#include &lt;linux/module.h&gt;<br>&gt; =C2=A0#include &lt;=
linux/err.h&gt;<br>&gt; =C2=A0#include &lt;linux/of.h&gt;<br>&gt; +#include=
 &lt;linux/of_device.h&gt;<br>&gt; =C2=A0#include &lt;linux/platform_device=
.h&gt;<br>&gt; =C2=A0#include &lt;linux/pm_runtime.h&gt;<br>&gt; =C2=A0#inc=
lude &lt;linux/reset.h&gt;<br>&gt; @@ -99,12 +100,24 @@ static int ohci_pla=
tform_probe(struct platform_device *dev)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (usb_disabled())<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return -ENODEV;<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 /*<br>=
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0* Use reasonable defaults so platforms do=
n&#39;t have to provide these<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0* with D=
T probing on ARM.<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 if (!pdata)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pdata =3D &amp;ohci_platform_defaults;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 if (!pdata) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const struct usb_ohci_pdata *match_pdata;<br>&gt; +<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match_pdata =3D of_device_get_ma=
tch_data(&amp;dev-&gt;dev);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (match_pdata) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D devm_kzalloc(&amp;d=
ev-&gt;dev, sizeof(*pdata),<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!=
pdata)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *pdata =3D *match_pdata;<br>&gt;<br>&gt; It looks like you copy the con=
st pdata to get a non-const version.<br>&gt; Have you tried<br>&gt; propaga=
ting the &#39;const&#39; modifier so that users can rely on that here?<br><=
br>The problem is that the const pdata from of_device_get_match() needs to =
be saved in device-&gt;platform_data which is not a const pointer (and can&=
#39;t be changed). How can I propagate the &quot;const&quot; to solve the p=
roblem?<br>=C2=A0<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Use reasonable def=
aults so platforms don&#39;t have<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to provide these with=
 DT probing on ARM.<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D &amp;ohci_pl=
atform_defaults;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;<br>&gt; That would also allow y=
ou to unify it with the else path by listing<br>&gt; the ohci_platform_defa=
ults<br>&gt; in the id table for all other compatible strings.<br>&gt;<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Arnd</div></div>

--00000000000032a48e0579763e99--
