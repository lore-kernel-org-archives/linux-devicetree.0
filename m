From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
Date: Fri, 17 Nov 2017 20:01:03 +0100
Message-ID: <828f0e4a-c93b-2929-60f5-e3908ae198c1@gmail.com>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <658ceb2b-5d2b-9349-f140-27858459e5a8-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/17/2017 06:36 PM, Cyrille Pitchen wrote:
> Hi Fabrizio,
> 
> sorry but I won't apply this patch.

ACK on that, if it can be detected with READID or SFDP, use that and
don't add redundant stuff into the DT bindings.

btw which renesas board has this SPI NOR on it ?

> New values for the 'compatible' DT properties should only be added for
> memory parts not supporting the JEDEC READ ID (0x9F) command.
> 
> SST25 memories do support this command hence should use the "jedec,spi-nor"
> value alone. For historical reasons, some DT nodes set their 'compatible'
> string to something like "<vendor>,<model>", "jedec,spi-nor".
> It should work as expected in most case however I discourage from doing so
> in new device trees because it may have some side effects especially when
> the m25p80.c driver is used between the spi-nor.c driver and the SPI
> controller driver.
> 
> It's all about setting the 2nd parameter of spi_nor_scan(), the 'name'
> parameter, as NULL when possible. This parameter should be set to a non NULL
> value only for memories not supporting the JEDEC READ ID op code (0x9F).
> 
> Best regards,
> 
> Cyrille
> 
> Le 24/10/2017 à 15:50, Fabrizio Castro a écrit :
>> There are a few DT files that make use of sst25vf016b in their
>> compatible strings, and the driver supports this chip already.
>> This patch improves the documentation and therefore the result
>> of ./scripts/checkpatch.pl.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> Signed-off-by: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> ---
>> Thank you Rob, thank you Geert, and sorry for the delay on this one.
>> Here is v2.
>>
>> Changes in v2:
>> * fixed subject prefix
>> * added changelog
>>
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> index 4cab5d8..bf56d77 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> @@ -31,6 +31,7 @@ Required properties:
>>                   s25sl12801
>>                   s25fl008k
>>                   s25fl064k
>> +                 sst25vf016b
>>                   sst25vf040b
>>                   sst25wf040b
>>                   m25p40
>>
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
