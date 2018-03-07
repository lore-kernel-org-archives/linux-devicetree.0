Return-Path: <robherring2@gmail.com>
Date: Wed, 7 Mar 2018 16:45:03 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: add bindings for
 hi3798cv200-dw-mshc
Message-ID: <20180307224503.gyyegv2bx4fpnijl@rob-hp-laptop>
References: <1520319531-24661-1-git-send-email-shawn.guo@linaro.org>
 <1520319531-24661-2-git-send-email-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520319531-24661-2-git-send-email-shawn.guo@linaro.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, tianshuliang <tianshuliang@hisilicon.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 06, 2018 at 02:58:50PM +0800, Shawn Guo wrote:
> From: tianshuliang <tianshuliang@hisilicon.com>
> 
> Hisilicon hi3798cv200 SoC extends the dw-mshc controller
> for additional clock control. Add device tree bindings for
> hi3798cv200-dw-mshc.
> 
> Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../bindings/mmc/hi3798cv200-dw-mshc.txt           | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
