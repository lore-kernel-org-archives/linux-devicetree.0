From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Add Keith&Koep vendor prefix
Date: Fri, 26 Aug 2016 18:07:24 +0200
Message-ID: <d33c482e-8ce8-e6a2-6b39-f5711e3651cc@denx.de>
References: <20160826142918.7310-1-marex@denx.de>
 <201608261758.16050.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201608261758.16050.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/26/2016 05:58 PM, Arnd Bergmann wrote:
> On Friday 26 August 2016, Marek Vasut wrote:
>> Add vendor prefix for Keith&Koep GmbH , http://keith-koep.com/en/
>>
>> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 2c2500d..0fec4a7 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -141,6 +141,7 @@ jedec	JEDEC Solid State Technology Association
>>  karo	Ka-Ro electronics GmbH
>>  keymile	Keymile GmbH
>>  kinetic Kinetic Technologies
>> +kk	Keith & Koep GmbH
> 
> 
> This is really short, and my first guess what 'kk' should mean would be 'kankun',
> so I'd suggest using something longer here.

keithkoep or kuk maybe ?

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
