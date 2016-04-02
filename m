From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH v2 1/9] ARM: dts: imx7d: add lcdif support
Date: Sat, 2 Apr 2016 18:08:51 +0200
Message-ID: <CAAMH-yt3gNcb57asbos7D=Kb8Z+bnNmYOF7qqu+dDho6HCDb4w@mail.gmail.com>
References: <1458037826-19375-1-git-send-email-gary.bisson@boundarydevices.com>
	<1458050668-26748-1-git-send-email-gary.bisson@boundarydevices.com>
	<1458050668-26748-2-git-send-email-gary.bisson@boundarydevices.com>
	<20160402012955.GI18833@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160402012955.GI18833@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Troy Kisky <troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Shawn, All,

On Sat, Apr 2, 2016 at 3:29 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Mar 15, 2016 at 03:04:20PM +0100, Gary Bisson wrote:
>> Add the device node for the i.MX7 eLCDIF interface.
>>
>> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
>> ---
>>
>> Changelog v1 -> v2:
>> - none
>>
>> ---
>>  arch/arm/boot/dts/imx7d.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
>> index b5a50e0..a768716 100644
>> --- a/arch/arm/boot/dts/imx7d.dtsi
>> +++ b/arch/arm/boot/dts/imx7d.dtsi
>> @@ -608,6 +608,17 @@
>>                               status = "disabled";
>>                       };
>>
>> +                     lcdif: lcdif@30730000 {
>
> Please add the node in order of unit-address.

Sorry I did it alphabetically for some reason, I'll submit a v3 today.

Regards,
Gary
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
