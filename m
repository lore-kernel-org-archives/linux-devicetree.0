From: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Subject: Re: [PATCH RFT] ARM: bcm2835: dt: fix memory of Raspberry Pi B+
Date: Tue, 20 Oct 2015 19:29:55 +0200
Message-ID: <56267A13.6090008@lategoodbye.de>
References: <1444942124-23122-1-git-send-email-stefan.wahren@i2se.com>
 <8737x5ncod.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8737x5ncod.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 20.10.2015 um 10:53 schrieb Eric Anholt:
> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
>
>> Since the Raspberry Pi models differ in memory amount we
>> better define it at board level. After that we are able
>> to fix the memory node of the Raspberry Pi B+ .
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> [...]
>
> Seems like a good idea.  The closed firmware passes us an edited
> devicetree with good memory fields, but I don't think U-Boot is up to it
> if you chainload it.
>
> However, isn't the rpi-b-rev2 the 512MB variant of the rpi-b?
>

Unfortunately not. There are rev2 boards with 256 MB and with 512 MB RAM 
[1]. I'm not sure it is worth to create 2 dts files for both.

[1] - http://elinux.org/Board_revisions
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
