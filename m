From: Silvio Pellicano <8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] ARM: dts: sunxi: Add backlight node to
 q8 tablets
Date: Mon, 21 Dec 2015 02:56:32 -0800 (PST)
Message-ID: <fc4adcf5-4362-4d4c-b42e-729922c79f65@googlegroups.com>
References: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
Reply-To: 8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_4626_1791416691.1450695392835"
Return-path: <linux-sunxi+bncBDB4XENY4EMRBYNV36ZQKGQEWYFPFAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1442752251-20744-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_4626_1791416691.1450695392835
Content-Type: multipart/alternative;
	boundary="----=_Part_4627_1477629616.1450695392835"

------=_Part_4627_1477629616.1450695392835
Content-Type: text/plain; charset=UTF-8



> Here is a slightly updated version of Chen-Yu's backlight 
> patches, also adding support for the backlight found on A13 
> based q8 tablets. 
>

If i compile your dtsi with (obviously) pwm  support enable , backlight 
switch off after kernel start, 
if i disable pwm in menuconfig,it stay on, all seem correct (pwm on PB2 in 
original script.bin),
but there is somewhere a bug in pwm or dtsi description of backlight.

Silviop

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_4627_1477629616.1450695392835
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Here is a=
 slightly updated version of Chen-Yu&#39;s backlight
<br>patches, also adding support for the backlight found on A13=20
<br>based q8 tablets.
<br></blockquote><div><br>If i compile your dtsi with (obviously) pwm=C2=A0=
 support enable , backlight switch off after kernel start, <br>if i disable=
 pwm in menuconfig,it stay on, all seem correct (pwm on PB2 in original scr=
ipt.bin),<br>but there is somewhere a bug in pwm or dtsi description of bac=
klight.<br><br>Silviop<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_4627_1477629616.1450695392835--

------=_Part_4626_1791416691.1450695392835--
