From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: clk: Introduce 'protected-clocks' property
Date: Thu, 08 Nov 2018 10:11:46 -0800
Message-ID: <154170070630.88331.10123917683941164429@swboyd.mtv.corp.google.com>
References: <20181105194011.43770-1-swboyd@chromium.org>
 <20181105194011.43770-2-swboyd@chromium.org>
 <20181106010426.GX2523@minitux> <20181108054452.GD2337@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108054452.GD2337@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-11-07 21:44:52)
> On Mon 05 Nov 17:04 PST 2018, Bjorn Andersson wrote:
> =

> > On Mon 05 Nov 11:40 PST 2018, Stephen Boyd wrote:
> > =

> > > Add a generic clk property for clks which are not intended to be used=
 by
> > > the OS due to security restrictions put in place by firmware. For
> > > example, on some Qualcomm firmwares reading or writing certain clk
> > > registers causes the entire system to reboot, but on other firmwares
> > > reading and writing those same registers is required to make devices
> > > like QSPI work. Rather than adding one-off properties each time a new
> > > set of clks appears to be protected, let's add a generic clk property=
 to
> > > describe any set of clks that shouldn't be touched by the OS. This way
> > > we never need to register the clks or use them in certain firmware
> > > configurations.
> > > =

> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > =

> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > =

> =

> Gave this some additional thought. The way this is blacklisting
> protected clocks makes it impossible to be backwards compatible with an
> older DT while adding new protected clocks to an existing driver.
> =

> I don't have better suggestion for handling this and the problem should
> primarily be isolated to the beginning of the upstream life of a
> platform, so perhaps we can just ignore this issue?
> =


I don't have a better suggestion either besides listing all possible
clks in the binding and header file to start and then specifying any
clks that are known to not work when merging the dts bits. In the future
I think we can move dts and drivers in lockstep if certain drivers add
new clks and those cause problems on locked down systems. The
alternative seems worse, i.e. listing clks that should be added on the
unaffected platforms, so ignoring this issue sounds good for now.
