From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: imu: add icm20602 bindings to
 mpu6050
Date: Wed, 30 Jan 2019 13:49:42 -0600
Message-ID: <20190130194942.GA30767@bogus>
References: <20190128185010.8275-1-gaireg@gaireg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190128185010.8275-1-gaireg@gaireg.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: gaireg@gaireg.de, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Brian Masney <masneyb@onstation.org>, Jonathan Marek <jonathan@marek.ca>, Douglas Fischer <fischerdouglasc@gmail.com>, Martin Kelly <mkelly@xevo.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Hans de Goede <hdegoede@redhat.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 28 Jan 2019 19:50:02 +0100, =?UTF-8?q?Randolph=20Maa=C3=9Fen?= wrote:
> Adding the invensense ICM-20602 to the compatible list of the mpu6050
> driver
> 
> Signed-off-by: Randolph Maaﬂen <gaireg@gaireg.de>
> 
> ---
> Changes in v2:
> - write i2c disable register using reg_set instead of define
> - decide to write to i2c disable register based on reg_set instead of
>   chip type
> ---
>  Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
