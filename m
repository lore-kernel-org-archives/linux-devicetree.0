From: Neal Peacock <kulimandphone3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Tue, 4 Nov 2014 22:36:14 -0500
Message-ID: <CAFXj5xgZQ3CM8+0uAob61Q296rQYnqjZPvQwK1JLS00zf1WKXw@mail.gmail.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
	<544F737A.7000109@ti.com>
	<CAL_JsqJ2JRg7k21CEVe4-At7enD+y3TN_7wfqhY0OHZm-_j17w@mail.gmail.com>
	<544F7E5D.60104@redhat.com>
	<5450CAA5.5020205@ti.com>
	<CAL_JsqKWqq+H5ymUW3n8tkmLJHEUGaKDLX5+orJmGUQ3ECQwUQ@mail.gmail.com>
	<CAKON4Oyw46zjq8QJNAFi9qWA9-6MpXtGavzVmXQT3SPqH=NpjQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=047d7bdca6e02c9b2e05071448bd
Return-path: <linux-sunxi+bncBDX3H6OJV4ERBL5W42RAKGQEPS6SCKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAKON4Oyw46zjq8QJNAFi9qWA9-6MpXtGavzVmXQT3SPqH=NpjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--047d7bdca6e02c9b2e05071448bd
Content-Type: text/plain; charset=UTF-8

On Nov 2, 2014 7:28 AM, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Fri, Oct 31, 2014 at 4:47 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:
> >
> > On Wed, Oct 29, 2014 at 7:08 PM, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
wrote:
> > > Hi Hans, Rob,
> > >
> > > On 28/10/14 13:30, Hans de Goede wrote:
> > >> Hi,
> > >>
> > >> On 10/28/2014 12:11 PM, Rob Herring wrote:
> > >
> > >>> Yes, I object to the binding still as it has not changed from what
was
> > >>> previously posted.
> > >>
> > >> It would be helpful if you could explain why you object. Last time
you
> > >> said: " You are mixing in a hardware description that is simply
inaccurate."
> > >>
> > >> I then explained that this is not hardware description, but runtime
state
> > >> information, as it tells the kernel which clocks were chosen to
drive the
> > >> display (out of typically a list of possible options, depending on
which
> > >> output is used, etc.). Just like which memory address the bootloader
has
> > >> chosen to scan out the video image from.
> > >>
> > >> Then you got quiet, so sorry, but this time your objection really is
too
> > >> late. You cannot simply go quiet halfway through a discussion and
then pop
> > >> up again when a new version is posted to say "I object" yet another
time,
> > >> you've had your chance to make your arguments last time, and chose
to stay
> > >> quiet after I explained in detail that this is not hardware
description but
> > >> state information, so now it is simply too late.
> > >>
> > >> These bindings have been discussed at Plumbers with various
interested people
> > >> present, and the conclusion was that this really is the best way to
handle this,
> > >> so this patch is:
> > >>
> > >>     Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >>     Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >>     Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> > >>     Reviewed-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > >>
> > >> And David Herrman who is working on simpledrm, which will be merged
soon, which
> > >> will also use the simplefb bindings also agrees. So we have the
simplefb maintainer,
> > >> simpledrm maintainer, and the clk subsystem maintainer + 2 other
maintainers all
> > >> agreeing on a way forward, the time for bikeshedding now really
really really is
> > >> over.
> > >>
> > >> Tomi, can you please let us know how you plan to proceed with this ?
> > >
> > > I won't merge DT bindings via fbdev tree, if a DT maintainer says no.
> > >
> > > I took Rob's silence to the earlier series as a silent ack for your
> > > explanation. Obviously that was not the case.
> > >
> > > Rob, please advice asap what should be done to the bindings to get
your
> > > ack. As Hans explained above, this discussion has been going on for a
> > > long time, and afaik this series is the best way forward of all the
> > > options discussed.
> >
> > I still think for the most part this is a kernel problem. It is a
> > kernel policy to turn off unused clocks. The clock framework could
> > just as easily decide that any clocks enabled at boot and left
> > un-managed (i.e. w/o a driver) are kept on until they are managed. I'm
> > not saying this can't be in DT, only that DT is not the only solution
> > here. This problem is not unique to simplefb. A serial console could
> > stop working if no serial driver is loaded before unused clocks are
> > disabled. CPU core clocks have a similar issue as well (often enabled
> > in platform code). I want to see this solved in a generic way for any
> > clock.
>
>
> I am in agreement this point of view. This is a problem in the Linux
> kernel. It is not a generic problem.
>
> The Linux problem is that during boot device drivers are loaded in two
> phases - built-in and loadable modules. The clock-regulator clean up
> is happening too early. It happens after the built-in drivers load and
> before the loadable modules have a chance to load. That's simply the
> wrong place for that clean up happen.  A simple alternative would be
> to make a tiny loadable module that triggers the clean up. Then adjust
> your boot scripts to load this module after the other ones have
> loaded. But instead of fixing this simple timing flaw in the Linux
> boot process a complex mechanism is being created to work around it.
>
> Simplefb is also being developed as a way of protecting the BIOS setup
> of the framebuffer past the boot process and out into use as a normal
> user space console.  I in no way support this use. We have experienced
> decades of problems on the x86 with VGA and BIOSes that I do not wish
> to repeat in the ARM world. Write a correct, device specific
> framebuffer driver for this piece of hardware. That device specific
> driver will load before the clock/regulator cleanup and claim all of
> the correct resources.
>
> >
> >
> > As regulators were also mentioned, they already have a
> > "regulator-boot-on" property defined. Perhaps this is suitable to be
> > mirrored for clocks. If it is not, then I'm wondering why we have it.
> > A key difference here is that the property is part of the provider and
> > can be dealt with in the clock driver rather than requiring a
> > temporary driver.

