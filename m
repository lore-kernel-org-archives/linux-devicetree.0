Return-Path: <SRS0=jJAd=ZX=broadcom.com=jon.mason@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b2bdc1a7-4e5c-a13e-0cda-c90759d7308c@gmail.com>
References: <20170208233023.31922-1-zajec5@gmail.com> <82b47a03-c41b-378b-2d7c-f263eff514a9@gmail.com>
 <1b66f9ab3a9efd1bd0817a114e5b9ec9@milecki.pl> <06b6461c-9f43-3482-352f-374490056e90@gmail.com>
 <b715c193196fb2de2b95cc3d15102e1b@milecki.pl> <b2bdc1a7-4e5c-a13e-0cda-c90759d7308c@gmail.com>
From: Jon Mason <jon.mason@broadcom.com>
Date: Thu, 9 Feb 2017 19:27:44 -0500
Message-ID: <CAC3K-4o+ARP=_hg2XQszQh6v+ySpubyKRspCF38SLUUx4mXQDA@mail.gmail.com>
Subject: Re: [PATCH for-4.11 1/2] Revert "phy: Add USB3 PHY support for
 Broadcom NSP SoC"
Content-Type: multipart/alternative; boundary=001a11439ad4a5f7650548222abe
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11439ad4a5f7650548222abe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 9, 2017 at 2:18 PM, Florian Fainelli <f.fainelli@gmail.com>
wrote:

