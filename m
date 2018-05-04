From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 6/7] dt-bindings: phy-qcom-usb2: Add support to
 override tuning values
Date: Fri, 4 May 2018 12:47:18 -0700
Message-ID: <CAD=FV=Ux+Ei0HE5FWnUrMBjWqh4ZVfobfbZfJTfKn54o4fmq5g@mail.gmail.com>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org> <1525295174-15995-7-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-7-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 2, 2018 at 2:06 PM, Manu Gautam <mgautam@codeaurora.org> wrote:
> To improve eye diagram for PHYs on different boards of same SOC,
> some parameters may need to be changed. Provide device tree
> properties to override these from board specific device tree
> files. While at it, replace "qcom,qusb2-v2-phy" with compatible
> string for USB2 PHY on sdm845 which was earlier added for
> sdm845 only.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 23 +++++++++++++-
>  include/dt-bindings/phy/phy-qcom-qusb2.h           | 37 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/phy/phy-qcom-qusb2.h

Thanks for adding the #defines, describing the defaults, and including
which SoCs the new properties work on.  This looks great to me now,
thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
