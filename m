From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: a64: pinmux cleanups
Date: Mon, 3 Sep 2018 11:00:38 +0800
Message-ID: <CAGb2v651odpMn0LKYwP9WJjMZmzkBRyskaTWTaJ-YzJgB86EDQ@mail.gmail.com>
References: <20180828100132.12975-1-wens@csie.org> <20180828151140.7vc44czdlv4yhan2@flea>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZWHWLOAKGQETPCKEJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180828151140.7vc44czdlv4yhan2@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

n Tue, Aug 28, 2018 at 11:12 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Tue, Aug 28, 2018 at 06:01:29PM +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > This series does some cleanup of the Allwinner A64 pinmux groups.
> >
> > The first addresses a limitation on the A64 where we have the eMMC's
> > DS in always muxed in. The DS pin is shared with SPI0's MISO, thereby
> > preventing SPI0 from being used. In this patch we split out the DS
> > pin into a separate group for boards that actually utilize it to
> > select on their own.
> >
> > The other two patches just rename pinmux group node names and labels
> > from <func>_pins_<[a-z]> to <func>_<pingroup/pin names>_pins. The latter
> > is the style we adopted later on, and is easier to know which pins they
> > correspond to, i.e. easier to review.
> >
> > Please have a look.
>
> Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Applied.

> > While I want to do some more cleanup, I realized that the label and/or
> > node names might be used by distro (Armbian comes to mind) or personal
> > device tree overlay files. Do we need to have these remain fixed? Do
> > we or can we provide a fallback? (Is that even possible?)
>
> I wouldn't worry too much about this. We broke it a number of times
> already, and we probably will in the future for other stuff, I'm not
> sure we have to provide any guarantee there, as long as the old,
> compiled, dt still works.

OK :)
