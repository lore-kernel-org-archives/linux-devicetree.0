From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtc: rtc-at91sam9.c add DT support
Date: Thu, 4 Apr 2013 10:11:46 +0200
Message-ID: <515D35C2.7050405@atmel.com>
References: <515CF985.6050009@interlog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <515CF985.6050009-qazKcTl6WRFWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robert Nelson <Robert.Nelson-9gsZL1vm+hpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/04/2013 05:54 AM, Douglas Gilbert :
> Some members of the at91 SoCs use the Real Time Timer (RTT)
> and the General Purpose Backup Registers (GPBR) to implement
> a real time clock (RTC). The AT91SAM9G20 is one example.
> 
> Attached is a patch to add DT support to rtc-at91sam9.c .
> The patch is against lk 3.9.0-rc5 .
> 
> Below is a snippet of DT code for the 'G20 that was observed
> to work with this patch:
> 
> ahb {
>     apb {
> 
>         rtc {
>             compatible = "atmel,at91sam9-rtc";

The compatible string has to be formed by the name of the first SoC
compatible with this IP. It turns to be the at91sam9260.
The second part of the string should be a name that reflects the nature
of the peripheral. For this binding, I would like to mention the "RTT"
in the compatibility string (because other drivers can use other RTT
with other uses).

What do you think about:
"atmel,at91sam9260-rtt-as-rtc"? or something shorter?

>                          /* RTTC followed by GPBR (backup registers) */
>                          reg = <0xfffffd20 0x10>, <0xfffffd50 0x10>;
>                          interrupts = <1 4 7>;
>                          status = "okay";

Last, but not least, when we add a DT binding, it is a requirement to
add the corresponding documentation in the
Documentation/devicetree/bindings/rtc/ directory.

>         };
>     }
> };
> 
> Signed-off-by: Douglas Gilbert <dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org>

Thanks, best regards,
-- 
Nicolas Ferre
