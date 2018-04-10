Return-Path: <robherring2@gmail.com>
Date: Tue, 10 Apr 2018 09:12:37 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: iio:imu:mpu6050: support more
 interrupt types
Message-ID: <20180410141237.4jozljz6d5okwo2r@rob-hp-laptop>
References: <20180406220048.29498-1-mkelly@xevo.com>
 <20180406220048.29498-2-mkelly@xevo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406220048.29498-2-mkelly@xevo.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Jean-Baptiste Maneyrol <JManeyrol@invensense.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 06, 2018 at 03:00:48PM -0700, Martin Kelly wrote:
> Document that the inv_mpu6050 driver now supports falling edge, rising

It's really about what the h/w supports for bindings.

> edge, level low, and level high interrupt types, rather than just rising
> edge.
> 
> The language used is the same as that in st_lsm6dsx.txt.
> 
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
