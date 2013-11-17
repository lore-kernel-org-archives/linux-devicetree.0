From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: Fwd: [PATCH 7/8] watchdog: davinci: add "clocks" property
Date: Sat, 16 Nov 2013 18:28:43 -0800
Message-ID: <528829DB.7020003@roeck-us.net>
References: <1383680783-12114-8-git-send-email-ivan.khoronzhuk@ti.com> <527A28E8.4010204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527A28E8.4010204-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/06/2013 03:32 AM, ivan.khoronzhuk wrote:
> The Keystone arch is using clocks in DT and source clock for watchdog
> has to be specified, so add this to binding.
>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---
>   .../devicetree/bindings/watchdog/davinci-wdt.txt   |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
> index fddced9..4db4d0e 100644
> --- a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
> @@ -7,6 +7,10 @@ Required properties:
>
>   - reg : Should contain WDT registers location and length
>
> +- clocks: phandle reference to the controller clock.
> +	  Required only for Keystone arch.
> +	  See clock-bindings.txt
> +

Yet another form of formatting. Also, wonder if it makes sense to merge this with the patch adding keystone support.

>   Optional properties:
>
>   - timeout-sec:		Contains the watchdog timeout in seconds
> @@ -21,4 +25,5 @@ wdt: wdt@2320000 {
>   	compatible = "ti,davinci-wdt";
>   	reg = <0x02320000 0x80>;
>   	timeout-sec = <30>;
> +	clocks = <&clkwdtimer0>;
>   };
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
