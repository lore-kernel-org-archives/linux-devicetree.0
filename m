From: Bhushan Shah <bshah@kde.org>
Subject: Re: [PATCH 2/3] ARM: dts: msm8974-hammerhead: Add regulator nodes
 for hammerhead
Date: Mon, 18 Jul 2016 09:04:27 +0530
Message-ID: <20160718033425.GB1966@archbox>
References: <20160717105208.9596-1-bshah@kde.org>
 <20160717105208.9596-3-bshah@kde.org>
 <2913371.W2mXA8xjNE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2913371.W2mXA8xjNE@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 17, 2016 at 09:21:48PM +0200, Arnd Bergmann wrote:
> On Sunday, July 17, 2016 4:22:07 PM CEST Bhushan Shah wrote:
> > +
> > +       smd {
> > +               rpm {
> > +                       rpm_requests {
> > +                               pm8841-regulators {
> > +                                       s1 {
> > +                                               regulator-min-microvolt = <675000>;
> > +                                               regulator-max-microvolt = <1050000>;
> > +                                       };
> 
> Maybe add a label at either the rpm_requests or the pm8841-regulators
> node so you can add properties in the leaf nodes withoutout having to
> specify the whole path?

Sure, I will adjust patch.
> 	Arnd
