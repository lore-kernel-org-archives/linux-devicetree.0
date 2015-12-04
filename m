From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] extcon: arizona: Update naming for micd-timeout DT to
 include units
Date: Fri, 4 Dec 2015 22:00:40 +0100
Message-ID: <20151204210040.GC822@amd>
References: <1448290290-19267-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448290290-19267-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon 2015-11-23 14:51:30, Charles Keepax wrote:
> Add time units of -ms (milliseconds) to wlf,micd-timeout.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  .../devicetree/bindings/extcon/extcon-arizona.txt  |    2 +-
>  drivers/extcon/extcon-arizona.c                    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index da9813b..05d85ac 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -33,7 +33,7 @@ Optional properties:
>      specified as per the ARIZONA_MICD_TIME_XXX defines.
>    - wlf,micd-dbtime : Microphone detection hardware debounces specified as the
>      number of measurements to take, valid values being 2 and 4.
> -  - wlf,micd-timeout : Timeout for microphone detection, specified in
> +  - wlf,micd-timeout-ms : Timeout for microphone detection, specified in
>      milliseconds.
>    - wlf,micd-force-micbias : Force MICBIAS continuously on during microphone
>      detection.
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index c377030..8647533 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1230,7 +1230,7 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
>  	device_property_read_u32(arizona->dev, "wlf,micd-dbtime",
>  				 &pdata->micd_dbtime);
>  
> -	device_property_read_u32(arizona->dev, "wlf,micd-timeout",
> +	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
>  				 &pdata->micd_timeout);
>  
>  	pdata->micd_force_micbias =
device_property_read_bool(arizona->dev,

While the change is nice, new kernel is supposed to work with old
DTS. So you'd need to check for both properties here..
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
