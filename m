From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 12/19] reset: sti: Remove obsolete platforms from dt
 binding doc.
Date: Tue, 18 Oct 2016 10:02:06 +0200
Message-ID: <311b79f8-d488-d8cc-38a1-791a290d54d4@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-13-git-send-email-peter.griffin@linaro.org>
 <20160923151008.GF9176@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923151008.GF9176@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

On 09/23/2016 05:10 PM, Rob Herring wrote:
> On Wed, Sep 14, 2016 at 02:27:50PM +0100, Peter Griffin wrote:
>> STiH415/6 SoC support is being removed from the kernel.
>> This patch updates the sti dt powerdown bindings and
>> removes references to these obsolete platforms.
>>
>> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/reset/st,sti-powerdown.txt | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt b/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
>> index 1cfd21d..9252713 100644
>> --- a/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
>> +++ b/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
>> @@ -16,15 +16,14 @@ Please refer to reset.txt in this directory for common reset
>>  controller binding usage.
>>  
>>  Required properties:
>> -- compatible: Should be "st,<chip>-powerdown"
>> -	ex: "st,stih415-powerdown", "st,stih416-powerdown"
>> +- compatible: Should be "st,stih407-powerdown"
>>  - #reset-cells: 1, see below
>>  
>>  example:
>>  
>>  	powerdown: powerdown-controller {
>> +		compatible = "st,stih407-powerdown";
>>  		#reset-cells = <1>;
>> -		compatible = "st,stih415-powerdown";
>>  	};
>>  
>>  
>> @@ -37,11 +36,10 @@ index specifying which channel to use, as described in reset.txt
>>  
>>  example:
>>  
>> -	usb1: usb@fe200000 {
>> -		resets	= <&powerdown STIH41X_USB1_POWERDOWN>;
>> +	st_dwc3: dwc3@8f94000 {
> 
> usb@ was correct here. With that,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 


Applied on sti-dt-for-4.10 branch

Thanks 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
