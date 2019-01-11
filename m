From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v11 1/9] dt-bindings: opp: Introduce opp-level bindings
Date: Fri, 11 Jan 2019 11:06:04 -0800
Message-ID: <154723356455.169631.14468856077074543422@swboyd.mtv.corp.google.com>
References: <20190110040209.6028-1-rnayak@codeaurora.org> <20190110040209.6028-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110040209.6028-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-01-09 20:02:01)
> Add opp-level as an additional property in the OPP node to describe
> the performance level of the device.
>=20
> On some SoCs (especially from Qualcomm and MediaTek) this value
> is communicated to a remote microprocessor by the CPU, which
> then takes some actions (like adjusting voltage values across various
> rails) based on the value passed.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
