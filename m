From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 00/10] Add power domain driver for corners on msm8996/sdm845
Date: Tue, 11 Dec 2018 13:51:54 -0800
Message-ID: <154456511414.17204.10860688288502708116@swboyd.mtv.corp.google.com>
References: <20181211094938.25086-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-11 01:49:28)
> Changes in v6:
> * OPP binding updates for qcom,level reviewed by Rob
> * DT bindings for rpmpd and rpmhpd updated to specify the
> OPP tables as child nodes of the power-controller itself
> * Removed some module specific remains from the drivers,
> now that they can only be built-in
> * Added a simple_opp_to_performance_state() helper

Is the idea that it can be squashed into the patches that use it by
reordering the series? But otherwise left at the end of the series to
make things simpler to merge without it?
