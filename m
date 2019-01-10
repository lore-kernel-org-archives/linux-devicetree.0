From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip points to cpufreq
Date: Wed, 09 Jan 2019 16:28:18 -0800
Message-ID: <154708009884.15366.3039982038291126570@swboyd.mtv.corp.google.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org> <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, viresh.kumar@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-01-09 16:00:56)
> Since the big and little cpus are in the same frequency domain, use all

Oh? I thought the big and little cpus were in different frequency
domains and voltage domains. Maybe that's what you're saying here but
I'm misunderstanding. So change the wording a bit to be more clear?

> of them for mitigation in the cooling-map. At the lower trip points we
> restrict ourselves to throttling only a few OPPs. At higher trip
> temperatures, allow ourselves to be throttled to any extent.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
