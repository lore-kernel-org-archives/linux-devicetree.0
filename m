From: "Dennis Lan (dlan)" <dennis.yxun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Arm-netbook] getting allwinner SoC support upstream (was Re:
 Uploading linux (3.9.4-1))
Date: Sat, 8 Jun 2013 07:09:38 +0800
Message-ID: <CAF1ZMEets=ea+zpUTUn9Xr-+C+JaKxajK45vK+_mnDJJeoYQpA@mail.gmail.com>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
 <1370475609.20454.44.camel@localhost>
 <CAPweEDwS3tR=wh-bZJb3vqR8fVQra=3XxDitowGRdH9c7WRfmQ@mail.gmail.com>
 <1733666.lHUBcfUXq9@flatron> <20130606112723.71ddd70c@skate>
 <CAPweEDzW60poOYahm31aW3_A=NvZmyBPPPgM9PzdvuPJnju69A@mail.gmail.com>
 <20130607220853.GR14209@lukather>
 <CAPweEDwFHY_AbBxjspm7BvfdFHsxL5H594cFN4ZVC6QFpu4QGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1647208947423473511=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPweEDwFHY_AbBxjspm7BvfdFHsxL5H594cFN4ZVC6QFpu4QGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: "luke.leighton" <luke.leighton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, debian-arm <debian-arm-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux on small ARM machines <arm-netbook-Fj0DB6SUpRXNuVmtMlwsDbVCufUGDwFn@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, debian-kernel <debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1647208947423473511==
Content-Type: multipart/alternative; boundary=047d7b67610474308a04de988609

--047d7b67610474308a04de988609
Content-Type: text/plain; charset=UTF-8

On Saturday, June 8, 2013, luke.leighton wrote:

> right - too many people contributed to this, input from jon smirl,
> wookie, maxime, tomasz, henrik, i've made a start here and will
> continue editing: this is notes for me to put forward an agenda for
> discussion:
>
> http://hands.com/~lkcl/allwinner_linux_proposal.txt
>
> i'm setting a rule that each section *has* to have a list of clear
> benefits, otherwise it'll have to be removed before it goes on to
> their Directors.
>
> so - even if there are any allwinner engineers reading this who would
> like something put forward please also speak up! :)
>
> l.
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>


Hi luke
     I'm not a allwinner employer :-)$. but pretty much in the same
position as they are.

     I'd like to add a few comments about the risk of adopting the device
tree(from allwinner side)
1) current using fdt in bootloader(uboot) is not mature, I'm not saying
about passing the fdt data to kernel.
  But the bootloader itself need information from device tree, say boot0/1
phase (boot device type, DDR initialization...)
  since fdt is not ready, and SRAM space is very limited ... I'm afraid
'fex' may co-exist with device tree.
  still, they receive benefits if they can adopt device tree, at
least minimal the kernel side migration effort
  Generally this info already been pointed out by steppen warren in
previous email...

2) device tree may not been understood by third vendors (who previus
produce shoes or ? :-$),
  they are real old 'Fex' scheme user, they like edit the data in windows
with dos format
  So, how to fill this gaps, make them happy? Creat another tool to handle
device tree modification?
  Then it's another price they have to pay...


Dennis Lan

--047d7b67610474308a04de988609
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, June 8, 2013, luke.leighton  wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">right - too many people contributed to this, input from jon=
 smirl,<br>


wookie, maxime, tomasz, henrik, i&#39;ve made a start here and will<br>
continue editing: this is notes for me to put forward an agenda for<br>
discussion:<br>
<br>
<a href=3D"http://hands.com/~lkcl/allwinner_linux_proposal.txt" target=3D"_=
blank">http://hands.com/~lkcl/allwinner_linux_proposal.txt</a><br>
<br>
i&#39;m setting a rule that each section *has* to have a list of clear<br>
benefits, otherwise it&#39;ll have to be removed before it goes on to<br>
their Directors.<br>
<br>
so - even if there are any allwinner engineers reading this who would<br>
like something put forward please also speak up! :)<br>
<br>
l.<br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l</a><br>
</blockquote><div><br></div><div><br></div><div>Hi luke</div><div>=C2=A0 =
=C2=A0 =C2=A0I&#39;m not a allwinner employer :-)$.=C2=A0but pretty much in=
 the same position as they are.</div><div><br></div><div>=C2=A0 =C2=A0 =C2=
=A0I&#39;d like to add a few comments about the risk of adopting the device=
 tree(from allwinner side)</div>

<div>1) current using fdt in bootloader(uboot) is not mature, I&#39;m not=
=C2=A0saying about passing the fdt data to kernel.</div><div>=C2=A0 But the=
 bootloader itself need information from device tree, say boot0/1 phase (bo=
ot device type, DDR initialization...)</div>

<div>=C2=A0 since=C2=A0fdt is not ready, and=C2=A0SRAM space is very limite=
d ... I&#39;m afraid &#39;fex&#39; may co-exist with device tree.</div><div=
>=C2=A0 still, they=C2=A0receive=C2=A0benefits=C2=A0if they can adopt devic=
e tree, at least=C2=A0minimal the=C2=A0kernel side migration effort</div>

<div>=C2=A0 Generally this info=C2=A0already been=C2=A0pointed<span></span>=
 out by steppen warren in previous email...</div><div><br></div><div>2) dev=
ice tree may not been understood by third vendors=C2=A0(who previus produce=
=C2=A0shoes or ? :-$),=C2=A0</div>

<div>=C2=A0=C2=A0they are real old=C2=A0&#39;Fex&#39; scheme user, they lik=
e edit the data=C2=A0in windows with dos format</div><div>=C2=A0 So, how=C2=
=A0to fill this gaps, make them happy? Creat another tool to handle device =
tree modification?</div><div>

=C2=A0 Then it&#39;s another=C2=A0price they=C2=A0have to pay...</div><div>=
<br></div><div><br></div><div>Dennis Lan</div>

--047d7b67610474308a04de988609--

--===============1647208947423473511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1647208947423473511==--
