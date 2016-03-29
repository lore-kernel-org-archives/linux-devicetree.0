From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/4] Add Rockchip RGA support
Date: Tue, 29 Mar 2016 14:13:26 +0100
Message-ID: <CACvgo50REvRxN2_qdw=2NeTTSgjpA+9c8OZgPE0q19meH6ArKA@mail.gmail.com>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com>
	<1571169.Hy8an0n7lM@diego>
	<CACvgo516ewfwGCpV=noX+re1x8t3Sp1t39Sha+A2-tQ5YsoihA@mail.gmail.com>
	<17189219.y56YqHz6yR@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17189219.y56YqHz6yR@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-rockchip <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28 March 2016 at 23:13, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:

> I have the feeling we're going quite a bit off-topic right now :-) .
> The binary-driver-crazyness, hasn't really anything to do with Yakir'=
s support
> for the RGA (which is about raster-graphics-acceleration, so 2d stuff=
).
>
> And me mentioning the armsoc-ddx was merely a means to allow some sor=
t of
> different userspace user, as requested in your original mail ;-) .
>
Seems like I forgot to state the obvious - for all the reasons
mentioned, the armsoc ddx seems like a bad example.

> Maybe you know a better use-case on where to demonstrate the viabilit=
y of the
> userspace API for it as originally requested.
I'm afraid that my RockChip-foo is extremely limited. Perhaps the
actual user of these should be mentioned ? xf86-video-rockhip (is
there one ?) or any other effort/project that lacks some (all?) of the
criticism listed.

(Sort of) the bottom line - either reuse the existing interfaces or
provide an approved, full blown userspace (libdrm demos/programs do
not count) that uses the new interfaces.

I haven't made these rules, just a fool^Wguy that repeats them so that
people don't abuse them much. If in doubt check with Dave and Daniel V
- they had enough repeating these.

-Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
