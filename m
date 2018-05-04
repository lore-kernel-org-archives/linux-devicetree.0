From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 7/7] phy: qcom-qusb2: Add QUSB2 PHYs support for sdm845
Date: Fri, 4 May 2018 12:47:28 -0700
Message-ID: <CAD=FV=VGeCARsa0pooug9=y1GM1rNsmOLCP-EH1ar2o81AfcmA@mail.gmail.com>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org> <1525295174-15995-8-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-8-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 2, 2018 at 2:06 PM, Manu Gautam <mgautam@codeaurora.org> wrote:
> There are two QUSB2 PHYs present on sdm845. In order
> to improve eye diagram for both the PHYs some parameters
> need to be changed. Provide device tree properties to
> override these from board specific device tree files.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 126 +++++++++++++++++++++++++++++++---
>  1 file changed, 118 insertions(+), 8 deletions(-)

I confirmed that all my previous comments were fixed and this looks
nice to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
