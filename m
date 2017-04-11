From: "Bean Huo (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Tue, 11 Apr 2017 15:02:22 +0000
Message-ID: <90300f14cd2a4ae6967d8be0f7dff4e9@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
        <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
        <20170322144507.4d80d2cc@bbrezillon>
        <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
        <20170322155216.319efc3e@bbrezillon>
        <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
 <20170411145102.563fa388@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170411145102.563fa388@bbrezillon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Boris and Thomas
Let me do some explanation.

>> if (NAND == SLC ) { // on-die ECC only exists in SLC //check device ID
>> byte 4
>>      if ((ID.byte4 & 0x02) == 0x02) {// internal ECC level ==10b
>
>So here the MT29F1G08ABADAWP datasheet says 0x2 <=> 4bit/512bytes ECC.
>

If the NAND supports on-die ECC, here should be 10b, not matter it is 8bit or 4bit,
You are correct, MT29F1G08ABADAWP is 0x2, its explanation is 4bit/512bytes ECC.
But for the 70s, it is 8bit on-die ECC, but it is still 10b. 
So that why here using these two bits to determine if exist on-die ECC.
What's more, for some old products, they don't support on-die ECC,
Sometimes, here is still 01b, so still need following codes to do further
determinations.

>> 	if (ID.byte4 & 0x80) {//on-Die ECC enabled
>
>Did you read my last reply?
>Thomas discovered that ID[4].bit7 is actually reflecting the ECC engine state (1 if
>the engine is enabled, 0 if it's disabled), not whether the NAND supports on-die
>ECC or not, so no this test is not reliable.
>
For the on-die ECC, it is not always default enabled. It depends on requirement from costumers.
If on-die ECC is not enabled, bit7 is 0. It can be switched through "Feature Operations".

>>                     if (ONFI.byte112 == 4)
>> 		 60s SLC NAND with on-die ECC
>> 	    else if (ONFI.byte112 == 8)
>>      	              70s SLC NAND with on-die ECC
>
>This is completely fucked up! Now the ONFI param page says the NAND requires
>8bits/512bytes, while the ID bytes advertised an on-die ECC providing
>4bits/512bytes correctability.

I think, my previous answers can answer this confusion.

>So either your algorithm is wrong, or the ID and ONFI param page are contracting
>(not sure what solution I'd prefer...).
>
>> 	    else
>>                           Doesn't support on-die ECC
>
>Sorry to say that, but I find it worrisome that even someone from Micron is not
>able to get it right.
>
I am ashamed. I have been in Micron for two years, for some old products, I am also not very clear.
But I checked all the SLC-NAND datasheet with on-die ECC with our AE, and had this final pseudo code.

>I think we'll stick to the model name to detect whether on-die ECC is supported.
>
>Regards,
>
>Boris

beanhuo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
