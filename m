From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Tue, 3 May 2016 10:27:27 -0700 (PDT)
Message-ID: <ea6c77a6-f19a-456f-a23f-d084987af6cc@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <f3da30a6-9ac0-4d5e-8611-ebb80cb3589e@googlegroups.com>
 <20160503131437.GV17159@lukather>
 <66e4c452-1e34-474b-8973-2d57d9f036d0@googlegroups.com>
 <5728C929.3040709@schinagl.nl>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_3205_1709923966.1462296447591"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBAF7UO4QKGQEWTSKUAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5728C929.3040709-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_3205_1709923966.1462296447591
Content-Type: multipart/alternative;
	boundary="----=_Part_3206_1730398791.1462296447591"

------=_Part_3206_1730398791.1462296447591
Content-Type: text/plain; charset=UTF-8

Hi Oliver,

Nice to hear it. Thanks to Olimex I also have 2 board and make series of 
tests and customization effort based on Armbian build scripts.
I have passed through patching and customization of U-Boot, Kernel (both 
legacy 3.4.111 and mainline 4.5.2), Debian Jessie as FS, RPI Monitor etc.
All my steps are described in a couple of posts on Armbian forum where the 
main one is:
http://forum.armbian.com/index.php/topic/853-armbian-customization
There one can find all patches I have used, step by step instruction on how 
to install and boot from eMMC, SD/MMC, SATA, some measurements and tests.
One of the useful things in my opinion is U-Boot script to boot from 
available boot devices in given order and usage of user button for 
emergency boot from eMMC or SD/MMC.

Of course, my customization effort is not finished so some help in USB OTG 
activation and read-only rootfs preparation will be welcome.

Any help or notes on how the things can be done in a better way will be 
appreciated as well.

Regards
Chris

On Tuesday, May 3, 2016 at 6:52:15 PM UTC+3, Olliver Schinagl wrote:
>
> Hey all, 
>
> On 03-05-16 17:02, christ...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:> wrote: 
> > On Tuesday, May 3, 2016 at 4:14:41 PM UTC+3, Maxime Ripard wrote: 
> >> Hi, 
> >> 
> >> On Tue, May 03, 2016 at 4:12:06 PM UTC+3, Christo Radev wrote: 
> >>> Hi to All, 
> >>> 
> >>> I have already solved and tested this issue on Armbian build.  Find 
> >>> patches for both legacy (3.4.111) and mainline (4.5.2) kernels on: 
> >>> 
> http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7494 
> >>> There it is also described how to do eMMC bootable and much more. 
> >>> 
> >>> About the board - Olimex already sold all 3 kinds after migration to 
> >>> their HW rev. E. One have to specify Lime2-eMMC as 
> >>> A20-Olinuxino-Lime2-eMMC instead of their old 2 options 
> >>> A20-Olinuxino-Lime2(-4GB). 
> >> Interesting, you have a link to that device? 
> >> 
> >> Thanks, 
> >> Maxime 
> >> 
> >> -- 
> >> Maxime Ripard, Free Electrons 
> >> Embedded Linux, Kernel and Android engineering 
> >> http://free-electrons.com 
> > I have really 2 boards delivered by their local distributor. 
> > 
> > Unfortunately, they do not update their site. Use the link for NAND 
> option: 
> > 
> https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXIno-LIME2-4GB/open-source-hardware 
> > There you can find Users Manual where it is described that eMMC option 
> is available from HW rev. D. The schematic for HW rev. E is also available 
> on their repository: 
> > 
> https://github.com/OLIMEX/OLINUXINO/tree/master/HARDWARE/A20-OLinuXino-LIME2 
> > 
> > On the board both 4GB NAND and eMMC Flash chips can be placed 
> alternatively on the same place. There is difference in some other 
> components as well. 
> > 
> > If one want to order it from the site probably has to order 
> A20-Olinuxino-Lime2-4GB with note that eMMC option is required. The price 
> is the same. 
> Sorry for the late reply, but yeah the board exists, we asked Olimex to 
> develop the eMMC variant for us. I currently have a dozen or so on my 
> desk :) 
>
> I don't know when Olimex will update their webshop with the new designs, 
> but they simply might not have enough eMMC chips available yet? 
>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_3206_1730398791.1462296447591
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Oliver,<br><br>Nice to hear it. Thanks to Olimex I also=
 have 2 board and make series of tests and customization effort based on Ar=
