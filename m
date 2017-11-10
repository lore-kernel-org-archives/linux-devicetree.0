From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/1] add rgb888 pins to a20 to enable
 parallel rgb LCD
Date: Fri, 10 Nov 2017 09:05:59 +0800
Message-ID: <a57155315f2d5791b629e03240265e2e@aosc.io>
References: <1510058999-6778-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171107130331.4wut5g6znzakkg4z@flea>
 <65694f1d-e1cb-08e0-0883-f0087f5e09f5@micronovasrl.com>
 <20171108105623.zzabmqd3a3sehg2k@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB7PWSPIAKGQE2EOCCVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171108105623.zzabmqd3a3sehg2k-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-11-08 18:56=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> Hi,
>=20
> On Tue, Nov 07, 2017 at 05:38:55PM +0100, Giulio Benetti wrote:
>> Board could be any with A20,
>> for example Olinuxino A20.
>> Or our Q027, S027 boards, but final dts still are not complete.
>=20
> Therefore no upstream boards are using it right now, so we'll merge it
> when that will be the case.

I think the LCD connector on Banana Pi's uses parallel interface,
although the LCD should be an external DT overlay.

>=20
> Maxime
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
