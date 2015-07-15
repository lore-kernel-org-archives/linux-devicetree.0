From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf-colibri: define stdout-path property
Date: Wed, 15 Jul 2015 16:05:50 +0200
Message-ID: <bed79bcac594f3efece6acb3c24ae543@agner.ch>
References: <1435910799-11706-1-git-send-email-stefan@agner.ch>
 <20150713151004.GA26642@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150713151004.GA26642@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-07-13 17:10, Shawn Guo wrote:
> On Fri, Jul 03, 2015 at 10:06:39AM +0200, Stefan Agner wrote:
>> Define Vybrid's UART0, connected to the Colibri pinout UART_A, as
>> standard output.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> index 2cbe663..cb199ae 100644
>> --- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> +++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> @@ -10,6 +10,7 @@
>>  / {
>>  	chosen {
>>  		bootargs = "console=ttyLP0,115200";
>> +		stdout-path = "serial0:115200n8";
> 
> With this change, can bootargs just be dropped?

I guess it would break a (fairly old) kernel which does not support
stdout-path yet?

However, the newer Vybrid DT's anyway do not work on old kernels due to
the interrupt hierarchy changes...

Will send a v2 without default bootargs.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
