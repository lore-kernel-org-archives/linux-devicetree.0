From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v3 6/6] phy: qcom-qusb2: Add QUSB2 PHYs support for sdm845
Date: Tue, 27 Mar 2018 17:34:36 +0000
Message-ID: <CAE=gft72pBOvN+pHYL1LHzLbj-EifZo0+yiFc=kABHj=iOM+2A@mail.gmail.com>
References: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org> <1521785487-29866-7-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521785487-29866-7-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, vivek.gautam@codeaurora.org, sboyd@codeaurora.org, krzk@kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 22, 2018 at 11:12 PM Manu Gautam <mgautam@codeaurora.org> wrote:

> There are two QUSB2 PHYs present on sdm845. Update PHY
> registers programming for both the PHYs related to
> electrical parameters to improve eye diagram.

> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 39
+++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)


Reviewed-by: Evan Green <evgreen@chromium.org>
