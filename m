From: Thomas Kaiser <Thomas.Kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Date: Tue, 24 Nov 2015 10:45:27 +0100
Message-ID: <D279EE2F.E5EF6%Thomas.Kaiser@kaiser-edv.de>
References: <1448046713-13579-1-git-send-email-hdegoede@redhat.com>
 <20151122195925.GR32142@lukather>
 <5652CE10.1020808@redhat.com>
Reply-To: thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="B_3531206750_4684923"
Return-path: <linux-sunxi+bncBDQ6N3ODDQINBY6QWICRUBA5GJGHO-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5652CE10.1020808-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3531206750_4684923
Content-type: text/plain; charset=UTF-8

Hi,

Hans de Goede wrote:

> The Lamobo-R1 has a gpio header idententical to the one found
> on the Banana Pi, i2c2 is routed to pins there.

That's the reason this header exists in this form and that's the reason
customers buy these boards that expose an 'RPi compatible' 26/40 pin GPIO
header. That applies also to the various Orange Pi's and other
$insert-your-favourite-fruit-here Pi  with different SoCs, eg.
Roseapple/Lemon Pi with Actions Semi's S500. Even boards that do not share
the RPi's naming scheme feature this GPIO header, eg. LeMaker's Guitar or
ODROID C1/C1+

Users expect this GPIO header being 'RPi compatible' regarding
hardware-Addons (RPi HATs), software support (each of the above boards has a
ported WiringPi lib) and tutorials they find on the net. Breaking this
compatibility with mainline kernel is not a good idea IMO.

Best regards,

Thomas


-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--B_3531206750_4684923
Content-type: text/html; charset=UTF-8
Content-transfer-encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; -webkit-line-break: after-white-space; color: rgb(0, 0, 0); font-si=
ze: 12px; font-family: Consolas, sans-serif;"><div>Hi,</div><div><br></div>=
<div>Hans de Goede wrote:</div><span id=3D"OLK_SRC_BODY_SECTION"><div><br><=
/div><blockquote id=3D"MAC_OUTLOOK_ATTRIBUTION_BLOCKQUOTE" style=3D"BORDER-=
LEFT: #b5c4df 5 solid; PADDING:0 0 0 5; MARGIN:0 0 0 5;"><div style=3D"colo=
r: rgb(0, 0, 0); font-family: Consolas; font-style: normal; font-variant: n=
ormal; font-weight: normal; letter-spacing: normal; line-height: normal; or=
phans: auto; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px;">The Lamobo-R1 has a gpio header idententical to the one found</div=
><div style=3D"color: rgb(0, 0, 0); font-family: Consolas; font-style: norm=
al; font-variant: normal; font-weight: normal; letter-spacing: normal; line=
-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; widows: auto; word-spacing: 0px; -webk=
it-text-stroke-width: 0px;">on the Banana Pi, i2c2 is routed to pins there.=
</div></blockquote></span><div><br></div><div>That's the reason this header=
 exists in this form and that's the reason customers buy these boards that =
expose an 'RPi compatible' 26/40 pin GPIO header. That applies also to the =
various Orange Pi's and other $insert-your-favourite-fruit-here Pi &nbsp;wi=
th different SoCs, eg. Roseapple/Lemon Pi with Actions Semi's S500. Even bo=
ards that do not share the RPi's naming scheme feature this GPIO header, eg=
. LeMaker's Guitar or ODROID C1/C1+</div><div><br></div><div>Users expect t=
his GPIO header being 'RPi compatible' regarding hardware-Addons (RPi HATs)=
, software support (each of the above boards has a ported WiringPi lib) and=
 tutorials they find on the net. Breaking this compatibility with mainline =
kernel is not a good idea IMO.</div><div><br></div><div>Best regards,</div>=
<div><br></div><div>Thomas</div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--B_3531206750_4684923--
