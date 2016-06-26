From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] iio: pressure: bmp280: augment DT bindings
Date: Sun, 26 Jun 2016 17:47:40 +0100
Message-ID: <058533b8-a0a7-b7fa-9745-d72eb2a2db21@kernel.org>
References: <1466176341-17442-1-git-send-email-linus.walleij@linaro.org>
 <20160620164645.GA3191@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160620164645.GA3191@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20/06/16 17:46, Rob Herring wrote:
> On Fri, Jun 17, 2016 at 05:12:18PM +0200, Linus Walleij wrote:
>> This adds standard device tree bindings for a reset GPIO line, and
>> the VDDD and VDDA power regulators.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/iio/pressure/bmp085.txt | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
>> index d7a6deb6b21e..06ad5feaea28 100644
>> --- a/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
>> +++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
>> @@ -1,7 +1,7 @@
>> -BMP085/BMP18x digital pressure sensors
>> +BMP085/BMP18x/BMP28x digital pressure sensors
>>  
>>  Required properties:
>> -- compatible: bosch,bmp085
>> +- compatible: "bosch,bmp085" or "bosch,bmp180" or "bosch,bmp280"
> 
> One per line is preferred, but I wouldn't respin just for that.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
Applied to the togreg branch of iio.git - initially pushed out
as testing.

thanks,

Jonathan
