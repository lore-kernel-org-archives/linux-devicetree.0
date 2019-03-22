From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH] phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
Date: Fri, 22 Mar 2019 08:34:33 -0700
Message-ID: <CAE=gft5ZUHKQqYVL72_kojPr7vEUMY301gmGviCUVpBYdAoBDw@mail.gmail.com>
References: <20190226065919.22218-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226065919.22218-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Can Guo <cang@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 25, 2019 at 10:58 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> qcom_qmp_phy_init() is extended to support the additional register
> writes needed in PCS MISC and the appropriate sequences and resources
> are defined for SDM845.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

How badly does this conflict with my refactoring series at [1]? I
believe that series should be just about ready to go, do you want to
base your change on top of it?
-Evan

[1] https://lore.kernel.org/lkml/20190321171800.104681-1-evgreen@chromium.org/
