From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Date: Tue, 30 Jul 2019 15:49:51 -0700
Message-ID: <5d40c991.1c69fb81.7f6c2.028d@mx.google.com>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org> <20190501043734.26706-3-bjorn.andersson@linaro.org> <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com> <5ce6e0cd.1c69fb81.9a03e.0260@mx.google.com> <20190523190925.GU31438@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523190925.GU31438@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-05-23 12:09:25)
>=20
> I had to read through the clock code to conclude that this was indeed
> the design, so I'm happy with your patch of ensuring that this is
> followed. Perhaps add a statement in the kerneldoc for struct clk_hw as
> well to state that init won't be accessed past the return of
> clk_register.
>=20

I noticed that I had a branch for this that didn't go away this rebase.
I've thrown this on my todo list now.

I added the comment to the code, but I'm afraid I can't just merge this
patch to clk-next yet because various drivers access hw->init after
calling clk_register() and friends. I'll have to go through and find the
users by looking at git grep '->init' -- drivers/clk/ results. This is a
pain.
