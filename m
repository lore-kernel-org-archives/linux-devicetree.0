From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
Date: Fri, 07 Jun 2019 13:38:37 -0700
Message-ID: <20190607203838.1361E208C3@mail.kernel.org>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org> <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: david.brown@linaro.org, agross@kernel.org, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-05-21 07:52:28)
> On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> > The multimedia clock controller (mmcc) is the main clock controller for
> > the multimedia subsystem and is required to enable things like display =
and
> > camera.
>=20
> Stephen, I think this series is good to go, and I have display/gpu stuff =

> I'm polishing that will depend on this.  Would you kindly pickup patches =

> 1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 and 6.
>=20

If I apply patch 3 won't it break boot until patch 2 is also in the
tree? That seems to imply that I'll break bisection, and we have
kernelci boot testing clk-next so this will probably set off alarms
somewhere.

I thought we had some code that got removed that was going to make the
transition "seamless" in the sense that it would search the tree for an
RPM clk controller and then not add the XO fixed factor clk somehow.
See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
clocks") for the code that we removed. So ideally we do something like
this too, but now we search for a property on the calling node to see if
the XO clk is there?
