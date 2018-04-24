From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 1/2] media: ov2680: dt: Add bindings for OV2680
Date: Tue, 24 Apr 2018 12:53:23 -0300
Message-ID: <CAOMZO5CHOcjctMDcbPBU1-1JkcxbL+JWrgfDtnt8dXLtMFCZBg@mail.gmail.com>
References: <20180419110056.10342-1-rui.silva@linaro.org> <20180419110056.10342-2-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419110056.10342-2-rui.silva@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media <linux-media@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Ryan Harkin <ryan.harkin@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rui,

On Thu, Apr 19, 2018 at 8:00 AM, Rui Miguel Silva <rui.silva@linaro.org> wrote:
> Add device tree binding documentation for the OV2680 camera sensor.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> CC: devicetree@vger.kernel.org
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/ov2680.txt  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.txt b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> new file mode 100644
> index 000000000000..0e29f1a113c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> @@ -0,0 +1,40 @@
> +* Omnivision OV2680 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: should be "ovti,ov2680".
> +- clocks: reference to the xvclk input clock.
> +- clock-names: should be "xvclk".

You missed to pass the camera power supplies as required properties:

DOVDD-supply
AVDD-supply
DVDD-supply
