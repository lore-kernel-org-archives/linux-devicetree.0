Return-Path: <SRS0=3ErU=WB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728028AbfHEOYg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 5 Aug 2019 10:24:36 -0400
Date: Mon, 5 Aug 2019 15:24:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add ism330dhcx
 device bindings
Message-ID: <20190805152431.5a7f1a20@archlinux>
In-Reply-To: <0a970fdcd934c940be1af82ecf1fe2a746abcd2a.1564999807.git.lorenzo@kernel.org>
References: <cover.1564999807.git.lorenzo@kernel.org>
        <0a970fdcd934c940be1af82ecf1fe2a746abcd2a.1564999807.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon,  5 Aug 2019 12:18:44 +0200
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
> index 92b48f242356..87407d110bb7 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> @@ -12,6 +12,7 @@ Required properties:
>    "st,lsm6dsox"
>    "st,lsm6dsr"
>    "st,lsm6ds3tr-c"
> +  "st,ism330dhcx"
>  - reg: i2c address of the sensor / spi cs line
>  
>  Optional properties:
