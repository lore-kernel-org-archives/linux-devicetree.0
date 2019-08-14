From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 3/4] dt-bindings: soc: qcom: Add RSC power domain specifier
Date: Wed, 14 Aug 2019 11:02:07 -0700
Message-ID: <5d544ca0.1c69fb81.a98a7.19e1@mx.google.com>
References: <20190813082442.25796-1-mkshah@codeaurora.org> <20190813082442.25796-4-mkshah@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813082442.25796-4-mkshah@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bjorn.andersson@linaro.org, evgreen@chromium.org, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, ulf.hansson@linaro.org, Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Maulik Shah (2019-08-13 01:24:41)
> In addition to transmitting resource state requests to the remote
> processor, the RSC is responsible for powering off/lowering the
> requirements from CPUs subsystem for the associated hardware like
> buses, clocks, and regulators when all CPUs and cluster is powered down.
>=20
> The power domain is configured to a low power state and when all the
> CPUs are powered down, the RSC can lower resource state requirements
> and power down the rails that power the CPUs.
>=20
> Add PM domain specifier property for RSC controller.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