What if the hardware specific 'real' driver was a new driver that is
basically a wrapper of the simplefb but adding the clock. This seems to be
the only sunxi specific addition.

This would stand in until the 'real' driver is created. As far as I can
tell nothing about this setup would be wrong, so even if the real driver
never came in it wouldn't be a problem.

Is this a workable alternate solution?

> >
> > Rob
> >
> > --
> > You received this message because you are subscribed to the Google
Groups "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send
an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> > For more options, visit https://groups.google.com/d/optout.
>
>
>
>
> --
> Jon Smirl
> jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>
> --
> You received this message because you are subscribed to the Google Groups
"linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--047d7bdca6e02c9b2e05071448bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Nov 2, 2014 7:28 AM, &quot;<a href=3D"mailto:jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">jonsmir=
l@gmail.com</a>&quot; &lt;<a href=3D"mailto:jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">jonsmirl@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Oct 31, 2014 at 4:47 PM, Rob Herring &lt;<a href=3D"mailto:rob=
herring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Oct 29, 2014 at 7:08 PM, Tomi Valkeinen &lt;<a href=3D"ma=
ilto:tomi.valkeinen-l0cyMroinI0@public.gmane.org">tomi.valkeinen-l0cyMroinI0@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt; &gt; Hi Hans, Rob,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 28/10/14 13:30, Hans de Goede wrote:<br>
&gt; &gt; &gt;&gt; Hi,<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On 10/28/2014 12:11 PM, Rob Herring wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt;&gt; Yes, I object to the binding still as it has not cha=
nged from what was<br>
&gt; &gt; &gt;&gt;&gt; previously posted.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; It would be helpful if you could explain why you object.=
 Last time you<br>
&gt; &gt; &gt;&gt; said: &quot; You are mixing in a hardware description th=
at is simply inaccurate.&quot;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I then explained that this is not hardware description, =
but runtime state<br>
&gt; &gt; &gt;&gt; information, as it tells the kernel which clocks were ch=
osen to drive the<br>
&gt; &gt; &gt;&gt; display (out of typically a list of possible options, de=
pending on which<br>
&gt; &gt; &gt;&gt; output is used, etc.). Just like which memory address th=
e bootloader has<br>
&gt; &gt; &gt;&gt; chosen to scan out the video image from.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Then you got quiet, so sorry, but this time your objecti=
on really is too<br>
&gt; &gt; &gt;&gt; late. You cannot simply go quiet halfway through a discu=
ssion and then pop<br>
&gt; &gt; &gt;&gt; up again when a new version is posted to say &quot;I obj=
ect&quot; yet another time,<br>
&gt; &gt; &gt;&gt; you&#39;ve had your chance to make your arguments last t=
ime, and chose to stay<br>
&gt; &gt; &gt;&gt; quiet after I explained in detail that this is not hardw=
are description but<br>
&gt; &gt; &gt;&gt; state information, so now it is simply too late.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; These bindings have been discussed at Plumbers with vari=
ous interested people<br>
&gt; &gt; &gt;&gt; present, and the conclusion was that this really is the =
best way to handle this,<br>
&gt; &gt; &gt;&gt; so this patch is:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Hans de Goede &lt;<a h=
ref=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Mike Turquette &lt;<a hr=
ef=3D"mailto:mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Acked-by: Geert Uytterhoeven &lt;<a h=
ref=3D"mailto:geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org">geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org</a>&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Maxime Ripard &lt;<a hre=
f=3D"mailto:maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org">maxime.ripard@free-electrons.=
com</a>&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; And David Herrman who is working on simpledrm, which wil=
l be merged soon, which<br>
&gt; &gt; &gt;&gt; will also use the simplefb bindings also agrees. So we h=
ave the simplefb maintainer,<br>
&gt; &gt; &gt;&gt; simpledrm maintainer, and the clk subsystem maintainer +=
 2 other maintainers all<br>
&gt; &gt; &gt;&gt; agreeing on a way forward, the time for bikeshedding now=
 really really really is<br>
&gt; &gt; &gt;&gt; over.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Tomi, can you please let us know how you plan to proceed=
 with this ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I won&#39;t merge DT bindings via fbdev tree, if a DT mainta=
