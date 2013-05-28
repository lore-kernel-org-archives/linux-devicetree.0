From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv2 0/3] Add G762/G763 PWM fan controller
Date: Tue, 28 May 2013 12:15:04 +0200
Message-ID: <87li6z2yxj.fsf@natisbad.org>
References: <cover.1369687670.git.arno@natisbad.org>
	<152190814.eApXVbVBPA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Andrew Lunn <andrew@lunn.ch>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Olivier Mouchet <olivier.mouchet@gmail.com>, Rob Herring <rob.herring@calxeda.com>, lm-sensors@lm-sensors.org, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Jean Delvare <khali@linux-fr.org>, Simon Guinot <simon.guinot@sequanux.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Arnd Bergmann <arnd@arndb.de> writes:

> On Tuesday 28 May 2013 00:02:29 Arnaud Ebalard wrote:
>> 
>> This series adds support for GMT G762/G763. This work is based on a
>> basic version for 2.6.31 kernel developed Olivier Mouchet for LaCie
>> NAS. Updates have been performed to run on recent kernels. Support has
>> been completed and additional features added: ability to configure
>> various characteristics from .dts file, better initialization, alarms
>> and error reporting support, gear mode, polarity, fan pulse per
>> revolution, fan startup voltage control.
>
> I wonder if this could be split into two separate drivers, one for
> the pwm subsystem, and one for a hardware-independent fan controller
> based on the pwm interfaces.

To be honest, I wouldn't even know how to start in order to do that.
Additionally, it would be worth the effort if other drivers could be
easily refactored using this idea. I'll let hwmon people provide some
feedback and try and comply with their directions (based on the cpu
cycle I can spend on this).

Cheers,

a+
