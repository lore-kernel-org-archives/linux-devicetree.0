From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: add label for uart0
Date: Wed, 7 Oct 2015 08:47:15 +0200
Message-ID: <5614BFF3.9010708@i2se.com>
References: <1443810675-25558-1-git-send-email-stefan.wahren@i2se.com>
 <87oagbhdfb.fsf@eliezer.anholt.net> <561482CE.2020804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561482CE.2020804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 07.10.2015 um 04:26 schrieb Stephen Warren:
> On 10/06/2015 03:53 PM, Eric Anholt wrote:
>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
>>
>>> This patch adds a label for uart0 to allow changing of uart0
>>> pins.
>>>
>>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>> This patch seems innocuous, but could you clarify for me how
>> exactly you change the uart0 pins, and why one would do that?
> I /assume/ this is so that some other DT file (that includes the
> edited file) can add some pinctrl-related properties to this DT node,
> using syntax such as:
>
> &uart0 {
>     new content;
> };
>
> If so, the patch,
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Your assumption is correct. In case the UART should be used on a custom
board with Raspberry Pi Compute Module and a microcontroller this change
is necessary to reference the UART:

&gpio {
  // ...

  uart0_pins: uart0_pins {
    brcm,pins = <36 37>;
    brcm,function = <BCM2835_FSEL_ALT2>;
  };
}

&uart0 {
  pinctrl-names = "default";
  pinctrl-0 = <&uart0_pins>;
  status = "okay";
};

Thanks

Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
