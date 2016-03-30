From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
Date: Wed, 30 Mar 2016 09:31:33 -0500
Message-ID: <56FBE345.5030806@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-8-git-send-email-tthayer@opensource.altera.com>
 <20160329201648.GA30248@roeck-us.net>
 <56FAF70D.4010109@opensource.altera.com>
 <20160329222927.GS2350@sirena.org.uk>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20160329222927.GS2350@sirena.org.uk>
Sender: linux-hwmon-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com
List-Id: devicetree@vger.kernel.org



On 03/29/2016 05:29 PM, Mark Brown wrote:
> On Tue, Mar 29, 2016 at 04:43:41PM -0500, Thor Thayer wrote:
>
>> Yes, I see your point. In looking at the regulator drivers, I interpret
>> those as being controlled by the driver whereas this chip is passively
>> reporting status.
>
> If the device isn't doing regulation it's not a regulator.
>
>> After reading the referenced document, I agree that hwmon probably isn't
>> appropriate. However, the regulator doesn't seem appropriate either (the
>> only status appears to be tied to battery properties).
>
> We report status for regulators but that's tied to monitoring that's
> built into a device that does regulation.
>
> How about IIO or power supply?
>

Hi Mark,

Thanks for the clarification and for pointing out other frameworks to 
look at.

Yes, I think the iio may be a good place but I'll need to investigate 
where it should go. I'm not sure it fits into the adc subdirectory. I 
see similar functionality in the MAX1363 part but it's not actually an 
ADC - it only has the supervisor compare functionality.

Thank you!


