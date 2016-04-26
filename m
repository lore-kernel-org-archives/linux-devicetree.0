From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/4] arm: dts: lpc32xx: reparent SIC1 and SIC2
 interrupts from MIC
Date: Tue, 26 Apr 2016 21:38:50 +0300
Message-ID: <571FB5BA.1010903@mleia.com>
References: <1461546041-25713-1-git-send-email-vz@mleia.com>
 <1461618143-12310-1-git-send-email-vz@mleia.com>
 <1461673563.18338.20.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461673563.18338.20.camel@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On 26.04.2016 15:26, Sylvain Lemieux wrote:
> Hi Vladimir,
> 
> On Tue, 2016-04-26 at 00:02 +0300, Vladimir Zapolskiy wrote:
>> The change adds separate device nodes for SIC1 and SIC2 interrupt
>> controllers and reparents all defined SIC1 and SIC2 interrupt
>> producers to the correspondent interrupt controller, this is needed to
>> perform switching to a new LPC32xx MIC/SIC interrupt controller driver.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
>> ---
>> Changes from v2 to v3:
>> * fix io region size for MIC controller after moving SIC1/SIC2
>>   controllers out,
>> * move MIC 'reg' property up to follow 'compatible' property.
>>
>> Changes from v1 to v2:
>> * squashed two step change in lpc32xx.dtsi - new irqchip driver can be
>>   used (i.e. board boots with access to userspace) with old DTS file,
>>   so there is no need to fix DTS firstly and then switch to a new driver,
>> * removed "interrupt-controller-name" and "wakeup-sources" properties
>>   from all interrupt controllers,
>> * removed outdated comment.
>>
>>  arch/arm/boot/dts/lpc32xx.dtsi | 60 +++++++++++++++++++++++++++++-------------
>>  1 file changed, 42 insertions(+), 18 deletions(-)
>>
> Please use capital letter for the word ARM in the patch title.

right, I'll change it on application, thank you for review.

> Acked-by: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
