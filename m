From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] ARM: dts: msm8974-hammerhead: Add regulator nodes for hammerhead
Date: Mon, 18 Jul 2016 21:12:13 +0200
Message-ID: <4129314.Hc5WdF5TEZ@wuerfel>
References: <20160717105208.9596-1-bshah@kde.org> <1957086.XgnIUz2uOJ@wuerfel> <20160718171155.GE13516@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160718171155.GE13516@tuxbot>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Bhushan Shah <bshah@kde.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday, July 18, 2016 10:11:55 AM CEST Bjorn Andersson wrote:
> On Mon 18 Jul 00:44 PDT 2016, Arnd Bergmann wrote:
> > On Sunday, July 17, 2016 8:44:01 PM CEST Bjorn Andersson wrote:
> > Ok, then how about this instead:
> > 
> > /smd/rpm/rpm_requests/pm8841-regulators {
> 
> The problem I have with this is that in the dtsi we have properties and
> other nodes under each one of these, hence we end up with completely
> different overall structure depending on if I look in the dtsi or the
> dts.
> 
> The problem I have with it in the dts is that we have properties and
> nodes under "smd" and "rpm_requests". So siblings are no longer grouped
> together.
> 
> 
> I have a hard time finding my way through flattened trees, often spread out
> over multiple files, that I need to puzzle together in my head. Perhaps
> there are better ways to keep this comprehensible, without maintaining
> the structure.
> 
> > 	s1 {
> > 		regulator-min-microvolt = <675000>;
> > 		regulator-max-microvolt = <1050000>;
> > 	};
> > 
> > 	...
> > };
> > 
> > That avoids the ridiculous intendation level but uses no labels.
> > 
> 
> I do share your dislike of the indentation level.
> 
> 
> I do have a few other concerns about style and scalability in other
> places. How about we follow how I've done this in the other files for
> now (i.e.  keep the structure of the patch as is) and sit down at LAS16
> to discuss what to do about this?

Fair enough, let's do that for now.

	Arnd
