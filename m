From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v2 1/5] iio: light: vcnl4000 use word writes instead of  byte writes
Date: Wed, 20 Mar 2019 13:21:58 -0700
Message-ID: <16a2d3e86f296fac2f56fb47e1f1afac@www.akkea.ca>
References: <20190317154802.15174-1-angus@akkea.ca>
 <20190317154802.15174-2-angus@akkea.ca>
 <20190320155322.3fd9f080@tomas.local.tbs-biometrics.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320155322.3fd9f080@tomas.local.tbs-biometrics.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomas Novotny <tomas@novotny.cz>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Tomas,

On 2019-03-20 07:53, Tomas Novotny wrote:
> Hi Angus,
> 
> On Sun, 17 Mar 2019 08:47:58 -0700
> "Angus Ainslie (Purism)" <angus@akkea.ca> wrote:
> 
>> The VCNL4200 datasheet says that word read and writes should be used
>> to access the registers.
>> 
>> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
>> ---
>>  drivers/iio/light/vcnl4000.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/iio/light/vcnl4000.c 
>> b/drivers/iio/light/vcnl4000.c
>> index 04fd0d4b6f19..5295330b65e2 100644
>> --- a/drivers/iio/light/vcnl4000.c
>> +++ b/drivers/iio/light/vcnl4000.c
>> @@ -140,10 +140,10 @@ static int vcnl4200_init(struct vcnl4000_data 
>> *data)
>>  	data->rev = (ret >> 8) & 0xf;
>> 
>>  	/* Set defaults and enable both channels */
>> -	ret = i2c_smbus_write_byte_data(data->client, VCNL4200_AL_CONF, 
>> 0x00);
>> +	ret = i2c_smbus_write_word_data(data->client, VCNL4200_AL_CONF, 
>> 0x00);
> 
> minor note: the 0x00 looks like a byte. 0 or 0x0000 would be slightly 
> better?
> The same below.
> 
>>  	if (ret < 0)
>>  		return ret;
>> -	ret = i2c_smbus_write_byte_data(data->client, VCNL4200_PS_CONF1, 
>> 0x00);
>> +	ret = i2c_smbus_write_word_data(data->client, VCNL4200_PS_CONF1, 
>> 0x00);
> 
> The VCNL4200_PS_CONF1 definition is a bit misleading with word write. 
> Because
> PS_CONF1 is only a low byte of command code 0x03. The high byte of 0x03 
> is
> PS_CONF2. I would rename it.
> 

As far as a base address for the register that is correct based on the 
names in the datasheet. I suppose I could add something like:

#define VCNL4200_PS_CONF  VCNL4200_PS_CONF1

and change the reference here if you think that would be more clear.

>>  	if (ret < 0)
>>  		return ret;
> 
> Anyway, the main point is that I've tested this patch on VCNL4200 and 
> it
> works, so:
> Tested-by: Tomas Novotny <tomas@novotny.cz>
> 
> T.

Thanks for testing it
Angus
