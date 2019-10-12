From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 2/2] iio: (bma400) add driver for the BMA400
Date: Sat, 12 Oct 2019 13:31:18 -0700
Message-ID: <8e55c408-acd8-0e8c-38a8-e48406b8bce6@infradead.org>
References: <20191012192525.21040-1-dan@dlrobertson.com>
 <20191012192525.21040-3-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012192525.21040-3-dan@dlrobertson.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Robertson <dan@dlrobertson.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/12/19 12:25 PM, Dan Robertson wrote:
> Add a IIO driver for the Bosch BMA400 3-axes ultra-low power accelerometer.
> The driver supports reading from the acceleration and temperature
> registers. The driver also supports reading and configuring the output data
> rate, oversampling ratio, and scale.
> 
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---
>  drivers/iio/accel/Kconfig       |  18 +
>  drivers/iio/accel/Makefile      |   2 +
>  drivers/iio/accel/bma400.h      |  80 ++++
>  drivers/iio/accel/bma400_core.c | 788 ++++++++++++++++++++++++++++++++
>  drivers/iio/accel/bma400_i2c.c  |  60 +++
>  5 files changed, 948 insertions(+)
>  create mode 100644 drivers/iio/accel/bma400.h
>  create mode 100644 drivers/iio/accel/bma400_core.c
>  create mode 100644 drivers/iio/accel/bma400_i2c.c

No comment other than thank you for ignoring my previous comments.  :(

-- 
~Randy
