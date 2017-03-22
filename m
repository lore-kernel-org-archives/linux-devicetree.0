Return-Path: <SRS0=vT0T=27=gmail.com=delicious.quinoa@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1490130159-2597-4-git-send-email-matthew.gerlach@linux.intel.com>
References: <1490130159-2597-1-git-send-email-matthew.gerlach@linux.intel.com> <1490130159-2597-4-git-send-email-matthew.gerlach@linux.intel.com>
From: Alan Tull <delicious.quinoa@gmail.com>
Date: Wed, 22 Mar 2017 10:18:51 -0500
Message-ID: <CANk1AXSoaedQi8x+mc2=m63GC3pErXkzq=uS=d5qA+3YngEGRg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] fpga dt: bindings for Altera Partial
 Reconfiguration IP.
Content-Type: multipart/alternative; boundary=94eb2c12532c8e3782054b534997
To: matthew.gerlach@linux.intel.com
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-fpga@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Anatolij Gustschin <agust@denx.de>
List-ID: <devicetree@vger.kernel.org>

--94eb2c12532c8e3782054b534997
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 4:02 PM,  <matthew.gerlach@linux.intel.com> wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Device Tree bindings for Altera Partial Reconfiguration IP.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Acked-by: Rob Herring <robh@kernel.org>

=E2=80=8BAcked-by: Alan Tull <atull@kernel.org>=E2=80=8B

> ---
> v5:
>     fix comment as suggested by Rob Herring <robh@kernel.org>
>     added Acked-by: Rob Herring <robh@kernel.org>
> v4: v3 patch set mistakenly sent out labeled as v4
> v3: s/altr,pr-ip/altr,a10-pr-ip/
> v2: s/Reconfiguraion/Reconfiguration/
> ---
>  Documentation/devicetree/bindings/fpga/altera-pr-ip.txt | 12 +++++++++++=
+
>  1 file changed, 12 insertions(+)
>  create mode 100644
Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
>
> diff --git a/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
> new file mode 100644
> index 0000000..52a294c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
> @@ -0,0 +1,12 @@
> +Altera Arria10 Partial Reconfiguration IP
> +
> +Required properties:
> +- compatible : should contain "altr,a10-pr-ip"
> +- reg        : base address and size for memory mapped io.
> +
> +Example:
> +
> +       fpga_mgr: fpga-mgr@ff20c000 {
> +               compatible =3D "altr,a10-pr-ip";
> +               reg =3D <0xff20c000 0x10>;
> +       };
> --
> 2.7.4
>

--94eb2c12532c8e3782054b534997
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Mar 21, 2017 at 4:02 PM, =C2=A0&lt;<a href=3D"mail=
to:matthew.gerlach@linux.intel.com">matthew.gerlach@linux.intel.com</a>&gt;=
 wrote:<br>&gt; From: Matthew Gerlach &lt;<a href=3D"mailto:matthew.gerlach=
@linux.intel.com">matthew.gerlach@linux.intel.com</a>&gt;<br>&gt;<br>&gt; D=
evice Tree bindings for Altera Partial Reconfiguration IP.<br>&gt;<br>&gt; =
Signed-off-by: Matthew Gerlach &lt;<a href=3D"mailto:matthew.gerlach@linux.=
intel.com">matthew.gerlach@linux.intel.com</a>&gt;<br>&gt; Acked-by: Rob He=
rring &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.org</a>&gt;<div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-family:monospace,mo=
nospace">=E2=80=8BAcked-by: Alan Tull &lt;<a href=3D"mailto:atull@kernel.or=
g">atull@kernel.org</a>&gt;=E2=80=8B</div><br>&gt; ---<br>&gt; v5:<br>&gt; =
=C2=A0 =C2=A0 fix comment as suggested by Rob Herring &lt;<a href=3D"mailto=
:robh@kernel.org">robh@kernel.org</a>&gt;<br>&gt; =C2=A0 =C2=A0 added Acked=
-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.org</a>=
&gt;<br>&gt; v4: v3 patch set mistakenly sent out labeled as v4<br>&gt; v3:=
 s/altr,pr-ip/altr,a10-pr-ip/<br>&gt; v2: s/Reconfiguraion/Reconfiguration/=
<br>&gt; ---<br>&gt; =C2=A0Documentation/devicetree/bindings/fpga/altera-pr=
-ip.txt | 12 ++++++++++++<br>&gt; =C2=A01 file changed, 12 insertions(+)<br=
>&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/fpga/alter=
a-pr-ip.txt<br>&gt;<br>&gt; diff --git a/Documentation/devicetree/bindings/=
fpga/altera-pr-ip.txt b/Documentation/devicetree/bindings/fpga/altera-pr-ip=
.txt<br>&gt; new file mode 100644<br>&gt; index 0000000..52a294c<br>&gt; --=
- /dev/null<br>&gt; +++ b/Documentation/devicetree/bindings/fpga/altera-pr-=
ip.txt<br>&gt; @@ -0,0 +1,12 @@<br>&gt; +Altera Arria10 Partial Reconfigura=
tion IP<br>&gt; +<br>&gt; +Required properties:<br>&gt; +- compatible : sho=
uld contain &quot;altr,a10-pr-ip&quot;<br>&gt; +- reg =C2=A0 =C2=A0 =C2=A0 =
=C2=A0: base address and size for memory mapped io.<br>&gt; +<br>&gt; +Exam=
ple:<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 fpga_mgr: fpga-mgr@ff20c000 {=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D =
&quot;altr,a10-pr-ip&quot;;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 reg =3D &lt;0xff20c000 0x10&gt;;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 };<br>&gt; --<br>&gt; 2.7.4<br>&gt;<br><br></div></div>

--94eb2c12532c8e3782054b534997--
