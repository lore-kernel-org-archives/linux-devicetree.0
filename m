From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] arm: dts: lpc32xx: remove unneeded cell settings
 from cpus
Date: Tue, 13 Oct 2015 13:03:05 +0300
Message-ID: <561CD6D9.1020102@mleia.com>
References: <1444694045-22000-1-git-send-email-vz@mleia.com>	<1444694045-22000-5-git-send-email-vz@mleia.com> <CAGhQ9VwBcUxZr7A57feuUNs0OcNpHn4wwmGommVg6e-B0=tsBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGhQ9VwBcUxZr7A57feuUNs0OcNpHn4wwmGommVg6e-B0=tsBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joachim,

On 13.10.2015 11:18, Joachim Eastwood wrote:
> Hi Vladimir,
> 
> On 13 October 2015 at 01:54, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org> wrote:
>> There is no addressable devices under cpus device node, remove noisy
>> address and size cells properties.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/lpc32xx.dtsi | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
>> index dcb52cb..929458d 100644
>> --- a/arch/arm/boot/dts/lpc32xx.dtsi
>> +++ b/arch/arm/boot/dts/lpc32xx.dtsi
>> @@ -18,9 +18,6 @@
>>         interrupt-parent = <&mic>;
>>
>>         cpus {
>> -               #address-cells = <0>;
>> -               #size-cells = <0>;
>> -
> 
> According to Documentation/devicetree/bindings/arm/cpus.txt these
> properties are required.
> 
> Take a look at Example 3 in the doc for it should look like on a ARM
> 926EJ-S uniprocessor 32-bit system.

thank you for review and pointing the fact out, then according to
documentation #address-cells must be set to 1 plus reg property in cpu
node is missing, I'll send a fix as patch v2 4/5.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
