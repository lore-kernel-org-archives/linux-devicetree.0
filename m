From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 7/7] arm64: dts: mt8173: Add subsystem clock controller device nodes
Date: Mon, 27 Jul 2015 03:21:01 -0700 (PDT)
Message-ID: <24796517.2pfRdOOmRJ@ubix>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com> <CAGS+omAUAHZUJQMnWJbH7NXB_Etp=OF3dWyMB7Ri1+rAyzyPBg@mail.gmail.com> <1437965782.5614.4.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437965782.5614.4.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, July 27, 2015 10:56:22 AM James Liao wrote:
> Hi Daniel,
> 
> On Fri, 2015-07-24 at 19:32 +0800, Daniel Kurtz wrote:
> > > @@ -88,6 +88,13 @@
> > > 
> > >                 #clock-cells = <0>;
> > >         
> > >         };
> > > 
> > > +       cpum_ck: dummy_clk {
> > 
> > I'm not a big fan of this "dummy_clk".
> > The 'name' part of the devicetree node is supposed to be generic.
> > So, perhaps just oscillator@2, and move it down below clk32k:
> > oscillator@1.
> 
> > Otherwise:
> cpum_ck is a test clock which only available in IC test. It's empty on
> MT8173 evaluation or production boards. Should we name this kind of
> empty clock as an oscillator? Or is there a better name for it?
> 

So if it will never be part of any available boards, why do you want to add 
it?

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
