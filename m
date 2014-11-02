From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Sun, 2 Nov 2014 10:27:46 -0500
Message-ID: <CAKON4Ozq4BKRA74QHubVOkNb_g3hjDRsm4N0eX1_OjdRY8crNg@mail.gmail.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
	<544F737A.7000109@ti.com>
	<CAL_JsqJ2JRg7k21CEVe4-At7enD+y3TN_7wfqhY0OHZm-_j17w@mail.gmail.com>
	<544F7E5D.60104@redhat.com>
	<5450CAA5.5020205@ti.com>
	<CAL_JsqKWqq+H5ymUW3n8tkmLJHEUGaKDLX5+orJmGUQ3ECQwUQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a11c3f10643335b0506e1dfdb
Return-path: <linux-sunxi+bncBC55LFUF6ALBB4423GRAKGQEZ2RUOCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAL_JsqKWqq+H5ymUW3n8tkmLJHEUGaKDLX5+orJmGUQ3ECQwUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--001a11c3f10643335b0506e1dfdb
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 31, 2014 at 4:47 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Wed, Oct 29, 2014 at 7:08 PM, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> wrote:
> > Hi Hans, Rob,
> >
> > On 28/10/14 13:30, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 10/28/2014 12:11 PM, Rob Herring wrote:
> >
> >>> Yes, I object to the binding still as it has not changed from what was
> >>> previously posted.
> >>
> >> It would be helpful if you could explain why you object. Last time you
> >> said: " You are mixing in a hardware description that is simply
> inaccurate."
> >>
> >> I then explained that this is not hardware description, but runtime
> state
> >> information, as it tells the kernel which clocks were chosen to drive
> the
> >> display (out of typically a list of possible options, depending on which
> >> output is used, etc.). Just like which memory address the bootloader has
> >> chosen to scan out the video image from.
> >>
> >> Then you got quiet, so sorry, but this time your objection really is too
> >> late. You cannot simply go quiet halfway through a discussion and then
> pop
> >> up again when a new version is posted to say "I object" yet another
> time,
> >> you've had your chance to make your arguments last time, and chose to
> stay
> >> quiet after I explained in detail that this is not hardware description
> but
> >> state information, so now it is simply too late.
> >>
> >> These bindings have been discussed at Plumbers with various interested
> people
> >> present, and the conclusion was that this really is the best way to
> handle this,
> >> so this patch is:
> >>
> >>     Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>     Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>     Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> >>     Reviewed-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>
> >> And David Herrman who is working on simpledrm, which will be merged
> soon, which
> >> will also use the simplefb bindings also agrees. So we have the
> simplefb maintainer,
> >> simpledrm maintainer, and the clk subsystem maintainer + 2 other
> maintainers all
> >> agreeing on a way forward, the time for bikeshedding now really really
> really is
> >> over.
> >>
> >> Tomi, can you please let us know how you plan to proceed with this ?
> >
> > I won't merge DT bindings via fbdev tree, if a DT maintainer says no.
> >
> > I took Rob's silence to the earlier series as a silent ack for your
> > explanation. Obviously that was not the case.
> >
> > Rob, please advice asap what should be done to the bindings to get your
> > ack. As Hans explained above, this discussion has been going on for a
> > long time, and afaik this series is the best way forward of all the
> > options discussed.
>
> I still think for the most part this is a kernel problem. It is a
> kernel policy to turn off unused clocks. The clock framework could
> just as easily decide that any clocks enabled at boot and left
> un-managed (i.e. w/o a driver) are kept on until they are managed. I'm
> not saying this can't be in DT, only that DT is not the only solution
> here. This problem is not unique to simplefb. A serial console could
> stop working if no serial driver is loaded before unused clocks are
> disabled. CPU core clocks have a similar issue as well (often enabled
> in platform code). I want to see this solved in a generic way for any
> clock.
>

I am in agreement this point of view. This is a problem in the Linux
kernel. It is not a generic problem.

