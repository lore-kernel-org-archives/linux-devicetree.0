From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 1/2] doc/devicetree: Add Aspeed watchdog timer bindings
Date: Tue, 10 May 2016 20:54:01 +0930
Message-ID: <CACPK8XeAhn=h=-LKjFZJ9UibnXiYLvy5R=1=FsNZJn0Hk1O36Q@mail.gmail.com>
References: <1462797277-14969-1-git-send-email-joel@jms.id.au>
 <1462797277-14969-2-git-send-email-joel@jms.id.au> <20160509203831.GA20352@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160509203831.GA20352@rob-hp-laptop>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2016 at 6:08 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, May 09, 2016 at 10:04:36PM +0930, Joel Stanley wrote:
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> new file mode 100644
>> index 000000000000..58184b161e0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> @@ -0,0 +1,14 @@
>> +Aspeed Watchdog Timer
>> +
>> +Required properties:
>> + - compatible: must be "aspeed,wdt"
>
> This should have the specific SOCs listed.

Thanks, I'll fix it.

In the cases where the drivers had no change in the IP between
versions of the soc I wondered if it was neater to have a generic
string. You're saying that's wrong and we prefer using multiple
strings for all the SoCs instead?

>> +     wdt1: wdt@1e785000 {
>
> IIRC, "watchdog@..." is the correct generic name.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
