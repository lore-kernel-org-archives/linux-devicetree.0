Return-Path: <SRS0=3KNm=VL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728106AbfGNQ2X (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 14 Jul 2019 12:28:23 -0400
Date: Sun, 14 Jul 2019 17:28:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add lsm6ds3tr-c
 device bindings
Message-ID: <20190714172815.4f24eac8@archlinux>
In-Reply-To: <89edf867d6abb738527889040f030036173fd5b8.1561802767.git.lorenzo@kernel.org>
References: <cover.1561802767.git.lorenzo@kernel.org>
        <89edf867d6abb738527889040f030036173fd5b8.1561802767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

On Sat, 29 Jun 2019 12:13:54 +0200
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
applied.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> index efec9ece034a..92b48f242356 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> @@ -11,6 +11,7 @@ Required properties:
>    "st,asm330lhh"
>    "st,lsm6dsox"
>    "st,lsm6dsr"
> +  "st,lsm6ds3tr-c"
>  - reg: i2c address of the sensor / spi cs line
>  
>  Optional properties:
