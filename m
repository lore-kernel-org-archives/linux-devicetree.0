From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/9] dt-bindings: phy: qcom-ufs: Add resets property
Date: Fri, 01 Feb 2019 09:41:30 -0800
Message-ID: <154904289035.169292.3983054171703334142@swboyd.mtv.corp.google.com>
References: <20190123221137.41722-1-evgreen@chromium.org> <20190123221137.41722-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123221137.41722-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2019-01-23 14:11:31)
> Add a resets property to the PHY that represents the PHY reset
> register in the UFS controller itself. This better describes the
> complete specification of the PHY, and allows the PHY to perform
> its initialization in a single function, rather than relying on
> back-channel sequencing of initialization through the PHY framework.
>=20
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
