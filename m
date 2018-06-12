Return-Path: <robherring2@gmail.com>
Date: Tue, 12 Jun 2018 16:06:28 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] media: ov5640: add support of module orientation
Message-ID: <20180612220628.GA18467@rob-hp-laptop>
References: <1528709357-7251-1-git-send-email-hugues.fruchet@st.com>
 <1528709357-7251-3-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528709357-7251-3-git-send-email-hugues.fruchet@st.com>
To: Hugues Fruchet <hugues.fruchet@st.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 11, 2018 at 11:29:17AM +0200, Hugues Fruchet wrote:
> Add support of module being physically mounted upside down.
> In this case, mirror and flip are enabled to fix captured images
> orientation.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt       |  3 +++

Please split bindings to separate patches.

>  drivers/media/i2c/ov5640.c                         | 28 ++++++++++++++++++++--
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> index 8e36da0..f76eb7e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> @@ -13,6 +13,8 @@ Optional Properties:
>  	       This is an active low signal to the OV5640.
>  - powerdown-gpios: reference to the GPIO connected to the powerdown pin,
>  		   if any. This is an active high signal to the OV5640.
> +- rotation: integer property; valid values are 0 (sensor mounted upright)
> +	    and 180 (sensor mounted upside down).

Didn't we just add this as a common property? If so, just reference the 
common definition. If not, it needs a common definition.