mbian build scripts.<br>I have passed through patching and customization of=
 U-Boot, Kernel (both legacy 3.4.111 and mainline 4.5.2), Debian Jessie as =
FS, RPI Monitor etc.<br>All my steps are described in a couple of posts on =
Armbian forum where the main one is:<br>http://forum.armbian.com/index.php/=
topic/853-armbian-customization<br>There one can find all patches I have us=
ed, step by step instruction on how to install and boot from eMMC, SD/MMC, =
SATA, some measurements and tests.<br>One of the useful things in my opinio=
n is U-Boot script to boot from available boot devices in given order and u=
sage of user button for emergency boot from eMMC or SD/MMC.<br><br>Of cours=
e, my customization effort is not finished so some help in USB OTG activati=
on and read-only rootfs preparation will be welcome.<br><br>Any help or not=
es on how the things can be done in a better way will be appreciated as wel=
l.<br><br>Regards<br>Chris<br><br>On Tuesday, May 3, 2016 at 6:52:15 PM UTC=
+3, Olliver Schinagl wrote:<blockquote class=3D"gmail_quote" style=3D"margi=
n: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Hey=
 all,
<br>
<br>On 03-05-16 17:02, <a href=3D"javascript:" target=3D"_blank" gdf-obfusc=
ated-mailto=3D"Hbhj148VAQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#=
39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#=
39;;return true;">christ...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a> wrote:
<br>&gt; On Tuesday, May 3, 2016 at 4:14:41 PM UTC+3, Maxime Ripard wrote:
<br>&gt;&gt; Hi,
<br>&gt;&gt;
<br>&gt;&gt; On Tue, May 03, 2016 at 4:12:06 PM UTC+3, Christo Radev wrote:
<br>&gt;&gt;&gt; Hi to All,
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; I have already solved and tested this issue on Armbian bui=
ld. =C2=A0Find
<br>&gt;&gt;&gt; patches for both legacy (3.4.111) and mainline (4.5.2) ker=
nels on:
<br>&gt;&gt;&gt; <a href=3D"http://forum.armbian.com/index.php/topic/853-ar=
mbian-customization/page-2#entry7494" target=3D"_blank" rel=3D"nofollow" on=
mousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Ff=
orum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customization%2Fpage-2%2=
3entry7494\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGGekB-5qHA2iRJbqb0YLo5YB=
PWZw&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google.com/u=
rl?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-cu=
stomization%2Fpage-2%23entry7494\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGG=
ekB-5qHA2iRJbqb0YLo5YBPWZw&#39;;return true;">http://forum.armbian.com/<wbr=
>index.php/topic/853-armbian-<wbr>customization/page-2#entry7494</a>
<br>&gt;&gt;&gt; There it is also described how to do eMMC bootable and muc=
h more.
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; About the board - Olimex already sold all 3 kinds after mi=
gration to
<br>&gt;&gt;&gt; their HW rev. E. One have to specify Lime2-eMMC as
<br>&gt;&gt;&gt; A20-Olinuxino-Lime2-eMMC instead of their old 2 options
<br>&gt;&gt;&gt; A20-Olinuxino-Lime2(-4GB).
<br>&gt;&gt; Interesting, you have a link to that device?
<br>&gt;&gt;
<br>&gt;&gt; Thanks,
<br>&gt;&gt; Maxime
<br>&gt;&gt;
<br>&gt;&gt; --=20
<br>&gt;&gt; Maxime Ripard, Free Electrons
<br>&gt;&gt; Embedded Linux, Kernel and Android engineering
<br>&gt;&gt; <a href=3D"http://free-electrons.com" target=3D"_blank" rel=3D=
"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dh=
ttp%3A%2F%2Ffree-electrons.com\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGC8C=
9pT7xKJEabITLGL5cqtolifQ&#39;;return true;" onclick=3D"this.href=3D&#39;htt=
p://www.google.com/url?q\x3dhttp%3A%2F%2Ffree-electrons.com\x26sa\x3dD\x26s=
ntz\x3d1\x26usg\x3dAFQjCNGC8C9pT7xKJEabITLGL5cqtolifQ&#39;;return true;">ht=
tp://free-electrons.com</a>
<br>&gt; I have really 2 boards delivered by their local distributor.
<br>&gt;
<br>&gt; Unfortunately, they do not update their site. Use the link for NAN=
D option:
<br>&gt; <a href=3D"https://www.olimex.com/Products/OLinuXino/A20/A20-OLinu=
XIno-LIME2-4GB/open-source-hardware" target=3D"_blank" rel=3D"nofollow" onm=
ousedown=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2F=
www.olimex.com%2FProducts%2FOLinuXino%2FA20%2FA20-OLinuXIno-LIME2-4GB%2Fope=
n-source-hardware\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFXxJLsq2_OXM4D5JO=
pYbv3PBI5xg&#39;;return true;" onclick=3D"this.href=3D&#39;https://www.goog=
le.com/url?q\x3dhttps%3A%2F%2Fwww.olimex.com%2FProducts%2FOLinuXino%2FA20%2=
FA20-OLinuXIno-LIME2-4GB%2Fopen-source-hardware\x26sa\x3dD\x26sntz\x3d1\x26=
usg\x3dAFQjCNFXxJLsq2_OXM4D5JOpYbv3PBI5xg&#39;;return true;">https://www.ol=
imex.com/<wbr>Products/OLinuXino/A20/A20-<wbr>OLinuXIno-LIME2-4GB/open-<wbr=
>source-hardware</a>
<br>&gt; There you can find Users Manual where it is described that eMMC op=
tion is available from HW rev. D. The schematic for HW rev. E is also avail=
able on their repository:
<br>&gt; <a href=3D"https://github.com/OLIMEX/OLINUXINO/tree/master/HARDWAR=
E/A20-OLinuXino-LIME2" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"th=
is.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2FO=
LIMEX%2FOLINUXINO%2Ftree%2Fmaster%2FHARDWARE%2FA20-OLinuXino-LIME2\x26sa\x3=
dD\x26sntz\x3d1\x26usg\x3dAFQjCNG0n3VYhh3Tc6x6nLUgmWGMAdH9Gw&#39;;return tr=
ue;" onclick=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2=
F%2Fgithub.com%2FOLIMEX%2FOLINUXINO%2Ftree%2Fmaster%2FHARDWARE%2FA20-OLinuX=
ino-LIME2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNG0n3VYhh3Tc6x6nLUgmWGMAdH=
9Gw&#39;;return true;">https://github.com/OLIMEX/<wbr>OLINUXINO/tree/master=
/<wbr>HARDWARE/A20-OLinuXino-LIME2</a>
<br>&gt;
<br>&gt; On the board both 4GB NAND and eMMC Flash chips can be placed alte=
rnatively on the same place. There is difference in some other components a=
s well.
<br>&gt;
<br>&gt; If one want to order it from the site probably has to order A20-Ol=
inuxino-Lime2-4GB with note that eMMC option is required. The price is the =
same.
<br>Sorry for the late reply, but yeah the board exists, we asked Olimex to=
=20
<br>develop the eMMC variant for us. I currently have a dozen or so on my=
=20
<br>desk :)
<br>
<br>I don&#39;t know when Olimex will update their webshop with the new des=
igns,=20
<br>but they simply might not have enough eMMC chips available yet?
<br>
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

------=_Part_3206_1730398791.1462296447591--

------=_Part_3205_1709923966.1462296447591--