The Linux problem is that during boot device drivers are loaded in two
phases - built-in and loadable modules. The clock-regulator clean up is
happening too early. It happens after the built-in drivers load and before
the loadable modules have a chance to load. That's simply the wrong place
for that clean up happen.  A simple alternative would be to make a tiny
loadable module that triggers the clean up. Then adjust your boot scripts
to load this module after the other ones have loaded. But instead of fixing
this simple timing flaw in the Linux boot process a complex mechanism is
being created to work around it.

Simplefb is also being developed as a way of protecting the BIOS setup of
the framebuffer past the boot process and out into use as a normal user
space console.  I in no way support this use. We have experienced decades
of problems on the x86 with VGA and BIOSes that I do not wish to repeat in
the ARM world. Write a correct, device specific framebuffer driver for this
piece of hardware. That device specific driver will load before the
clock/regulator cleanup and claim all of the correct resources.



>
> As regulators were also mentioned, they already have a
> "regulator-boot-on" property defined. Perhaps this is suitable to be
> mirrored for clocks. If it is not, then I'm wondering why we have it.
> A key difference here is that the property is part of the provider and
> can be dealt with in the clock driver rather than requiring a
> temporary driver.
>
> Rob
>
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
>



-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a11c3f10643335b0506e1dfdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Oct 31, 2014 at 4:47 PM, Rob Herring <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">robherring2-Re5JQEeQqe8@public.gmane.org=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOE=
nZb"><div class=3D"h5">On Wed, Oct 29, 2014 at 7:08 PM, Tomi Valkeinen &lt;=
<a href=3D"mailto:tomi.valkeinen-l0cyMroinI0@public.gmane.org">tomi.valkeinen-l0cyMroinI0@public.gmane.org</a>&gt; wrot=
e:<br>
&gt; Hi Hans, Rob,<br>
&gt;<br>
&gt; On 28/10/14 13:30, Hans de Goede wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On 10/28/2014 12:11 PM, Rob Herring wrote:<br>
&gt;<br>
&gt;&gt;&gt; Yes, I object to the binding still as it has not changed from =
what was<br>
&gt;&gt;&gt; previously posted.<br>
&gt;&gt;<br>
&gt;&gt; It would be helpful if you could explain why you object. Last time=
 you<br>
&gt;&gt; said: &quot; You are mixing in a hardware description that is simp=
ly inaccurate.&quot;<br>
&gt;&gt;<br>
&gt;&gt; I then explained that this is not hardware description, but runtim=
e state<br>
&gt;&gt; information, as it tells the kernel which clocks were chosen to dr=
ive the<br>
&gt;&gt; display (out of typically a list of possible options, depending on=
 which<br>
&gt;&gt; output is used, etc.). Just like which memory address the bootload=
er has<br>
&gt;&gt; chosen to scan out the video image from.<br>
&gt;&gt;<br>
&gt;&gt; Then you got quiet, so sorry, but this time your objection really =
is too<br>
&gt;&gt; late. You cannot simply go quiet halfway through a discussion and =
then pop<br>
&gt;&gt; up again when a new version is posted to say &quot;I object&quot; =
yet another time,<br>
&gt;&gt; you&#39;ve had your chance to make your arguments last time, and c=
hose to stay<br>
&gt;&gt; quiet after I explained in detail that this is not hardware descri=
ption but<br>
&gt;&gt; state information, so now it is simply too late.<br>
&gt;&gt;<br>
&gt;&gt; These bindings have been discussed at Plumbers with various intere=
sted people<br>
&gt;&gt; present, and the conclusion was that this really is the best way t=
o handle this,<br>
&gt;&gt; so this patch is:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Hans de Goede &lt;<a href=3D"mai=
lto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Mike Turquette &lt;<a href=3D"mail=
to:mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Acked-by: Geert Uytterhoeven &lt;<a href=3D"mai=
lto:geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org">geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Maxime Ripard &lt;<a href=3D"mailt=
o:maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org">maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org</a>&gt=
;<br>
&gt;&gt;<br>
&gt;&gt; And David Herrman who is working on simpledrm, which will be merge=
d soon, which<br>
&gt;&gt; will also use the simplefb bindings also agrees. So we have the si=
mplefb maintainer,<br>
&gt;&gt; simpledrm maintainer, and the clk subsystem maintainer + 2 other m=
aintainers all<br>
&gt;&gt; agreeing on a way forward, the time for bikeshedding now really re=
ally really is<br>
&gt;&gt; over.<br>
&gt;&gt;<br>
&gt;&gt; Tomi, can you please let us know how you plan to proceed with this=
 ?<br>
