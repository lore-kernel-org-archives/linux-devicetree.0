From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2] iio:adc: Driver for Linear Technology LTC2497 ADC
Date: Sun, 2 Apr 2017 11:52:10 +0200
Message-ID: <f0229cde-15b6-d45b-6d85-3c90082d0226@metafoo.de>
References: <1490599433-6103-1-git-send-email-michael.hennerich@analog.com>
 <3d54516e-cbd1-8a61-0d83-a91d7055f44c@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3d54516e-cbd1-8a61-0d83-a91d7055f44c-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/02/2017 11:30 AM, Jonathan Cameron wrote:
> On 27/03/17 08:23, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org wrote:
>> From: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
>>
>> This patch adds support for the Analog Devices / Linear Technology
>> LTC2497 ADCs. The LTC2497 is a 16-channel (eight differential),
>> 16-bit, high precision, delta-sigma ADC with an automatic, differential,
>> input current cancellation front end and a 2-wire, I2C interface.
>>
>> Signed-off-by: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> Looks good to me.
> 
> Applied to the togreg branch of iio.git and pushed out as testing for
> the autobuilders to play with it.

There is a v3 of this patch.
