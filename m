From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 14/15] arm: dts: qcom: Add missing OPP properties for CPUs
Date: Sat, 21 Jul 2018 13:56:04 -0500
Message-ID: <20180721185604.GI7404@hector.attlocal.net>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <9f9cc23d1fd17503c9056d62f7757fb9c412d1f9.1527244201.git.viresh.kumar@linaro.org>
 <CAHLCerN1Oxz3t53gxvK83A8jQswsPitgm_NjQ4CWB8V02R_LnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerN1Oxz3t53gxvK83A8jQswsPitgm_NjQ4CWB8V02R_LnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, arm@kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2018 at 03:52:26PM +0530, Amit Kucheria wrote:
> On Fri, May 25, 2018 at 4:02 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > The OPP properties, like "operating-points", should either be present
> > for all the CPUs of a cluster or none. If these are present only for a
> > subset of CPUs of a cluster then things will start falling apart as soon
> > as the CPUs are brought online in a different order. For example, this
> > will happen because the operating system looks for such properties in
> > the CPU node it is trying to bring up, so that it can create an OPP
> > table.
> >
> > Add such missing properties.
> >
> > Fix other missing property (clock latency) as well to make it all
> > work.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> FWIW,
> Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

Picking this up for 4.19.  thanks.

Andy
