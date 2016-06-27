From: "'Ben Dooks' via rtc-linux" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: RTC support for AMlogic devies
Date: Mon, 27 Jun 2016 18:32:55 +0100
Message-ID: <CANe6Qb-aSSigiY_oC7=avLZ=0yhEFFwkMi+sLiaRJKNFnmetRA@mail.gmail.com>
References: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
	<m2bn2mtut1.fsf@baylibre.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a114a6a7223fd33053645e9ba
Return-path: <rtc-linux+bncBDHIF2NA5EJBBSGGYW5QKGQEVOBC22A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <m2bn2mtut1.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--001a114a6a7223fd33053645e9ba
Content-Type: text/plain; charset=UTF-8

I will check later. I think the issue is the dt patches require the reset
controller patches. The driver itself should compile fine
On 27 Jun 2016 6:18 p.m., "Kevin Hilman" <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:

> Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> writes:
>
> > This series is support for the RTC block on some of the AMLogic
> > Meson ARM SoCs.
> >
> > The first patch is the driver, followed by device-tree patches
> > and enablement for the ODRoid-C1 (where it has been tested)
>
> In the cover letter, please be explicit about any dependencies that are
> not upstream.  This series applies to mainline (v4.7-rc*) but does not
> build.  I tested it with my v4.7/integ branch and it seems to work.
>
> The series also has a handful of checkpatch warnings that should be
> addressed (see: http://hastebin.com/tacurokasu.pas)
>
> Other than that, I gave it a quick spin on meson8b-odroidc1 using
> tools/testing/selftests/timers/rtctest.c, and the basic time stuff seems
> to be working:
>
> / # ./rtctest
>
>                         RTC Driver Test Example.
>
>
> ...Update IRQs not supported.
>
>
> Current RTC date/time is 27-6-2016, 00:01:41.
> RTC_ALM_READ ioctl: Invalid argument
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a114a6a7223fd33053645e9ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I will check later. I think the issue is the dt patches requ=
ire the reset controller patches. The driver itself should compile fine</p>
<div class=3D"gmail_quote">On 27 Jun 2016 6:18 p.m., &quot;Kevin Hilman&quo=
t; &lt;<a href=3D"mailto:khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org">khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org</a>&gt;=
 wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ben Dooks &l=
t;<a href=3D"mailto:ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org">ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org</a=
>&gt; writes:<br>
<br>
&gt; This series is support for the RTC block on some of the AMLogic<br>
&gt; Meson ARM SoCs.<br>
&gt;<br>
&gt; The first patch is the driver, followed by device-tree patches<br>
&gt; and enablement for the ODRoid-C1 (where it has been tested)<br>
<br>
In the cover letter, please be explicit about any dependencies that are<br>
not upstream.=C2=A0 This series applies to mainline (v4.7-rc*) but does not=
<br>
build.=C2=A0 I tested it with my v4.7/integ branch and it seems to work.<br=
>
<br>
The series also has a handful of checkpatch warnings that should be<br>
addressed (see: <a href=3D"http://hastebin.com/tacurokasu.pas" rel=3D"noref=
errer" target=3D"_blank">http://hastebin.com/tacurokasu.pas</a>)<br>
<br>
Other than that, I gave it a quick spin on meson8b-odroidc1 using<br>
tools/testing/selftests/timers/rtctest.c, and the basic time stuff seems<br=
>
to be working:<br>
<br>
/ # ./rtctest<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 RTC Driver Test Example.<br>
<br>
<br>
...Update IRQs not supported.<br>
<br>
<br>
Current RTC date/time is 27-6-2016, 00:01:41.<br>
RTC_ALM_READ ioctl: Invalid argument<br>
<br>
<br>
<br>
_______________________________________________<br>
linux-amlogic mailing list<br>
<a href=3D"mailto:linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org">linux-amlogic-IAPFreCvJWM@public.gmane.org=
fradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-amlogic" rel=
=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/listin=
fo/linux-amlogic</a><br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to &quot;rtc-linux&quo=
t;.<br />
Membership options at <a href=3D"http://groups.google.com/group/rtc-linux">=
http://groups.google.com/group/rtc-linux</a> .<br />
Please read <a href=3D"http://groups.google.com/group/rtc-linux/web/checkli=
st">http://groups.google.com/group/rtc-linux/web/checklist</a><br />
before submitting a driver.<br />
--- <br />
You received this message because you are subscribed to the Google Groups &=
quot;rtc-linux&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">rtc-linux=
+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a114a6a7223fd33053645e9ba--
