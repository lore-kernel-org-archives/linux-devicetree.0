From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/5] iio: light: vcnl4000 use word writes instead of
 byte writes
Date: Sun, 24 Mar 2019 17:18:21 +0000
Message-ID: <20190324171821.4deba8be@archlinux>
References: <20190321154047.23236-1-angus@akkea.ca>
        <20190321154047.23236-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321154047.23236-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomas Novotny <tomas@novotny.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Mar 2019 08:40:43 -0700
"Angus Ainslie (Purism)" <angus@akkea.ca> wrote:

> The VCNL4200 datasheet says that word read and writes should be used
> to access the registers.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> Tested-by: Tomas Novotny <tomas@novotny.cz>

So we did discuss if this was a fix for any of the existing devices.
Not sure we reached a conclusion as clearly the worked for Tomas without
this.  Anyhow, for now applied to the togreg branch of iio.git and pushed
out as testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/light/vcnl4000.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
> index 04fd0d4b6f19..5e0a8eb83ebc 100644
> --- a/drivers/iio/light/vcnl4000.c
> +++ b/drivers/iio/light/vcnl4000.c
> @@ -140,10 +140,10 @@ static int vcnl4200_init(struct vcnl4000_data *data)
>  	data->rev = (ret >> 8) & 0xf;
>  
>  	/* Set defaults and enable both channels */
> -	ret = i2c_smbus_write_byte_data(data->client, VCNL4200_AL_CONF, 0x00);
> +	ret = i2c_smbus_write_word_data(data->client, VCNL4200_AL_CONF, 0);
>  	if (ret < 0)
>  		return ret;
> -	ret = i2c_smbus_write_byte_data(data->client, VCNL4200_PS_CONF1, 0x00);
> +	ret = i2c_smbus_write_word_data(data->client, VCNL4200_PS_CONF1, 0);
>  	if (ret < 0)
>  		return ret;
>  
