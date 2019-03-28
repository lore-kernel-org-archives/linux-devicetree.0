Return-Path: <robherring2@gmail.com>
Date: Thu, 28 Mar 2019 11:59:32 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] iio: gyro: add DT bindings to fxas21002c
Message-ID: <20190328165932.GA9373@bogus>
References: <20190326101651.25056-1-rui.silva@linaro.org>
 <20190326101651.25056-2-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190326101651.25056-2-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 26 Mar 2019 10:16:46 +0000, Rui Miguel Silva wrote:
> Add device tree bindings for the FXAS21002C gyroscope.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../bindings/iio/gyroscope/nxp,fxas21002c.txt | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
