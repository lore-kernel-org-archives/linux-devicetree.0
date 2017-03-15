From: Vivek Unune <npcomplete13-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for Linksys EA9500
Date: Wed, 15 Mar 2017 15:44:09 -0400
Message-ID: <CAChtp75ncCG86u9CS=CC2C=a3BC7o1ZOxzdHp5mbhypsNLyCkw@mail.gmail.com>
References: <1489590033-4946-1-git-send-email-npcomplete13@gmail.com>
 <20170315185214.GF21021@lunn.ch> <CAChtp75xk3LN1-DPVvaHT5qEvrdoFFvXEk-daVCcJ=4rYu_vmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAChtp75xk3LN1-DPVvaHT5qEvrdoFFvXEk-daVCcJ=4rYu_vmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andrew,

I'm not entirely sure. But here is what I observed.
Bootloader sets up both the switches. And I can use all 8 ports of the
router when I boot Lede. Only the internal switch is detected and
configurable via swconfig tool
Internal switch is connected to CPU via port 5 same as Netgear R8000.
The other bit here is that I looked through the GPL source and gpio
pin 10 is labeled as EA9500_RST2LANSW_GPIO10_PIN/ResetSwitch. So when
I performed a robo reset of the pin and 5 ports (labeled 1 thru 5 on
the unit) of the 8 physical ports stopped working (no packets).

If the external switch were to be connect via dedicated ethernet
interface it should have shown up during the probe. Is in't it?
Unfortunately my understanding about network devices limits me to
investigate this further.

I'll be more than happy to perform any tests if needed.

Thanks,

Vivek

P.S  sorry for duplicate email if you did get this first time around.
I've turned off HTML formatting.


>
>
> On Wed, Mar 15, 2017 at 2:52 PM Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
>>
>> Hi Vivek
>>
>> > - It has two switches in order to support 8 lan ports. Internal switch is
>> >   BCM53012. The external switch BCM53125 currently works as "dumb switch"
>>
>> Do you know how the second switch is connected? Is it cascaded off the
>> internal switch? Or does it have a dedicated Ethernet interface?
>>
>> Thanks
>>         Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
