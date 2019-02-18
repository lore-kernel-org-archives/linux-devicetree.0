Return-Path: <robherring2@gmail.com>
Date: Mon, 18 Feb 2019 13:39:08 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] iio: gyro: add DT bindings to fxas21002
Message-ID: <20190218193908.GA25214@bogus>
References: <20190205174333.17672-1-rui.silva@linaro.org>
 <20190205174333.17672-2-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190205174333.17672-2-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue,  5 Feb 2019 17:43:29 +0000, Rui Miguel Silva wrote:
> Add device tree bindings for the FXAS21002 gyroscope.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../bindings/iio/gyroscope/fxas2100x.txt       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
