From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 6/6] arm64: dts: Add rsc power domain for sdm845
Date: Thu, 05 Sep 2019 10:33:45 -0700
Message-ID: <5d7146fa.1c69fb81.8444a.8f49@mx.google.com>
References: <20190823081703.17325-1-mkshah@codeaurora.org> <20190823081703.17325-7-mkshah@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823081703.17325-7-mkshah@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bjorn.andersson@linaro.org, evgreen@chromium.org, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, ulf.hansson@linaro.org, Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Maulik Shah (2019-08-23 01:17:03)
> Add rsc power domain to enable sending sleep and wake votes
> using generic power domain infrastructure.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Can this be combined with the previous patch?
