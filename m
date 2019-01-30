From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: ufs: Add #reset-cells for Qualcomm
 controllers
Date: Wed, 30 Jan 2019 12:56:32 -0600
Message-ID: <20190130185632.GA23483@bogus>
References: <20190123221137.41722-1-evgreen@chromium.org>
 <20190123221137.41722-2-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190123221137.41722-2-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, liwei <liwei213@huawei.com>, linux-kernel@vger.kernel.org, Subhash Jadavani <subhashj@codeaurora.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 23 Jan 2019 14:11:29 -0800, Evan Green wrote:
> Enable Qualcomm UFS controllers to expose the PHY reset via a reset
> controller.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> 
> ---
> Fixing up this aspect of it made me notice that this patch [1]
> hasn't landed yet. It really ought to.
> 
> [1] https://lore.kernel.org/lkml/20181012213926.253765-1-dianders@chromium.org/T/#u
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