> On 02/08/2017 11:21 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> > On 2017-02-09 00:44, Florian Fainelli wrote:
> >> On 02/08/2017 03:39 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>> On 2017-02-09 00:32, Florian Fainelli wrote:
> >>>> On 02/08/2017 03:30 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>>>>
> >>>>> This reverts commit d7bc1a7d41bf ("phy: Add USB3 PHY support for
> >>>>> Broadcom NSP SoC") as we already have driver for this PHY (shared
> >>>>> by NS
> >>>>> and NSP). It was added in commit e5666281d9ea ("phy: bcm-ns-usb3: n=
ew
> >>>>> driver for USB 3.0 PHY on Northstar").
> >>>>>
> >>>>> Instead of adding separated driver & duplicating code we should
> >>>>> work on
> >>>>> improving existing (old) one. Thanks to work done by Broadcom we kn=
ow
> >>>>> there is MDIO bus we weren't aware of & we know register names whic=
h
> >>>>> makes initialization more clear. This is very valuable info and we
> >>>>> should work on using it in existing driver afterwards.
> >>>>
> >>>> Should not we first extend the old driver to support NSP and then
> >>>> revert
> >>>> d7bc1a7d41bf ("phy: Add USB3 PHY support for Broadcom NSP SoC")?
> >>>
> >>> Sounds like a weird / dirty development method to me: adding duplicat=
ed
> >>> code
> >>> first then working on cleaning it. Unless you mean drivers/staging/.
> >>
> >> There was clearly a mistake in submitting this NSP USB PHY driver, and
> >> it should have been a patch against the existing NS USB PHY driver, bu=
t
> >> it was not, okay fair enough.
> >>
> >> It's one thing to address that in the future, and it's another thing t=
o
> >> flat out revert the driver just because you don't like the duplication=
.
> >>
> >> I don't like that either, and we can discuss on how to improve things
> >> (like have the maintainer review that too), but duplication is a lesse=
r
> >> evil than not having the hardware supported at all, and even more so,
> >> purposely reverting in the name of removing that duplication, that's
> >> intentionally breaking working hardware!
> >
> > Hardware support is not excuse and I don't think it ever was in the
> Linux.
> >
> > We don't accept badly designed drivers just because they provide new hw
> > support.
> > We have various standards (for quality, style, design, code) at kernel
> > and we
> > stick to them unless it's drivers/staging/. As you said this driver
> > shouldn't be
> > pushed in the first place.
> >
> > Dropping hardware support in kernel happens. Sometimes it's about ancie=
nt
> > devices, sometimes about code quality (some forgotten staging drivers
> > used to be
> > dropped AFAIK).
> >
> > Additionally you're talking about support that was *just* added and
> > isn't used
> > by anyone in the wild world yet.
>
> Except people working on it at Broadcom, but fair enough.
>
> >
> > This hardware was missing upstream support for 4 years so 2 extra month=
s
> > won't
> > really hurt anyone.
> >
> > I really don't see excusee or need for keeping this driver.
> >
> > If you want to (and you feel it's well designed), we can keep
> > brcm,nsp-usb3-phy.txt
>
> No it's fine, let's drop it all and replace it with whatever you and Jon
> come up with next.
>
> >
> > I vote for focusing on existing driver improvements instead of looking
> for
> > excuses for keeping driver that shouldn't be added in the first place.
> > Jon seems to be already working on this, I'm willing to help him, I'm
> > sure we
> > can get you a proper support for the next merge window.
>
> Fair enough, I dropped Dhanajay's changes ("ARM: dts: NSP: Add USB nodes
> for Northstar Plus") from devicetree/next so you and Jon can figure out
> what is the best thing to move forward and we minimize the amount of
> incompatible DT stuff to be sorted out later on. So as far as I am
> concerned, there are no board/SoC DTS changes to be patched later on, we
> could re-apply this patch as-is, or we could have to define a new binding=
.
> --
> Florian
>


Per the discussion with Rafal, this is acceptable

Acked-by: Jon Mason <jon.mason@broadcom.com>

--001a11439ad4a5f7650548222abe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 9, 2017 at 2:18 PM, Florian Fainelli <span dir=3D"ltr">&lt;=
<a href=3D"mailto:f.fainelli@gmail.com" target=3D"_blank">f.fainelli@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div class=3D"gmail-m_6954105614134943765HOEnZb"><div class=3D"gmail-m_=
6954105614134943765h5">On 02/08/2017 11:21 PM, Rafa=C5=82 Mi=C5=82ecki wrot=
e:<br>
&gt; On 2017-02-09 00:44, Florian Fainelli wrote:<br>
&gt;&gt; On 02/08/2017 03:39 PM, Rafa=C5=82 Mi=C5=82ecki wrote:<br>
&gt;&gt;&gt; On 2017-02-09 00:32, Florian Fainelli wrote:<br>
&gt;&gt;&gt;&gt; On 02/08/2017 03:30 PM, Rafa=C5=82 Mi=C5=82ecki wrote:<br>
&gt;&gt;&gt;&gt;&gt; From: Rafa=C5=82 Mi=C5=82ecki &lt;<a href=3D"mailto:ra=
fal@milecki.pl" target=3D"_blank">rafal@milecki.pl</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; This reverts commit d7bc1a7d41bf (&quot;phy: Add USB3 =
PHY support for<br>
&gt;&gt;&gt;&gt;&gt; Broadcom NSP SoC&quot;) as we already have driver for =
this PHY (shared<br>
&gt;&gt;&gt;&gt;&gt; by NS<br>
&gt;&gt;&gt;&gt;&gt; and NSP). It was added in commit e5666281d9ea (&quot;p=
hy: bcm-ns-usb3: new<br>
&gt;&gt;&gt;&gt;&gt; driver for USB 3.0 PHY on Northstar&quot;).<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Instead of adding separated driver &amp; duplicating c=
ode we should<br>
&gt;&gt;&gt;&gt;&gt; work on<br>
&gt;&gt;&gt;&gt;&gt; improving existing (old) one. Thanks to work done by B=
roadcom we know<br>
&gt;&gt;&gt;&gt;&gt; there is MDIO bus we weren&#39;t aware of &amp; we kno=
w register names which<br>
&gt;&gt;&gt;&gt;&gt; makes initialization more clear. This is very valuable=
 info and we<br>
&gt;&gt;&gt;&gt;&gt; should work on using it in existing driver afterwards.=
<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Should not we first extend the old driver to support NSP a=
nd then<br>
&gt;&gt;&gt;&gt; revert<br>
&gt;&gt;&gt;&gt; d7bc1a7d41bf (&quot;phy: Add USB3 PHY support for Broadcom=
 NSP SoC&quot;)?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sounds like a weird / dirty development method to me: adding d=
uplicated<br>
&gt;&gt;&gt; code<br>
&gt;&gt;&gt; first then working on cleaning it. Unless you mean drivers/sta=
ging/.<br>
&gt;&gt;<br>
&gt;&gt; There was clearly a mistake in submitting this NSP USB PHY driver,=
 and<br>
&gt;&gt; it should have been a patch against the existing NS USB PHY driver=
, but<br>
&gt;&gt; it was not, okay fair enough.<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s one thing to address that in the future, and it&#39;s ano=
ther thing to<br>
&gt;&gt; flat out revert the driver just because you don&#39;t like the dup=
lication.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t like that either, and we can discuss on how to improve=
 things<br>
&gt;&gt; (like have the maintainer review that too), but duplication is a l=
esser<br>
&gt;&gt; evil than not having the hardware supported at all, and even more =
so,<br>
&gt;&gt; purposely reverting in the name of removing that duplication, that=
&#39;s<br>
&gt;&gt; intentionally breaking working hardware!<br>
&gt;<br>
&gt; Hardware support is not excuse and I don&#39;t think it ever was in th=
e Linux.<br>
&gt;<br>
&gt; We don&#39;t accept badly designed drivers just because they provide n=
ew hw<br>
&gt; support.<br>
&gt; We have various standards (for quality, style, design, code) at kernel=
<br>
&gt; and we<br>
&gt; stick to them unless it&#39;s drivers/staging/. As you said this drive=
r<br>
&gt; shouldn&#39;t be<br>
&gt; pushed in the first place.<br>
&gt;<br>
&gt; Dropping hardware support in kernel happens. Sometimes it&#39;s about =
ancient<br>
&gt; devices, sometimes about code quality (some forgotten staging drivers<=
br>
&gt; used to be<br>
&gt; dropped AFAIK).<br>
&gt;<br>
&gt; Additionally you&#39;re talking about support that was *just* added an=
d<br>
&gt; isn&#39;t used<br>
&gt; by anyone in the wild world yet.<br>
<br>
</div></div>Except people working on it at Broadcom, but fair enough.<br>
<span><br>
&gt;<br>
&gt; This hardware was missing upstream support for 4 years so 2 extra mont=
hs<br>
&gt; won&#39;t<br>
&gt; really hurt anyone.<br>
&gt;<br>
&gt; I really don&#39;t see excusee or need for keeping this driver.<br>
&gt;<br>
&gt; If you want to (and you feel it&#39;s well designed), we can keep<br>
&gt; brcm,nsp-usb3-phy.txt<br>
<br>
</span>No it&#39;s fine, let&#39;s drop it all and replace it with whatever=
 you and Jon<br>
come up with next.<br>
<span><br>
&gt;<br>
&gt; I vote for focusing on existing driver improvements instead of looking=
 for<br>
&gt; excuses for keeping driver that shouldn&#39;t be added in the first pl=
ace.<br>
&gt; Jon seems to be already working on this, I&#39;m willing to help him, =
I&#39;m<br>
&gt; sure we<br>
&gt; can get you a proper support for the next merge window.<br>
<br>
</span>Fair enough, I dropped Dhanajay&#39;s changes (&quot;ARM: dts: NSP: =
Add USB nodes<br>
for Northstar Plus&quot;) from devicetree/next so you and Jon can figure ou=
t<br>
what is the best thing to move forward and we minimize the amount of<br>
incompatible DT stuff to be sorted out later on. So as far as I am<br>
concerned, there are no board/SoC DTS changes to be patched later on, we<br=
>
could re-apply this patch as-is, or we could have to define a new binding.<=
br>
<span class=3D"gmail-m_6954105614134943765HOEnZb"><font color=3D"#888888">-=
-<br>
Florian<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra"><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Per the discussi=
on with Rafal, this is acceptable</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Acked-by: Jon Mason &lt;<a href=3D"mailto:jon.m=
ason@broadcom.com">jon.mason@broadcom.com</a>&gt;</div><div class=3D"gmail_=
extra"><br></div></div></div>

--001a11439ad4a5f7650548222abe--