&gt;<br>
&gt; I won&#39;t merge DT bindings via fbdev tree, if a DT maintainer says =
no.<br>
&gt;<br>
&gt; I took Rob&#39;s silence to the earlier series as a silent ack for you=
r<br>
&gt; explanation. Obviously that was not the case.<br>
&gt;<br>
&gt; Rob, please advice asap what should be done to the bindings to get you=
r<br>
&gt; ack. As Hans explained above, this discussion has been going on for a<=
br>
&gt; long time, and afaik this series is the best way forward of all the<br=
>
&gt; options discussed.<br>
<br>
</div></div>I still think for the most part this is a kernel problem. It is=
 a<br>
kernel policy to turn off unused clocks. The clock framework could<br>
just as easily decide that any clocks enabled at boot and left<br>
un-managed (i.e. w/o a driver) are kept on until they are managed. I&#39;m<=
br>
not saying this can&#39;t be in DT, only that DT is not the only solution<b=
r>
here. This problem is not unique to simplefb. A serial console could<br>
stop working if no serial driver is loaded before unused clocks are<br>
disabled. CPU core clocks have a similar issue as well (often enabled<br>
in platform code). I want to see this solved in a generic way for any<br>
clock.<br></blockquote><div><br></div><div>I am in agreement this point of =
view. This is a problem in the Linux kernel. It is not a generic problem.=
=C2=A0</div><div><br></div><div>The Linux problem is that during boot devic=
e drivers are loaded in two phases - built-in and loadable modules. The clo=
ck-regulator clean up is happening too early. It happens after the built-in=
 drivers load and before the loadable modules have a chance to load. That&#=
39;s simply the wrong place for that clean up happen.=C2=A0 A simple altern=
ative would be to make a tiny loadable module that triggers the clean up. T=
hen adjust your boot scripts to load this module after the other ones have =
loaded. But instead of fixing this simple timing flaw in the Linux boot pro=
cess a complex mechanism is being created to work around it.</div><div><br>=
</div><div>Simplefb is also being developed as a way of protecting the BIOS=
 setup of the framebuffer past the boot process and out into use as a norma=
l user space console.=C2=A0 I in no way support this use. We have experienc=
ed decades of problems on the x86 with VGA and BIOSes that I do not wish to=
 repeat in the ARM world. Write a correct, device specific framebuffer driv=
er for this piece of hardware. That device specific driver will load before=
 the clock/regulator cleanup and claim all of the correct resources.</div><=
div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
As regulators were also mentioned, they already have a<br>
&quot;regulator-boot-on&quot; property defined. Perhaps this is suitable to=
 be<br>
mirrored for clocks. If it is not, then I&#39;m wondering why we have it.<b=
r>
A key difference here is that the property is part of the provider and<br>
can be dealt with in the clock driver rather than requiring a<br>
temporary driver.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Rob<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi%2Bunsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux=
-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br>
For more options, visit <a href=3D"https://groups.google.com/d/optout" targ=
et=3D"_blank">https://groups.google.com/d/optout</a>.<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">Jon Smirl<br><a href=3D"mailto:jonsmirl@gmai=
l.com" target=3D"_blank">jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a></div>
</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a11c3f10643335b0506e1dfdb--
