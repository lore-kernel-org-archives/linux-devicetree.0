From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RFT] ARM: bcm2835: dt: fix memory of Raspberry Pi B+
Date: Tue, 20 Oct 2015 20:37:51 -0600
Message-ID: <5626FA7F.2060903@wwwdotorg.org>
References: <1444942124-23122-1-git-send-email-stefan.wahren@i2se.com>
 <8737x5ncod.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8737x5ncod.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/20/2015 02:53 AM, Eric Anholt wrote:
> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> 
>> Since the Raspberry Pi models differ in memory amount we better
>> define it at board level. After that we are able to fix the
>> memory node of the Raspberry Pi B+ .

>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
>> b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts

>> +	memory { +		reg = <0 0x10000000>; /* 256 MB */ +	}; +

> 
> Seems like a good idea.  The closed firmware passes us an edited 
> devicetree with good memory fields, but I don't think U-Boot is up
> to it if you chainload it.

U-Boot fills in the memory size in DT correctly too.

I have no objection to the patch since it looks correct at a very
brief glance, but I think it will have zero practical effect.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
