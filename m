From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/3] firmware: qcom: scm: Improve clock handling
Date: Thu, 30 Aug 2018 18:07:58 -0700
Message-ID: <153567767852.93865.5427679731919930718@swboyd.mtv.corp.google.com>
References: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Sricharan R <sricharan@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-08-29 16:15:02)
> We're currently facing the issue that every new platform requires the add=
ition
> of a compatible to the DT binding as well as the driver.
> =

> The DT binding patch to allow us to use qcom,scm for all these new platfo=
rms
> that doesn't require any clocks and the driver is reworked to make the qc=
om,scm
> still pick up specified clocks in this case but won't require them.
> =

> This makes it possible to add new platforms by simply add the new compati=
ble to
> the list in the DT binding, but no changes needs to be done in the driver.
> Which is what is done in patch 3.
> =


I still think it may be even simpler to move to the "get all the clks"
API and then stop caring completely. Any reason to not do that?
