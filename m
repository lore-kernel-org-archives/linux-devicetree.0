From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: bootloader support for DTB on x86
Date: Tue, 10 Jul 2012 14:27:26 +0200
Message-ID: <CAPnjgZ2OwarbF+=SZkXYgszhES94Y6=-9wq+BdNHuo+PrZsYWA@mail.gmail.com>
References: <20120522125622.GA21187@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3476383853890534948=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120522125622.GA21187-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============3476383853890534948==
Content-Type: multipart/alternative; boundary=e89a8fb1ed4a72035e04c478da49

--e89a8fb1ed4a72035e04c478da49
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Tue, May 22, 2012 at 2:56 PM, Thierry Reding <
thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:

> Hi,
>
> I was looking at booting an x86-based platform using DT. However I wasn't
> able to find a bootloader that supports this. There also doesn't seem to
> be a
> method to append the DTB to the zImage (which I wouldn't want to use
> anyway).
> Does anybody know of a bootloader that supports this?
>

Maybe U-Boot with a FIT image? Also, you should support having multiple
device trees in the image and the boot loader selecting the correct one.

I don't think we should rely on there being an initrd - what do we do if
there isn't one?


>
> I'm currently using syslinux (specifically extlinux) and was looking at
> perhaps adding the support myself based on the information given in
> Documentation/x86/boot.txt. However I'm not overly familiar with syslinux
> code and this could prove more difficult than I anticipate.
>
> The only x86 platforms that use DT seem to be OLPC and CE4100 and according
> to the web the OLPC has a complete OF implementation. Does anyone know
> which
> bootloader the CE4100 uses?
>
> Thierry
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>
Regards,
Simon

--e89a8fb1ed4a72035e04c478da49
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br><div class=3D"gmail_quote">On Tue, May 22, 2012 at 2:56 PM, Thie=
rry Reding <span dir=3D"ltr">&lt;<a href=3D"mailto:thierry.reding@avionic-d=
esign.de" target=3D"_blank">thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org</a>&gt;</span>=
 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi,<br>
<br>
I was looking at booting an x86-based platform using DT. However I wasn&#39=
;t<br>
able to find a bootloader that supports this. There also doesn&#39;t seem t=
o be a<br>
method to append the DTB to the zImage (which I wouldn&#39;t want to use an=
yway).<br>
Does anybody know of a bootloader that supports this?<br></blockquote><div>=
<br></div><div>Maybe U-Boot with a FIT image? Also, you should support havi=
ng multiple device trees in the image and the boot loader selecting the cor=
rect one.</div>
<div><br></div><div>I don&#39;t think we should rely on there being an init=
rd - what do we do if there isn&#39;t one?</div><div>=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

<br>
I&#39;m currently using syslinux (specifically extlinux) and was looking at=
<br>
perhaps adding the support myself based on the information given in<br>
Documentation/x86/boot.txt. However I&#39;m not overly familiar with syslin=
ux<br>
code and this could prove more difficult than I anticipate.<br>
<br>
The only x86 platforms that use DT seem to be OLPC and CE4100 and according=
<br>
to the web the OLPC has a complete OF implementation. Does anyone know whic=
h<br>
bootloader the CE4100 uses?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Thierry<br>
</font></span><br>_______________________________________________<br>
devicetree-discuss mailing list<br>
<a href=3D"mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss@l=
ists.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss" target=3D"=
_blank">https://lists.ozlabs.org/listinfo/devicetree-discuss</a><br>
<br></blockquote></div><br><div>Regards,</div><div>Simon</div><div><br></di=
v>

--e89a8fb1ed4a72035e04c478da49--

--===============3476383853890534948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3476383853890534948==--
