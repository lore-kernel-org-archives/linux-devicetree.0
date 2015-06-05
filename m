From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v7 2/3] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Fri, 05 Jun 2015 13:41:15 -0600
Message-ID: <5571FB5B.2030805@wwwdotorg.org>
References: <1433448707-18104-1-git-send-email-eric@anholt.net> <1433448707-18104-2-git-send-email-eric@anholt.net> <55711428.4080506@wwwdotorg.org> <20150605192135.GA3301@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150605192135.GA3301@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/05/2015 01:21 PM, Lee Jones wrote:
> On Thu, 04 Jun 2015, Stephen Warren wrote:
>
>> On 06/04/2015 02:11 PM, Eric Anholt wrote:
>>> This gives us a function for making mailbox property channel requests
>>> of the firmware, which is most notable in that it will let us get and
>>> set clock rates.
>>
>> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>
> Does anyone know how drivers/firmware/ is managed?  I don't seem to be
> able to find a maintainer/supporter listed in MAINTAINERS.

git log implies lots of different committers. I'd suggest send it 
through arm-soc with the rest of the series.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
