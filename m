From: "Bean Huo (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Tue, 11 Apr 2017 15:28:42 +0000
Message-ID: <fbeca2865d5b420682f3b1995406cf33@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
        <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
        <20170322144507.4d80d2cc@bbrezillon>
        <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
        <20170322155216.319efc3e@bbrezillon>
        <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
        <20170411145102.563fa388@bbrezillon>
        <106593e04c494120b323836b8bc54f7f@SIWEX5A.sing.micron.com>
        <20170411164952.52357b4f@bbrezillon> <20170411171003.7b14b8a6@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170411171003.7b14b8a6@bbrezillon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Boris 

>> Maybe I was wrong about your 'if ((ID.byte4 & 0x02) == 0x02)' test,
>> because you apparently only mask bit 1 and not bits 0 and 1.

Sorry, here is my wrong, it should be masked with 0x3, not 0x02. 

>> Anyway, I can't tell if this is valid because I don't have access to
>> the M79A datasheets you're referring to.
>
>Okay, I managed to download the MT29F2G08ABAGAWP datasheet (from the
>MT79A family), and it seems that the test should be
>
>	if ((ID.byte4 & 0x03) == 0x02)
This is correct, should be 0x03, not 0x02.
>
>and not
>
>	if ((ID.byte4 & 0x02) == 0x02)
>
>Also, this field named "Internal ECC level" clearly does not reflect the on-die ECC
>strength because it's set to the same value on both parts (0x2) while
>MT29F2G08ABAGAWP provides 8bits/512bytes and MT29F1G08ABADAWP
>4bits/512bytes.
>
>See why I say we can't rely on READ_ID information. It's changing all the time,
>and nothing clearly say how to differentiate the scheme used in a specific NAND
>part.

Correct, so far there is no standard to define ID.byte4, every vendor with their own definition.
Even with the same vendor, for the different products, this is also changing.

Maintain one table in MTD, it is a simple and convenient way to differentiate, but, in my opinion,
This is not linux trend. We have method to automatically detect, why still maintain an additional table.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
