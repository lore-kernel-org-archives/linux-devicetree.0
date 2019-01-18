Return-Path: <SRS0=ctnT=P2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56708 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726032AbfARKp4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 18 Jan 2019 05:45:56 -0500
Subject: Re: [PATCH v4 1/2] media: dt-bindings: media: video-i2c: add melexis
 mlx90640 documentation
References: <20181211151701.10002-1-matt.ranostay@konsulko.com>
 <20181211151701.10002-2-matt.ranostay@konsulko.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <83ee363d-f168-2c27-5479-d4a44a14fa16@xs4all.nl>
Date: Fri, 18 Jan 2019 11:45:53 +0100
MIME-Version: 1.0
In-Reply-To: <20181211151701.10002-2-matt.ranostay@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Matt Ranostay <matt.ranostay@konsulko.com>, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Matt,

I'm merging this patch, but can you add a new patch that updates the entry for
this driver in the MAINTAINERS file with references to the relevant bindings files?

I.e., for this one you add:

F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt

but you need to add the panasonic bindings file as well.

Thanks!

	Hans

On 12/11/18 4:17 PM, Matt Ranostay wrote:
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  .../bindings/media/i2c/melexis,mlx90640.txt   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt b/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt
> new file mode 100644
> index 000000000000..060d2b7a5893
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt
> @@ -0,0 +1,20 @@
> +* Melexis MLX90640 FIR Sensor
> +
> +Melexis MLX90640 FIR sensor support which allows recording of thermal data
> +with 32x24 resolution excluding 2 lines of coefficient data that is used by
> +userspace to render processed frames.
> +
> +Required Properties:
> + - compatible : Must be "melexis,mlx90640"
> + - reg : i2c address of the device
> +
> +Example:
> +
> +	i2c0@1c22000 {
> +		...
> +		mlx90640@33 {
> +			compatible = "melexis,mlx90640";
> +			reg = <0x33>;
> +		};
> +		...
> +	};
> 
