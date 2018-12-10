From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 2/8] drm/msm/dsi: 28nm 8960 PHY: Get ref clock from the DT
Date: Mon, 10 Dec 2018 07:47:08 -0800
Message-ID: <154445682870.17204.3423155526165233895@swboyd.mtv.corp.google.com>
References: <20181204224234.62619-1-mka@chromium.org> <20181204224234.62619-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204224234.62619-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Airlie <airlied@linux.ie>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-12-04 14:42:28)
> Get the ref clock of the PHY from the device tree instead of
> hardcoding its name and rate.
>=20
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