iner says no.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I took Rob&#39;s silence to the earlier series as a silent a=
ck for your<br>
&gt; &gt; &gt; explanation. Obviously that was not the case.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Rob, please advice asap what should be done to the bindings =
to get your<br>
&gt; &gt; &gt; ack. As Hans explained above, this discussion has been going=
 on for a<br>
&gt; &gt; &gt; long time, and afaik this series is the best way forward of =
all the<br>
&gt; &gt; &gt; options discussed.<br>
&gt; &gt;<br>
&gt; &gt; I still think for the most part this is a kernel problem. It is a=
<br>
&gt; &gt; kernel policy to turn off unused clocks. The clock framework coul=
d<br>
&gt; &gt; just as easily decide that any clocks enabled at boot and left<br=
>
&gt; &gt; un-managed (i.e. w/o a driver) are kept on until they are managed=
. I&#39;m<br>
&gt; &gt; not saying this can&#39;t be in DT, only that DT is not the only =
solution<br>
&gt; &gt; here. This problem is not unique to simplefb. A serial console co=
uld<br>
&gt; &gt; stop working if no serial driver is loaded before unused clocks a=
re<br>
&gt; &gt; disabled. CPU core clocks have a similar issue as well (often ena=
bled<br>
&gt; &gt; in platform code). I want to see this solved in a generic way for=
 any<br>
&gt; &gt; clock.<br>
&gt;<br>
&gt;<br>
&gt; I am in agreement this point of view. This is a problem in the Linux<b=
r>
&gt; kernel. It is not a generic problem.<br>
&gt;<br>
&gt; The Linux problem is that during boot device drivers are loaded in two=
<br>
&gt; phases - built-in and loadable modules. The clock-regulator clean up<b=
r>
&gt; is happening too early. It happens after the built-in drivers load and=
<br>
&gt; before the loadable modules have a chance to load. That&#39;s simply t=
he<br>
&gt; wrong place for that clean up happen.=C2=A0 A simple alternative would=
 be<br>
&gt; to make a tiny loadable module that triggers the clean up. Then adjust=
<br>
&gt; your boot scripts to load this module after the other ones have<br>
&gt; loaded. But instead of fixing this simple timing flaw in the Linux<br>
&gt; boot process a complex mechanism is being created to work around it.<b=
r>
&gt;<br>
&gt; Simplefb is also being developed as a way of protecting the BIOS setup=
<br>
&gt; of the framebuffer past the boot process and out into use as a normal<=
br>
&gt; user space console.=C2=A0 I in no way support this use. We have experi=
enced<br>
&gt; decades of problems on the x86 with VGA and BIOSes that I do not wish<=
br>
&gt; to repeat in the ARM world. Write a correct, device specific<br>
&gt; framebuffer driver for this piece of hardware. That device specific<br=
>
&gt; driver will load before the clock/regulator cleanup and claim all of<b=
r>
&gt; the correct resources.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; As regulators were also mentioned, they already have a<br>
&gt; &gt; &quot;regulator-boot-on&quot; property defined. Perhaps this is s=
uitable to be<br>
&gt; &gt; mirrored for clocks. If it is not, then I&#39;m wondering why we =
have it.<br>
&gt; &gt; A key difference here is that the property is part of the provide=
r and<br>
&gt; &gt; can be dealt with in the clock driver rather than requiring a<br>
&gt; &gt; temporary driver.</p>
<p dir=3D"ltr">What if the hardware specific &#39;real&#39; driver was a ne=
w driver that is basically a wrapper of the simplefb but adding the clock. =
This seems to be the only sunxi specific addition.</p>
<p dir=3D"ltr">This would stand in until the &#39;real&#39; driver is creat=
ed. As far as I can tell nothing about this setup would be wrong, so even i=
f the real driver never came in it wouldn&#39;t be a problem.</p>
<p dir=3D"ltr">Is this a workable alternate solution?<br></p>
<p dir=3D"ltr">&gt; &gt;<br>
&gt; &gt; Rob<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; You received this message because you are subscribed to the Googl=
e Groups &quot;linux-sunxi&quot; group.<br>
&gt; &gt; To unsubscribe from this group and stop receiving emails from it,=
 send an email to <a href=3D"mailto:linux-sunxi%2Bunsubscribe@googlegroups.=
com">linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br>
&gt; &gt; For more options, visit <a href=3D"https://groups.google.com/d/op=
tout">https://groups.google.com/d/optout</a>.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Jon Smirl<br>
&gt; <a href=3D"mailto:jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a><br>
&gt;<br>
&gt; --<br>
&gt; You received this message because you are subscribed to the Google Gro=
ups &quot;linux-sunxi&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
 an email to <a href=3D"mailto:linux-sunxi%2Bunsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">=
linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br>
&gt; For more options, visit <a href=3D"https://groups.google.com/d/optout"=
>https://groups.google.com/d/optout</a>.<br>
</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--047d7bdca6e02c9b2e05071448bd--
