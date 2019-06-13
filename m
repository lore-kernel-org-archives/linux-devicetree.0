Return-Path: <robherring2@gmail.com>
Date: Thu, 13 Jun 2019 12:07:03 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI
 clock
Message-ID: <20190613180703.GA2190@bogus>
References: <20190504144027.31920-1-festevam@gmail.com>
 <20190504144027.31920-6-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190504144027.31920-6-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat,  4 May 2019 11:40:25 -0300, Fabio Estevam wrote:
> As per the i.MX7D Reference Manual only the MCLK is used for
> the CSI block, so only document this single clock.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/imx7-csi.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
