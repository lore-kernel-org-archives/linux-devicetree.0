From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: vf500/vf610: support VF500 SoC
Date: Thu, 02 Oct 2014 17:53:37 +0200
Message-ID: <20f4e3a1932756c92443d380a7f42f56@agner.ch>
References: <1412261724-11073-1-git-send-email-stefan@agner.ch>
 <8882221.sfQOLcQs3p@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8882221.sfQOLcQs3p@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 2014-10-02 17:28, schrieb Arnd Bergmann:
> On Thursday 02 October 2014 16:55:23 Stefan Agner wrote:
>> The VF500 is essentially the same SoC, but with only one core and
>> without L1 cache. The VF610 is therefore a superset of the VF500.
>> Move allmost all periperals to vf500.dtsi which is then included
>> and enhanced by vf610.dtsi.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>> Somehow using -M -B switches create a unapplyable patch, hence I
>> generated one without those options. Sorry about that.
>>
>>  arch/arm/boot/dts/vf500.dtsi | 498 ++++++++++++++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/vf610.dtsi | 507 +------------------------------------------
>>  2 files changed, 510 insertions(+), 495 deletions(-)
>>  create mode 100644 arch/arm/boot/dts/vf500.dtsi
> 
> I think it would be better to create one extra file that contains the common
> parts and is included by both vf500 and vf610.
> 

I also thought about that. But when looking at the product variants, its
clear that VF500 really contains only features, which are part of all
other Vybrids (VF3xx series excluded, but these series is not really
suitable for Linux due to lack of external memory). So vf500.dtsi would
always be a oneliner (#include <vf.dtsi>).

Also I disliked this idea because of the somewhat unclear naming
(vf.dtsi? vfxxx.dtsi?)

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
