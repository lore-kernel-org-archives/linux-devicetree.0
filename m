From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/11] dt-bindings: clock: add description of LPC32xx
 clock controller
Date: Fri, 20 Nov 2015 20:01:00 +0200
Message-ID: <564F5FDC.2070001@mleia.com>
References: <1447981511-29653-1-git-send-email-vz@mleia.com> <1447981511-29653-2-git-send-email-vz@mleia.com> <3740707.LksPCoyRXC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3740707.LksPCoyRXC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd,

On 20.11.2015 15:58, Arnd Bergmann wrote:
> On Friday 20 November 2015 03:05:01 Vladimir Zapolskiy wrote:
>> NXP LPC32xx SoC has a clocking and power control unit (CPC) as a part
>> of system control block (SCB). CPC is supplied by two external
>> oscillators and it manages core and most of peripheral
>> clocks, the change adds description of DT bindings for clock
>> controller found on LPC32xx SoC series.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/clock/nxp,lpc3220-clk.txt  | 30 ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
>> new file mode 100644
>> index 0000000..20cbca3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
>> @@ -0,0 +1,30 @@
>> +NXP LPC32xx Clock Controller
>> +
>> +Required properties:
>> +- compatible: should be "nxp,lpc3220-clk"
> 
> Please use a specific model number without 'xx' wildcards. If you have
> multiple chips that are mutually compatible, pick one as the base number
> and then list the others as more specific instances, like
> 
> 	compatible = "nxp,lpc3250-clk", "nxp,lpc3220-clk";

Do you ask me to change a title? You may see that compatible property
does not contain any wildcards?

--
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
