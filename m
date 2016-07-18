From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: msm8974-hammerhead: Add regulator nodes for hammerhead
Date: Mon, 18 Jul 2016 09:44:33 +0200
Message-ID: <1957086.XgnIUz2uOJ@wuerfel>
References: <20160717105208.9596-1-bshah@kde.org> <20160718033425.GB1966@archbox> <CAOCOHw5MNN9QAea1gJobpEHpn1S0=CTA3mEHzd+dVhv-GShYdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOCOHw5MNN9QAea1gJobpEHpn1S0=CTA3mEHzd+dVhv-GShYdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bhushan Shah <bshah-RoXCvvDuEio@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday, July 17, 2016 8:44:01 PM CEST Bjorn Andersson wrote:
> On Sun, Jul 17, 2016 at 8:34 PM, Bhushan Shah <bshah-RoXCvvDuEio@public.gmane.org> wrote:
> > On Sun, Jul 17, 2016 at 09:21:48PM +0200, Arnd Bergmann wrote:
> >> On Sunday, July 17, 2016 4:22:07 PM CEST Bhushan Shah wrote:
> >> > +
> >> > +       smd {
> >> > +               rpm {
> >> > +                       rpm_requests {
> >> > +                               pm8841-regulators {
> >> > +                                       s1 {
> >> > +                                               regulator-min-microvolt = <675000>;
> >> > +                                               regulator-max-microvolt = <1050000>;
> >> > +                                       };
> >>
> >> Maybe add a label at either the rpm_requests or the pm8841-regulators
> >> node so you can add properties in the leaf nodes withoutout having to
> >> specify the whole path?
> >
> > Sure, I will adjust patch.
> 
> Please don't. After running into several cases where this would end us
> up in having a multitude of nodes each describing just a snippet of
> each level we decided not to do so in the general case for the
> Qualcomm boards.
> 
> There are a few where we apparently ended up doing so anyways, but for
> all other cases of regulators we express the full tree in the dts, so
> please follow that so we don't mix the styles too much.

Ok, then how about this instead:

/smd/rpm/rpm_requests/pm8841-regulators {
	s1 {
		regulator-min-microvolt = <675000>;
		regulator-max-microvolt = <1050000>;
	};

	...
};

That avoids the ridiculous intendation level but uses no labels.

	Arnd



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
