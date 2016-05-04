From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Wed, 4 May 2016 01:49:07 -0700 (PDT)
Message-ID: <ecb1db18-1972-4af8-80ff-c9523dfeebf9@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <f3da30a6-9ac0-4d5e-8611-ebb80cb3589e@googlegroups.com>
 <20160503131437.GV17159@lukather>
 <66e4c452-1e34-474b-8973-2d57d9f036d0@googlegroups.com>
 <5728C929.3040709@schinagl.nl>
 <1462338781.15404.0.camel@plaes.org>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_169_95417768.1462351747939"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBBXPU24QKGQE6NG2CYA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1462338781.15404.0.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org, christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_169_95417768.1462351747939
Content-Type: multipart/alternative;
	boundary="----=_Part_170_881606319.1462351747939"

------=_Part_170_881606319.1462351747939
Content-Type: text/plain; charset=UTF-8

Exactly, the site is finally updated.

On Wednesday, May 4, 2016 at 8:13:05 AM UTC+3, Priit Laes wrote:
>
> On Tue, 2016-05-03 at 17:52 +0200, Olliver Schinagl wrote: 
> > Hey all, 
> > 
> > On 03-05-16 17:02, christ...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:> wrote: 
> > > On Tuesday, May 3, 2016 at 4:14:41 PM UTC+3, Maxime Ripard wrote: 
> > > > Hi, 
> > > > 
> > > > On Tue, May 03, 2016 at 4:12:06 PM UTC+3, Christo Radev wrote: 
> > > > > Hi to All, 
> > > > > 
> > > > > I have already solved and tested this issue on Armbian build. 
> > > > >  Find 
> > > > > patches for both legacy (3.4.111) and mainline (4.5.2) kernels 
> > > > > on: 
> > > > > http://forum.armbian.com/index.php/topic/853-armbian-customizat 
> > > > > ion/page-2#entry7494 
> > > > > There it is also described how to do eMMC bootable and much 
> > > > > more. 
> > > > > 
> > > > > About the board - Olimex already sold all 3 kinds after 
> > > > > migration to 
> > > > > their HW rev. E. One have to specify Lime2-eMMC as 
> > > > > A20-Olinuxino-Lime2-eMMC instead of their old 2 options 
> > > > > A20-Olinuxino-Lime2(-4GB). 
> > > > Interesting, you have a link to that device? 
>
> I guess, it is this one: 
>
> https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME2-eMMC/ 
> open-source-hardware 
> <https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME2-eMMC/open-source-hardware> 
>
> > > > 
> > > > Thanks, 
> > > > Maxime 
> > > > 
> > > > -- 
> > > > Maxime Ripard, Free Electrons 
> > > > Embedded Linux, Kernel and Android engineering 
> > > > http://free-electrons.com 
> > > I have really 2 boards delivered by their local distributor. 
> > > 
> > > Unfortunately, they do not update their site. Use the link for NAND 
> > > option: 
> > > https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXIno-LIME2-4 
> > > GB/open-source-hardware 
> > > There you can find Users Manual where it is described that eMMC 
> > > option is available from HW rev. D. The schematic for HW rev. E is 
> > > also available on their repository: 
> > > https://github.com/OLIMEX/OLINUXINO/tree/master/HARDWARE/A20-OLinuX 
> > > ino-LIME2 
> > > 
> > > On the board both 4GB NAND and eMMC Flash chips can be placed 
> > > alternatively on the same place. There is difference in some other 
> > > components as well. 
> > > 
> > > If one want to order it from the site probably has to order A20 
> > > -Olinuxino-Lime2-4GB with note that eMMC option is required. The 
> > > price is the same. 
> > Sorry for the late reply, but yeah the board exists, we asked Olimex 
> > to 
> > develop the eMMC variant for us. I currently have a dozen or so on my 
> > desk :) 
> > 
> > I don't know when Olimex will update their webshop with the new 
> > designs, 
> > but they simply might not have enough eMMC chips available yet? 
> > 
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_170_881606319.1462351747939
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Exactly, the site is finally updated.<br><br>On Wednesday,=
 May 4, 2016 at 8:13:05 AM UTC+3, Priit Laes wrote:<blockquote class=3D"gma=
