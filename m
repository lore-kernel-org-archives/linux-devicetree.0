From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: sun8i: a83t: Add missing
 CPU clock references
Date: Mon, 1 Apr 2019 13:30:47 +0200
Message-ID: <20190401113047.uudhhl7zecdskfrb@core.my.home>
References: <20190328113159.9668-1-megous@megous.com>
 <20190328113159.9668-3-megous@megous.com>
 <20190401082242.ashnencaiubbidor@flea>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBB2PMQ7SQKGQE64TEECI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190401082242.ashnencaiubbidor@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Maxime,

On Mon, Apr 01, 2019 at 10:22:42AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Mar 28, 2019 at 12:31:59PM +0100, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > A83T DTSI has cpu clocks defined only on the first CPU in each cluster.
> > We can bring down any CPU in the cluster, so we need to define clock
> > for each CPU, so that the system knows what clock to use if the first
> > CPU is down.
> >
> > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > index 7a40b7d77ec0..1b0b025b9250 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > @@ -73,6 +73,8 @@
> >  		};
> >
> >  		cpu@1 {
> > +			clocks = <&ccu CLK_C0CPUX>;
> 
> Usually we'll have the compatible first

I'll re-order it.

> > +			clock-names = "cpu";
> 
> And that's not documented anywhere?

Cpufreq doesn't use CPU clock names, except for the mediatek cpufreq driver.

It's not docummented explicitly, except it's used as part of examples in
bindings/opp/opp.txt.

I guess I can safely drop it, but other will probably keep using it, because
it's part of the examples.

thank you and regards,
  Ondrej

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
