From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v2] arm64: allwinner: a64: Add initial
 NanoPi A64 support
Date: Fri, 9 Jun 2017 16:36:09 +0100
Message-ID: <3b4dda48-c403-88c4-5c89-63753f508d76@arm.com>
References: <1497012052-14027-1-git-send-email-jteki@openedev.com>
 <1497012052-14027-2-git-send-email-jteki@openedev.com>
 <20170609145141.aknbsis25vmy3rj6@flea.home>
 <3049841d-36f0-a761-fbed-57971462697c@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3049841d-36f0-a761-fbed-57971462697c-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 09/06/17 16:26, Jagan Teki wrote:
> On Friday 09 June 2017 08:21 PM, Maxime Ripard wrote:
>> Hi Jagan,
>>
>> On Fri, Jun 09, 2017 at 12:40:52PM +0000, Jagan Teki wrote:
>>> +&i2c1 {
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&i2c1_pins>;
>>> +    status = "okay";
>>> +};
>>> +
>>> +&i2c1_pins {
>>> +    bias-pull-up;
>>> +};
>>
>> What is connected on that bus?
> 
> i2c1 connected with gpio/i2s

Those are the I2C pins connected to the headers. We have them in the
other A64 DTs as well (Pine64, BananaPi).
If that is not the right approach, we should discuss this and keep it
consistent at least across the A64 boards.

>>
>>> +&uart1 {
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>>> +    status = "okay";
>>> +};
>>
>> And on that UART?
> 
> uart1 for SDIO (Wifi connector, with RTS/CTS), this along with mmc1

To be precise, UART1 (with h/w handshake) is connected to the Bluetooth
part of the WiFi/BT chip, which is soldered on that board. Regardless of
the actual *WiFi* support state BT should work already - at least it did
when I tried this a few months ago on the Pine64 (although this involved
some userland heavy lifting).
Not sure what the approach here is in regard to the power supply and
wake-up GPIOs, shall they be described in this node as well or is that
up for userspace to control?

Cheers,
Andre.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
