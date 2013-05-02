From: Dirk Eibach <dirk.eibach@gdsys.cc>
Subject: Re: [PATCH] powerpc: Make Book E watchdog reset type configurable
Date: Thu, 02 May 2013 21:11:19 +0200
Message-ID: <429ec64cf7c30a139db40eb20fd3e682@gdsys.cc>
References: <1367505913-18970-1-git-send-email-dirk.eibach@gdsys.cc>
 <20130502161720.GA7797@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130502161720.GA7797@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,


>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index e89fc31..6048593 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1172,6 +1172,38 @@ config BOOKE_WDT_DEFAULT_TIMEOUT
>> 
>>  	  The value can be overridden by the wdt_period command-line 
>> parameter.
>> 
>> +choice
>> +	prompt "PowerPC Book-E Watchdog reset type"
>> +	depends on BOOKE_WDT
>> +	default BOOKE_WDT_RESET_CHIP
>> +	help
>> +	  Specify what kind of reset will be executed on watchdog timeout.
>> +
> Seems to me it would be much better to make this configurable via 
> platform data
> and/or device tree.

good catch. What do the device-tree gurus think to be a nice property 
name?

Cheers
Dirk
