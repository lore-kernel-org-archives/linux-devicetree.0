From: =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v3 15/16] ARM: dts: sun8i: h3: Enable HDMI
 output on H3 boards
Date: Mon, 05 Mar 2018 20:43:00 +0000
Message-ID: <7f34f281-fa61-44b4-60a0-fa4843bc27c1@iki.fi>
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
 <20180301213442.16677-16-jernej.skrabec@siol.net>
 <57afe052-9a8c-f63b-ee43-5bad8cd1d193@iki.fi>
 <24923386.1anQU1Bm90@jernej-laptop>
Reply-To: joonas.kylmala-X3B1VOXEql0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDKPPPP3Z4PBBBOY63KAKGQEDZM3XCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <24923386.1anQU1Bm90@jernej-laptop>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jernej =C5=A0krabec:
> I guess that would mean also including connector node (hdmi_con_in) in DT=
SI,=20
> since it is referenced inside. However, not all boards have HDMI connecto=
r, so=20
> I didn't include it in DTSI.

You're absolutely right on this. I wish there was someway to get rid of
this duplication but that's a whole different problem to discuss.

Great work by the way!

Joonas

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
