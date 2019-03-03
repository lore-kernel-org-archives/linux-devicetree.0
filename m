Return-Path: <SRS0=1xCY=RG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbfCCQMZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 3 Mar 2019 11:12:25 -0500
Date: Sun, 3 Mar 2019 16:12:20 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add asm330lhh
 device bindings
Message-ID: <20190303161220.6416e777@archlinux>
In-Reply-To: <1df29add6d5a0fcdd51594f8cf4366c9086f6fc9.1550753006.git.lorenzo@kernel.org>
References: <cover.1550753006.git.lorenzo@kernel.org>
        <1df29add6d5a0fcdd51594f8cf4366c9086f6fc9.1550753006.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, mario.tesi@st.com, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

On Thu, 21 Feb 2019 16:20:21 +0100
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Applied.  Thanks,

Jonathan
> ---
>  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> index 69d53d98d0f0..8f1b09e39c72 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> @@ -8,6 +8,7 @@ Required properties:
>    "st,lsm6dsm"
>    "st,ism330dlc"
>    "st,lsm6dso"
> +  "st,asm330lhh"
>  - reg: i2c address of the sensor / spi cs line
>  
>  Optional properties:
