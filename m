From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: [PATCH 1/2] iio: chemical: pms7003: extend supported sensors
 list
Date: Wed, 20 Feb 2019 10:52:56 +0000
Message-ID: <20190220105256.7eb366a1@archlinux>
References: <20190217192213.15803-1-tduszyns@gmail.com>
        <20190217192213.15803-2-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217192213.15803-2-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 17 Feb 2019 20:22:12 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add other sensors to the compatible list.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Applied to the togreg branch of iio.git and pushed out as
testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/chemical/pms7003.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
> index db8e7b2327b3..23c9ab252470 100644
> --- a/drivers/iio/chemical/pms7003.c
> +++ b/drivers/iio/chemical/pms7003.c
> @@ -321,7 +321,12 @@ static int pms7003_probe(struct serdev_device *serdev)
>  }
>  
>  static const struct of_device_id pms7003_of_match[] = {
> +	{ .compatible = "plantower,pms1003" },
> +	{ .compatible = "plantower,pms3003" },
> +	{ .compatible = "plantower,pms5003" },
> +	{ .compatible = "plantower,pms6003" },
>  	{ .compatible = "plantower,pms7003" },
> +	{ .compatible = "plantower,pmsa003" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pms7003_of_match);