il_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid=
;padding-left: 1ex;">On Tue, 2016-05-03 at 17:52 +0200, Olliver Schinagl wr=
ote:
<br>&gt; Hey all,
<br>&gt;=20
<br>&gt; On 03-05-16 17:02, <a href=3D"javascript:" target=3D"_blank" gdf-o=
bfuscated-mailto=3D"J3RHZENBAQAJ" rel=3D"nofollow" onmousedown=3D"this.href=
=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;">christ...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a> wrote:
<br>&gt; &gt; On Tuesday, May 3, 2016 at 4:14:41 PM UTC+3, Maxime Ripard wr=
ote:
<br>&gt; &gt; &gt; Hi,
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; On Tue, May 03, 2016 at 4:12:06 PM UTC+3, Christo Radev =
wrote:
<br>&gt; &gt; &gt; &gt; Hi to All,
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; I have already solved and tested this issue on Armb=
ian build.=20
<br>&gt; &gt; &gt; &gt; =C2=A0Find
<br>&gt; &gt; &gt; &gt; patches for both legacy (3.4.111) and mainline (4.5=
.2) kernels
<br>&gt; &gt; &gt; &gt; on:
<br>&gt; &gt; &gt; &gt; <a href=3D"http://forum.armbian.com/index.php/topic=
/853-armbian-customizat" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"=
this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fforum.armbian.=
com%2Findex.php%2Ftopic%2F853-armbian-customizat\x26sa\x3dD\x26sntz\x3d1\x2=
6usg\x3dAFQjCNFfNnocc-5o_mBIjtCDuEjEtkXc_Q&#39;;return true;" onclick=3D"th=
is.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fforum.armbian.co=
m%2Findex.php%2Ftopic%2F853-armbian-customizat\x26sa\x3dD\x26sntz\x3d1\x26u=
sg\x3dAFQjCNFfNnocc-5o_mBIjtCDuEjEtkXc_Q&#39;;return true;">http://forum.ar=
mbian.com/<wbr>index.php/topic/853-armbian-<wbr>customizat</a>
<br>&gt; &gt; &gt; &gt; ion/page-2#entry7494
<br>&gt; &gt; &gt; &gt; There it is also described how to do eMMC bootable =
and much
<br>&gt; &gt; &gt; &gt; more.
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; About the board - Olimex already sold all 3 kinds a=
fter
<br>&gt; &gt; &gt; &gt; migration to
<br>&gt; &gt; &gt; &gt; their HW rev. E. One have to specify Lime2-eMMC as
<br>&gt; &gt; &gt; &gt; A20-Olinuxino-Lime2-eMMC instead of their old 2 opt=
ions
<br>&gt; &gt; &gt; &gt; A20-Olinuxino-Lime2(-4GB).
<br>&gt; &gt; &gt; Interesting, you have a link to that device?
<br>
<br>I guess, it is this one:
<br>
<br><a href=3D"https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-=
LIME2-eMMC/open-source-hardware" target=3D"_blank" rel=3D"nofollow" onmouse=
down=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fwww.=
olimex.com%2FProducts%2FOLinuXino%2FA20%2FA20-OLinuXino-LIME2-eMMC%2Fopen-s=
ource-hardware\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNEfcGcRencgmPg6XkIRh1=
vnKQ9ddA&#39;;return true;" onclick=3D"this.href=3D&#39;https://www.google.=
com/url?q\x3dhttps%3A%2F%2Fwww.olimex.com%2FProducts%2FOLinuXino%2FA20%2FA2=
0-OLinuXino-LIME2-eMMC%2Fopen-source-hardware\x26sa\x3dD\x26sntz\x3d1\x26us=
g\x3dAFQjCNEfcGcRencgmPg6XkIRh1vnKQ9ddA&#39;;return true;">https://www.olim=
ex.com/<wbr>Products/OLinuXino/A20/A20-<wbr>OLinuXino-LIME2-eMMC/
<br>open-source-hardware</a>
<br>
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Thanks,
<br>&gt; &gt; &gt; Maxime
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; --=20
<br>&gt; &gt; &gt; Maxime Ripard, Free Electrons
<br>&gt; &gt; &gt; Embedded Linux, Kernel and Android engineering
<br>&gt; &gt; &gt; <a href=3D"http://free-electrons.com" target=3D"_blank" =
rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?=
q\x3dhttp%3A%2F%2Ffree-electrons.com\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQj=
CNGC8C9pT7xKJEabITLGL5cqtolifQ&#39;;return true;" onclick=3D"this.href=3D&#=
39;http://www.google.com/url?q\x3dhttp%3A%2F%2Ffree-electrons.com\x26sa\x3d=
D\x26sntz\x3d1\x26usg\x3dAFQjCNGC8C9pT7xKJEabITLGL5cqtolifQ&#39;;return tru=
e;">http://free-electrons.com</a>
<br>&gt; &gt; I have really 2 boards delivered by their local distributor.
<br>&gt; &gt;=20
<br>&gt; &gt; Unfortunately, they do not update their site. Use the link fo=
r NAND
<br>&gt; &gt; option:
<br>&gt; &gt; <a href=3D"https://www.olimex.com/Products/OLinuXino/A20/A20-=
OLinuXIno-LIME2-4" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.h=
ref=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fwww.olimex.com%2FP=
roducts%2FOLinuXino%2FA20%2FA20-OLinuXIno-LIME2-4\x26sa\x3dD\x26sntz\x3d1\x=
26usg\x3dAFQjCNGY_P6H-DyWC6U0OhfKm5xYHnxIcw&#39;;return true;" onclick=3D"t=
his.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fwww.olimex.co=
m%2FProducts%2FOLinuXino%2FA20%2FA20-OLinuXIno-LIME2-4\x26sa\x3dD\x26sntz\x=
3d1\x26usg\x3dAFQjCNGY_P6H-DyWC6U0OhfKm5xYHnxIcw&#39;;return true;">https:/=
/www.olimex.com/<wbr>Products/OLinuXino/A20/A20-<wbr>OLinuXIno-LIME2-4</a>
<br>&gt; &gt; GB/open-source-hardware
<br>&gt; &gt; There you can find Users Manual where it is described that eM=
MC
<br>&gt; &gt; option is available from HW rev. D. The schematic for HW rev.=
 E is
