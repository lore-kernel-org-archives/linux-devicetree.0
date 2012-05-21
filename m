From: "Ujfalusi, Peter" <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] Input: twl6040-vibra: Update for device tree support
Date: Mon, 21 May 2012 12:45:07 +0300
Message-ID: <CAPo=G1ypT3T+yhFZF9W4Go1v+nPZM05QQwND-OVgCddccvb4KA@mail.gmail.com>
References: <1337167186-8535-1-git-send-email-peter.ujfalusi@ti.com>
 <20120516193546.GA15920@core.coreip.homeip.net>
 <CAPo=G1zf1XJcoKgCxMn3X09T0LOUG-9aw3iopqC7OPqcuc5hcQ@mail.gmail.com>
 <20120521053159.GA30285@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4973496787165681211=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120521053159.GA30285-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4973496787165681211==
Content-Type: multipart/alternative; boundary=e89a8f234341d877a904c088c141

--e89a8f234341d877a904c088c141
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Monday, May 21, 2012, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hmm, I am getting:
>
>  CC      drivers/input/misc/twl6040-vibra.o
> drivers/input/misc/twl6040-vibra.c: In function =91twl6040_vibra_probe=92=
:
> drivers/input/misc/twl6040-vibra.c:263:9: error: implicit declaration of
> function =91of_find_node_by_name=92 [-Werror=3Dimplicit-function-declarat=
ion]
> drivers/input/misc/twl6040-vibra.c:263:42: warning: initialization makes
> pointer from integer without a cast [enabled by default]
> cc1: some warnings being treated as errors
> make[1]: *** [drivers/input/misc/twl6040-vibra.o] Error 1
> make: *** [drivers/input/misc/twl6040-vibra.o] Error 2
>
>
> it looks like there is no stub for of_find_node_by_name().

I'm on holiday at the moment without a way to check this.
I think it is better to skip this patch for now until I got back.

It might be that we need to include the of_device.h as well?

Sorry about it.

Regards,
P=E9ter

--=20
P=E9ter

--e89a8f234341d877a904c088c141
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,<br><br>On Monday, May 21, 2012, Dmitry Torokhov &lt;<a href=3D"m=
ailto:dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<b=
r>&gt; Hmm, I am getting:<br>&gt;<br>&gt; =A0CC =A0 =A0 =A0drivers/input/mi=
sc/twl6040-vibra.o<br>
&gt; drivers/input/misc/twl6040-vibra.c: In function =91twl6040_vibra_probe=
=92:<br>&gt; drivers/input/misc/twl6040-vibra.c:263:9: error: implicit decl=
aration of<br>&gt; function =91of_find_node_by_name=92 [-Werror=3Dimplicit-=
function-declaration]<br>
&gt; drivers/input/misc/twl6040-vibra.c:263:42: warning: initialization mak=
es<br>&gt; pointer from integer without a cast [enabled by default]<br>&gt;=
 cc1: some warnings being treated as errors<br>&gt; make[1]: *** [drivers/i=
nput/misc/twl6040-vibra.o] Error 1<br>
&gt; make: *** [drivers/input/misc/twl6040-vibra.o] Error 2<br>&gt;<br>&gt;=
<br>&gt; it looks like there is no stub for of_find_node_by_name().<br><br>=
I&#39;m on holiday at the moment without a way to check this.<br>I think it=
 is better to skip this patch for now until I got back.<br>
<br>It might be that we need to include the of_device.h as well?<br><br>Sor=
ry about it.<br><br>Regards,<br>P=E9ter<br><br>-- <br>P=E9ter<br>

--e89a8f234341d877a904c088c141--

--===============4973496787165681211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4973496787165681211==--
