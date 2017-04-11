From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Tue, 11 Apr 2017 14:26:02 +0000
Message-ID: <106593e04c494120b323836b8bc54f7f@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
 <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
 <20170322155216.319efc3e@bbrezillon>
 <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
 <20170411145102.563fa388@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170411145102.563fa388@bbrezillon>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Campbell <ijc+devicetree@hellion.org.uk>, "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "galak@codeaurora.org" <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

>
>Hi Bean,
>
>On Mon, 3 Apr 2017 11:31:05 +0000
>"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
>
>> Hi, Boris and Thomas
>>
>> >>
>> >> Ok, but I recommend that 70s should be the first choice on this
>> >> single solution, it doesn't need to read twice to detect its bitflips count.
>> >
>> >That's exactly why we need to differentiate the 2 chips.
>>
>> Sorry for later this response.
>> Below is the pseudo codes about how to differentiate these 2 series
>> parallel NAND with on-die ECC:
>>
>> if (NAND == SLC ) { // on-die ECC only exists in SLC //check device ID
>> byte 4
>>      if ((ID.byte4 & 0x02) == 0x02) {// internal ECC level ==10b
>
>So here the MT29F1G08ABADAWP datasheet says 0x2 <=> 4bit/512bytes ECC.
>
>> 	if (ID.byte4 & 0x80) {//on-Die ECC enabled
>
>Did you read my last reply?
>Thomas discovered that ID[4].bit7 is actually reflecting the ECC engine state (1 if
>the engine is enabled, 0 if it's disabled), not whether the NAND supports on-die
>ECC or not, so no this test is not reliable.
>
>>                     if (ONFI.byte112 == 4)
>> 		 60s SLC NAND with on-die ECC
>> 	    else if (ONFI.byte112 == 8)
>>      	              70s SLC NAND with on-die ECC
>
>This is completely fucked up! Now the ONFI param page says the NAND requires
>8bits/512bytes, while the ID bytes advertised an on-die ECC providing
>4bits/512bytes correctability.
>So either your algorithm is wrong, or the ID and ONFI param page are contracting
>(not sure what solution I'd prefer...).
>
>> 	    else
>>                           Doesn't support on-die ECC
>
>Sorry to say that, but I find it worrisome that even someone from Micron is not
>able to get it right.
>

Sorry, would you please specify which one is wrong or confuse you?

>I think we'll stick to the model name to detect whether on-die ECC is supported.
>
You want one solution that can clearly differentiate two serial SLC NAND, but NAND ONFI table
and device Id are always changing. It is easy to draw a perfect solution to do that.
OK, if you like maintain a huge/ugly table in MTD, please do that.

>Regards,
>
>Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
