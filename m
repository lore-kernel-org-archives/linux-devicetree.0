From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH v3 1/2] hwmon: (adcxx) add devictree bindings
 documentation
Date: Tue, 20 Nov 2018 08:16:28 +0100
Message-ID: <b6ee9998a565333f5105be46426b289c@dev.tdt.de>
References: <20181115135013.30723-1-fe@dev.tdt.de>
 <20181115135013.30723-2-fe@dev.tdt.de> <20181117144040.GA8016@bogus>
 <20181119012555.GA7856@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119012555.GA7856@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, jdelvare@suse.com, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello Guenter,

>> 
>> Needs a better description of what this h/w is.
>> 
>> ADCs go in iio/adc/
>> 
> FWIW, the hwmon driver for this chip series would be a perfect 
> candidate
> for a conversion to an iio driver. The driver predates the existence of
> iio.
> 
> Florian, any interest doing that ? It is quite likely that the chip 
> isn't
> used for hardware monitoring.

I will have a look on the next week about your suggestion to port this 
device
to iio/adc.

   - Florian
