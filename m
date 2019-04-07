Return-Path: <SRS0=e9d6=SJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbfDGKbD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 7 Apr 2019 06:31:03 -0400
Date: Sun, 7 Apr 2019 11:30:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add lsm6dsr
 device bindings
Message-ID: <20190407113058.2a3ba17f@archlinux>
In-Reply-To: <d72fe86f431bbf68ebeec0b234f4c57881e86c82.1554393394.git.lorenzo@kernel.org>
References: <cover.1554393393.git.lorenzo@kernel.org>
        <d72fe86f431bbf68ebeec0b234f4c57881e86c82.1554393394.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

On Thu,  4 Apr 2019 18:02:35 +0200
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> index 4640a012c17a..efec9ece034a 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> @@ -10,6 +10,7 @@ Required properties:
>    "st,lsm6dso"
>    "st,asm330lhh"
>    "st,lsm6dsox"
> +  "st,lsm6dsr"
>  - reg: i2c address of the sensor / spi cs line
>  
>  Optional properties:
