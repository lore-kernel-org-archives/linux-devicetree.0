Return-Path: <SRS0=sfcU=RT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbfCPQyO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 Mar 2019 12:54:14 -0400
Date: Sat, 16 Mar 2019 16:54:09 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add lsm6dsox
 device bindings
Message-ID: <20190316165409.2d9e0cbf@archlinux>
In-Reply-To: <a633a5633b93d4a131a88b94d29ea263eea64fe9.1552643968.git.lorenzo@kernel.org>
References: <cover.1552643968.git.lorenzo@kernel.org>
        <a633a5633b93d4a131a88b94d29ea263eea64fe9.1552643968.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

On Fri, 15 Mar 2019 11:08:25 +0100
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Applied,

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> index 8f1b09e39c72..4640a012c17a 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> @@ -9,6 +9,7 @@ Required properties:
>    "st,ism330dlc"
>    "st,lsm6dso"
>    "st,asm330lhh"
> +  "st,lsm6dsox"
>  - reg: i2c address of the sensor / spi cs line
>  
>  Optional properties:
