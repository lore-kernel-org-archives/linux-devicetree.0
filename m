From: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Subject: Re: [PATCH RFT] ARM: bcm2835: enable all bcm2835-relevant in
 defconfig
Date: Wed, 21 Oct 2015 18:16:31 +0200
Message-ID: <5627BA5F.104@lategoodbye.de>
References: <1444942061-23085-1-git-send-email-stefan.wahren@i2se.com>
 <5626F934.6090706@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5626F934.6090706-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 21.10.2015 um 04:32 schrieb Stephen Warren:
> On 10/15/2015 02:47 PM, Stefan Wahren wrote:
>> Rebuild bcm2835_defconfig using "make bcm2835_defconfig;
>> make savedefconfig", and add the following features:
>>
>> * Enable all bcm2835-relevant drivers (MBOX, WDT, DMA,
>>    PWM, SND)
>> * Re-enable some features to keep the current settings
>>    (stackprotector, LED GPIO, LED triggers)
>
> Can you explain that second bullet a bit more?

Yes, the last update to bcm2835_defconfig was on 25th September 2014.
So a little bit changed in the configs like renaming of options.
After saving the defconfig i noticed that we "lost" 2 features with
the new defconfig:

* CONFIG_CC_STACKPROTECTOR because of renaming to 
CONFIG_CC_STACKPROTECTOR_REGULAR

* CONFIG_LEDS_TRIGGER_HEARTBEAT because of the following new dependencies
   * CONFIG_NEW_LEDS
   * CONFIG_LEDS_CLASS
   * CONFIG_LEDS_TRIGGERS

Do you want 2 separate patches (first update with re-enable and second 
with new bcm2835 stuff)?

Best regards
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
