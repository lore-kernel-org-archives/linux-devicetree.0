From: Thomas Kaiser <thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Date: Sun, 22 Nov 2015 13:12:41 -0800 (PST)
Message-ID: <6cdff23b-6ebf-41f4-b1f7-0b94abbdb003@googlegroups.com>
References: <1448046713-13579-1-git-send-email-hdegoede@redhat.com>
 <jwvy4drz1qz.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
Reply-To: thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_443_1752676550.1448226761367"
Return-path: <linux-sunxi+bncBDQ6N3ODDQIMVX6IWICRUBGOIPAHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <jwvy4drz1qz.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi-mXXj517/zsQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_443_1752676550.1448226761367
Content-Type: multipart/alternative;
	boundary="----=_Part_444_925818351.1448226761368"

------=_Part_444_925818351.1448226761368
Content-Type: text/plain; charset=UTF-8

Stefan Monnier wrote:
>
> When I looked for a DTS file for this board, I was told that the 
> bananapi DTS works just fine


Nope, there are some differences already outlined in the wiki (eg. powering 
of a connected SATA disk is AXP209's job -- unless you pull pin PB3 the PMU 
won't supply the disk with power).

The device tree people use in the wild for over half a year with working 
SATA disk and switch can also be found in the 
wiki: http://linux-sunxi.org/Lamobo_R1#Mainline_kernel

Unless the patches there for the switch won't also be applied networking is 
pretty useless. And the R1 still suffers from lousy GMAC throughput 
compared to other A20 devices (maybe a driver issue).

Regards,

Thomas

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_444_925818351.1448226761368
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Stefan Monnier wrote:<blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left=
: 1ex;">When I looked for a DTS file for this board, I was told that the
<br>bananapi DTS works just fine</blockquote><div><br></div><div>Nope, ther=
e are some differences already outlined in the wiki (eg. powering of a conn=
ected SATA disk is AXP209&#39;s job -- unless you pull pin PB3 the PMU won&=
#39;t supply the disk with power).</div><div><br></div><div>The device tree=
 people use in the wild for over half a year with working SATA disk and swi=
tch can also be found in the wiki:=C2=A0http://linux-sunxi.org/Lamobo_R1#Ma=
inline_kernel</div><div><br></div><div>Unless the patches there for the swi=
tch won&#39;t also be applied networking is pretty useless. And the R1 stil=
l suffers from lousy GMAC throughput compared to other A20 devices (maybe a=
 driver issue).</div><div><br></div><div>Regards,</div><div><br></div><div>=
Thomas</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_444_925818351.1448226761368--

------=_Part_443_1752676550.1448226761367--
