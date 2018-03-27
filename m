From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v3 2/6] phy: qcom-qusb2: Fix crash if nvmem cell not specified
Date: Tue, 27 Mar 2018 17:35:02 +0000
Message-ID: <CAE=gft67HuudBajKESOgZtgMz7owJqdoYPJp_6LpyB37a0-iYQ@mail.gmail.com>
References: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org> <1521785487-29866-3-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521785487-29866-3-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, stable@vger.kernel.org, vivek.gautam@codeaurora.org, jh80.chung@samsung.com, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 22, 2018 at 11:13 PM Manu Gautam <mgautam@codeaurora.org> wrote:

> Driver currently crashes due to NULL pointer deference
> while updating PHY tune register if nvmem cell is NULL.
> Since, fused value for Tune1/2 register is optional,
> we'd rather bail out.

> Fixes: ca04d9d3e1b1 ("phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom
chips")
> Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Cc: stable <stable@vger.kernel.org> # 4.14+
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++++
>   1 file changed, 4 insertions(+)


Reviewed-by: Evan Green <evgreen@chromium.org>
