From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: dt: Add a fall-back Raspberry Pi tree
Date: Mon, 25 Jan 2016 22:09:10 +0100
Message-ID: <1453756150.9375.18.camel@v3.sk>
References: <1453754394-3639-1-git-send-email-lkundrak@v3.sk>
	 <56A68BBF.4060405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56A68BBF.4060405-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2016-01-25 at 13:55 -0700, Stephen Warren wrote:
> On 01/25/2016 01:39 PM, Lubomir Rintel wrote:
> > U-Boot falls back to "bcm2835-rpi-other.dtb" for boards of unknown
> > identification. Let's do a bare minimum for them so that they at le=
at
> > boot.
> >=20
> > Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> > ---
> > =C2=A0 arch/arm/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 +
> > =C2=A0 arch/arm/boot/dts/bcm2835-rpi-other.dts | 7 +++++++
>=20
> This DT shouldn't ever be used, except when a new unidentified board=C2=
=A0
> appears. In that case, I believe the correct solution is to add suppo=
rt=C2=A0
> for that new board to U-Boot and the kernel, rather than add fall-bac=
ks.=C2=A0
> Prior to that being done, a user can always copy whichever DT they wa=
nt=C2=A0
> into filename bcm2835-rpi-other.dts for temporary testing/development=
,=C2=A0
> if they have reason to believe their new model is compatible with=C2=A0
> something else. In general, I don't think we have any reason to belie=
ve=C2=A0
> that even this new minimal DT is guaranteed to be compatible with any=
=C2=A0
> possible future hardware, so it seems a little risky to ship this fil=
e=C2=A0
> in anticipation.

=46air enough. It just frustrates me a bit that the chance of mainline
working on a new or even older RPi board is not as good as I'd like to.
I guess I could perhaps get a bit better at quickly submitting the
device tree instead of cheap hacks then.

By the way, I've seen you add an entry for the Zero board to U-Boot and
was thinking that you perhaps had a device tree for it? Do you plan to
include that one into mainline Linux, or do you keep your dts
elsewhere? Should I go ahead and submit one?

Also, the Model B entries in U-Boot version table seems incorrect to me
(sent a separate message to U-Boot list, but it got caught in
moderation now). I'm wondering what's the authoritative source for the
version information? Did you get the version numbers from the actual
hardware or is some documentation available?

Thanks,
Lubo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
