From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [v7, 3/3] ARM: dts: imx6qdl.dtsi/imx6ul.dtsi: add "fsl,
 imx6q-snvs-lpgpr" node
Date: Fri, 15 Dec 2017 16:07:54 +0100
Message-ID: <f5e42526-fa17-a689-2c0b-f4b57dbfcda9@i2se.com>
References: <20170620070932.10353-4-o.rempel@pengutronix.de>
 <cfd53377-437a-98d3-1a0e-1123495a35ee@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd53377-437a-98d3-1a0e-1123495a35ee-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guy Shapiro <guy.shapiro-2HKgp+mgmS5l57MIdRCFDg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maciej,


Am 11.12.2017 um 23:31 schrieb Maciej S. Szmigiero:
> On 20.06.2017 09:09, Oleksij Rempel wrote:
>> This node is for Low Power General Purpose Register which can
>> be used as Non-Volatile Storage.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/imx6qdl.dtsi | 4 ++++
>>   arch/arm/boot/dts/imx6ul.dtsi  | 4 ++++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
>> index e426faa9c243..94e992558238 100644
> (..)
>
> FYI: It looks to me that while the driver itself from this series was
> picked up and eventually reached Linus' tree this DT change was
> forgotten, since I can't find in any tree (or am I not looking at the
> right place?).

thanks for the reminder. It's possible that this patch won't apply 
anymore and needs a resend.

>
> Maciej
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
