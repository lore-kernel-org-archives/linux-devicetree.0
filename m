From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 2/7] mfd: retu: Add OF device ID table
Date: Mon, 3 Apr 2017 11:45:14 -0400
Message-ID: <2147b8c9-02ee-1b9c-a74e-119b0b73d1d7@osg.samsung.com>
References: <20170401071854.23198-1-javier@osg.samsung.com>
 <20170401071854.23198-3-javier@osg.samsung.com>
 <20170403111502.lotjpd746vkhekkg@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170403111502.lotjpd746vkhekkg@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Lee,

On 04/03/2017 07:15 AM, Lee Jones wrote:

[snip]

>>  
>> +static const struct of_device_id retu_of_match[] = {
>> +	{ .compatible = "nokia,retu-mfd" },
>> +	{ .compatible = "nokia,tahvo-mfd" },
> 
> Please drop the "-mfd".
> 

Yes, I also didn't like it but I didn't want to change it since that would
mean that backward compatiblity and bisect-ability will be broken by this
change.

In other words, just adding a vendor prefix won't cause an issue if patches
are merged independently since if DTS patches are merged before, the driver
will still lookup using the I2C device ID table. And if the drivers patches
are picked before, the DTS will match using the OF device ID table.

But changing to "nokia,retu" and "nokia,tahvo" means that you will need to
pick all patches and also that the DTS and drivers changes will have to be
done in the same patch. If you are OK with that, then I can change in the
next version.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
