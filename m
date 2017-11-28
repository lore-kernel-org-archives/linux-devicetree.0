Return-Path: <SRS0=F6Ff=C2=gmail.com=jon.nettleton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <E1eJMdo-0002qf-2D@rmk-PC.armlinux.org.uk>
References: <20171127165134.GH31757@n2100.armlinux.org.uk> <E1eJMdo-0002qf-2D@rmk-PC.armlinux.org.uk>
From: Jon Nettleton <jon.nettleton@gmail.com>
Date: Tue, 28 Nov 2017 05:46:07 +0100
Message-ID: <CALHpu36Kjy4SSn1m8ZOYwEr+9u67dobfNHiOX6s75UFGVm3atw@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: dts: imx6qdl: SolidRun: move microsom includes
 into .dts
Content-Type: multipart/alternative; boundary="94eb2c07188cb9b0e6055f03b311"
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c07188cb9b0e6055f03b311
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 27, 2017 at 5:52 PM, Russell King <rmk+kernel@armlinux.org.uk>
wrote:

> Move the microsom includes into the .dts files so different options can
> be accomodated at the lowest level.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm/boot/dts/imx6dl-cubox-i.dts        | 1 +
>  arch/arm/boot/dts/imx6dl-hummingboard.dts   | 1 +
>  arch/arm/boot/dts/imx6q-cubox-i.dts         | 1 +
>  arch/arm/boot/dts/imx6q-hummingboard.dts    | 1 +
>  arch/arm/boot/dts/imx6qdl-cubox-i.dtsi      | 1 -
>  arch/arm/boot/dts/imx6qdl-hummingboard.dtsi | 1 -
>  6 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx6dl-cubox-i.dts
> b/arch/arm/boot/dts/imx6dl-cubox-i.dts
> index f10a36b8647d..222c269f687a 100644
> --- a/arch/arm/boot/dts/imx6dl-cubox-i.dts
> +++ b/arch/arm/boot/dts/imx6dl-cubox-i.dts
> @@ -41,6 +41,7 @@
>  /dts-v1/;
>
>  #include "imx6dl.dtsi"
> +#include "imx6qdl-microsom.dtsi"
>  #include "imx6qdl-cubox-i.dtsi"
>
>  / {
> diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts
> b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> index 39c2602fa87c..1709810de77e 100644
> --- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
> +++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> @@ -42,6 +42,7 @@
>  /dts-v1/;
>
>  #include "imx6dl.dtsi"
> +#include "imx6qdl-microsom.dtsi"
>  #include "imx6qdl-hummingboard.dtsi"
>
>  / {
> diff --git a/arch/arm/boot/dts/imx6q-cubox-i.dts
> b/arch/arm/boot/dts/imx6q-cubox-i.dts
> index b68aa0e57f20..8f39682c33a9 100644
> --- a/arch/arm/boot/dts/imx6q-cubox-i.dts
> +++ b/arch/arm/boot/dts/imx6q-cubox-i.dts
> @@ -41,6 +41,7 @@
>  /dts-v1/;
>
>  #include "imx6q.dtsi"
> +#include "imx6qdl-microsom.dtsi"
>  #include "imx6qdl-cubox-i.dtsi"
>
>  / {
> diff --git a/arch/arm/boot/dts/imx6q-hummingboard.dts
> b/arch/arm/boot/dts/imx6q-hummingboard.dts
> index 69a7a0a1cb21..6fc692940e6b 100644
> --- a/arch/arm/boot/dts/imx6q-hummingboard.dts
> +++ b/arch/arm/boot/dts/imx6q-hummingboard.dts
> @@ -42,6 +42,7 @@
>  /dts-v1/;
>
>  #include "imx6q.dtsi"
> +#include "imx6qdl-microsom.dtsi"
>  #include "imx6qdl-hummingboard.dtsi"
>
>  / {
> diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
> b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
> index 57ce2dbb6ad9..98ec7ce1f2a3 100644
> --- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
> @@ -38,7 +38,6 @@
>   *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>   *     OTHER DEALINGS IN THE SOFTWARE.
>   */
> -#include "imx6qdl-microsom.dtsi"
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/gpio.h>
>
> diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> index afd981e9b5e3..84e6392fee1f 100644
> --- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> @@ -38,7 +38,6 @@
>   *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>   *     OTHER DEALINGS IN THE SOFTWARE.
>   */
> -#include "imx6qdl-microsom.dtsi"
>
>  / {
>         chosen {
>

Since we are going through and adding the som dtsi include to all the
device-tree files, would it make sense to rename the microsom.dtsi at this
point in time?  Perhaps something like imx6qdl-sr-microsom.dtsi?

-Jon

--94eb2c07188cb9b0e6055f03b311
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 27, 2017 at 5:52 PM, Russell King <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rmk+kernel@armlinux.org.uk" target=3D"_blank">rmk+kernel@arm=
linux.org.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Move the microsom includes into the .dts files so different op=
tions can<br>
be accomodated at the lowest level.<br>
<br>
Signed-off-by: Russell King &lt;<a href=3D"mailto:rmk%2Bkernel@armlinux.org=
.uk">rmk+kernel@armlinux.org.uk</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/imx6dl-<wbr>cubox-i.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 1 +<br>
=C2=A0arch/arm/boot/dts/imx6dl-<wbr>hummingboard.dts=C2=A0 =C2=A0| 1 +<br>
=C2=A0arch/arm/boot/dts/imx6q-cubox-<wbr>i.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 1 +<br>
=C2=A0arch/arm/boot/dts/imx6q-<wbr>hummingboard.dts=C2=A0 =C2=A0 | 1 +<br>
=C2=A0arch/arm/boot/dts/imx6qdl-<wbr>cubox-i.dtsi=C2=A0 =C2=A0 =C2=A0 | 1 -=
<br>
=C2=A0arch/arm/boot/dts/imx6qdl-<wbr>hummingboard.dtsi | 1 -<br>
=C2=A06 files changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/arch/arm/boot/dts/imx6dl-<wbr>cubox-i.dts b/arch/arm/boot/dts/=
imx6dl-<wbr>cubox-i.dts<br>
index f10a36b8647d..222c269f687a 100644<br>
--- a/arch/arm/boot/dts/imx6dl-<wbr>cubox-i.dts<br>
+++ b/arch/arm/boot/dts/imx6dl-<wbr>cubox-i.dts<br>
@@ -41,6 +41,7 @@<br>
=C2=A0/dts-v1/;<br>
<br>
=C2=A0#include &quot;imx6dl.dtsi&quot;<br>
+#include &quot;imx6qdl-microsom.dtsi&quot;<br>
=C2=A0#include &quot;imx6qdl-cubox-i.dtsi&quot;<br>
<br>
=C2=A0/ {<br>
diff --git a/arch/arm/boot/dts/imx6dl-<wbr>hummingboard.dts b/arch/arm/boot=
/dts/imx6dl-<wbr>hummingboard.dts<br>
index 39c2602fa87c..1709810de77e 100644<br>
--- a/arch/arm/boot/dts/imx6dl-<wbr>hummingboard.dts<br>
+++ b/arch/arm/boot/dts/imx6dl-<wbr>hummingboard.dts<br>
@@ -42,6 +42,7 @@<br>
=C2=A0/dts-v1/;<br>
<br>
=C2=A0#include &quot;imx6dl.dtsi&quot;<br>
+#include &quot;imx6qdl-microsom.dtsi&quot;<br>
=C2=A0#include &quot;imx6qdl-hummingboard.dtsi&quot;<br>
<br>
=C2=A0/ {<br>
diff --git a/arch/arm/boot/dts/imx6q-<wbr>cubox-i.dts b/arch/arm/boot/dts/i=
mx6q-<wbr>cubox-i.dts<br>
index b68aa0e57f20..8f39682c33a9 100644<br>
--- a/arch/arm/boot/dts/imx6q-<wbr>cubox-i.dts<br>
+++ b/arch/arm/boot/dts/imx6q-<wbr>cubox-i.dts<br>
@@ -41,6 +41,7 @@<br>
=C2=A0/dts-v1/;<br>
<br>
=C2=A0#include &quot;imx6q.dtsi&quot;<br>
+#include &quot;imx6qdl-microsom.dtsi&quot;<br>
=C2=A0#include &quot;imx6qdl-cubox-i.dtsi&quot;<br>
<br>
=C2=A0/ {<br>
diff --git a/arch/arm/boot/dts/imx6q-<wbr>hummingboard.dts b/arch/arm/boot/=
dts/imx6q-<wbr>hummingboard.dts<br>
index 69a7a0a1cb21..6fc692940e6b 100644<br>
--- a/arch/arm/boot/dts/imx6q-<wbr>hummingboard.dts<br>
+++ b/arch/arm/boot/dts/imx6q-<wbr>hummingboard.dts<br>
@@ -42,6 +42,7 @@<br>
=C2=A0/dts-v1/;<br>
<br>
=C2=A0#include &quot;imx6q.dtsi&quot;<br>
+#include &quot;imx6qdl-microsom.dtsi&quot;<br>
=C2=A0#include &quot;imx6qdl-hummingboard.dtsi&quot;<br>
<br>
=C2=A0/ {<br>
diff --git a/arch/arm/boot/dts/imx6qdl-<wbr>cubox-i.dtsi b/arch/arm/boot/dt=
s/imx6qdl-<wbr>cubox-i.dtsi<br>
index 57ce2dbb6ad9..98ec7ce1f2a3 100644<br>
--- a/arch/arm/boot/dts/imx6qdl-<wbr>cubox-i.dtsi<br>
+++ b/arch/arm/boot/dts/imx6qdl-<wbr>cubox-i.dtsi<br>
@@ -38,7 +38,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE USE OR<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0OTHER DEALINGS IN THE SOFTWARE.<br>
=C2=A0 */<br>
-#include &quot;imx6qdl-microsom.dtsi&quot;<br>
=C2=A0#include &lt;dt-bindings/input/input.h&gt;<br>
=C2=A0#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
<br>
diff --git a/arch/arm/boot/dts/imx6qdl-<wbr>hummingboard.dtsi b/arch/arm/bo=
ot/dts/imx6qdl-<wbr>hummingboard.dtsi<br>
index afd981e9b5e3..84e6392fee1f 100644<br>
--- a/arch/arm/boot/dts/imx6qdl-<wbr>hummingboard.dtsi<br>
+++ b/arch/arm/boot/dts/imx6qdl-<wbr>hummingboard.dtsi<br>
@@ -38,7 +38,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE USE OR<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0OTHER DEALINGS IN THE SOFTWARE.<br>
=C2=A0 */<br>
-#include &quot;imx6qdl-microsom.dtsi&quot;<br>
<br>
=C2=A0/ {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chosen {<br></blockquote><div><br></div>Since w=
e are going through and adding the som dtsi include to all the device-tree =
files, would it make sense to rename the microsom.dtsi at this point in tim=
e?=C2=A0 Perhaps something like imx6qdl-sr-microsom.dtsi?</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">-Jon</div></div></div=
>

--94eb2c07188cb9b0e6055f03b311--
