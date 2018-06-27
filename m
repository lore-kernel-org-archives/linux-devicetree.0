From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v7 2/4] phy: General struct and field cleanup
Date: Wed, 27 Jun 2018 13:17:42 -0700
Message-ID: <CAE=gft64dGEMi5QTCzKp7Eg9T=QDL3SbohiAuZBFJkeiOZK3og@mail.gmail.com>
References: <20180619083647.10116-1-cang@codeaurora.org> <20180619083647.10116-3-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619083647.10116-3-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cang@codeaurora.org
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2018 at 1:38 AM Can Guo <cang@codeaurora.org> wrote:
>
> Move MSM8996 specific PHY vreg list struct name to a genernal one as it is
> used by all PHYs. Add a specific field to handle dual lane situation.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>

I'm not a PHY expert, so I can't say much about the mechanics or
ramifications of the is_dual_lane_phy change is, but for at least the
sanity of the patch, here's my tag:
Reviewed-by: Evan Green <evgreen@chromium.org>