<br>&gt; &gt; also available on their repository:
<br>&gt; &gt; <a href=3D"https://github.com/OLIMEX/OLINUXINO/tree/master/HA=
RDWARE/A20-OLinuX" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.h=
ref=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2FOLIME=
X%2FOLINUXINO%2Ftree%2Fmaster%2FHARDWARE%2FA20-OLinuX\x26sa\x3dD\x26sntz\x3=
d1\x26usg\x3dAFQjCNFnL-7JZwFKMvIQUbhNsPsk8gb_vg&#39;;return true;" onclick=
=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.c=
om%2FOLIMEX%2FOLINUXINO%2Ftree%2Fmaster%2FHARDWARE%2FA20-OLinuX\x26sa\x3dD\=
x26sntz\x3d1\x26usg\x3dAFQjCNFnL-7JZwFKMvIQUbhNsPsk8gb_vg&#39;;return true;=
">https://github.com/OLIMEX/<wbr>OLINUXINO/tree/master/<wbr>HARDWARE/A20-OL=
inuX</a>
<br>&gt; &gt; ino-LIME2
<br>&gt; &gt;=20
<br>&gt; &gt; On the board both 4GB NAND and eMMC Flash chips can be placed
<br>&gt; &gt; alternatively on the same place. There is difference in some =
other
<br>&gt; &gt; components as well.
<br>&gt; &gt;=20
<br>&gt; &gt; If one want to order it from the site probably has to order A=
20
<br>&gt; &gt; -Olinuxino-Lime2-4GB with note that eMMC option is required. =
The
<br>&gt; &gt; price is the same.
<br>&gt; Sorry for the late reply, but yeah the board exists, we asked Olim=
ex
<br>&gt; to=20
<br>&gt; develop the eMMC variant for us. I currently have a dozen or so on=
 my
<br>&gt; desk :)
<br>&gt;=20
<br>&gt; I don&#39;t know when Olimex will update their webshop with the ne=
w
<br>&gt; designs,=20
<br>&gt; but they simply might not have enough eMMC chips available yet?
<br>&gt;=20
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_170_881606319.1462351747939--

------=_Part_169_95417768.1462351747939--
