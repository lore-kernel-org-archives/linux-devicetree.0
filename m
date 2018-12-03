From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: phy-qcom-qmp: Move #clock-cells to child
Date: Mon, 03 Dec 2018 14:37:24 -0800
Message-ID: <154387664448.88331.2728522404504674597@swboyd.mtv.corp.google.com>
References: <20181129221357.67417-1-evgreen@chromium.org>
 <20181129221357.67417-2-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129221357.67417-2-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2018-11-29 14:13:54)
> The phy-qcom-qmp bindings specified #clock-cells as 1. This was never used
> because of_clk_add_provider() was never called, so there was no way anybo=
dy
> could reference these clocks from DT. Furthermore, even if they could be
> accessed, the bindings never specified what should go in that additional
> cell.
> =

> Fix these incomplete and broken bindings. Move the #clock-cells into the
> child node, since that is the actual clock provider, and not all
> instances of qcom-qmp-phy are clock providers. Also set #clock-cells to
> zero, since there's nothing to pass to it.
> =

> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
