From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v3] ARM: dts: sun8i: enable UART1 for
 iNet D978 Rev2 board
Date: Thu, 1 Sep 2016 10:40:32 +0200
Message-ID: <a3097f99-a761-76e7-1405-2574c56ac94d@redhat.com>
References: <20160829141832.10566-1-icenowy@aosc.xyz>
 <20160831162240.GJ14379@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBCGTT67AKGQET6SOGBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160831162240.GJ14379@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 31-08-16 18:22, Maxime Ripard wrote:
> On Mon, Aug 29, 2016 at 10:18:32PM +0800, Icenowy Zheng wrote:
>> UART1 is connected to the bluetooth part of RTL8723BS WiFi/BT combo card
>> on iNet D978 Rev2 board.
>>
>> Enable the UART1 to make it possible to use the modified hciattach by
>> Realtek to drive the BT part of RTL8723BS.
>>
>> On the board no r_uart pins are found now (the onboard RX/TX pins are
>> wired to PF2/PF4, which is muxed with mmc0), so also disabled it.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>
> I'll make the same comments than in the v2.
> https://www.spinics.net/lists/arm-kernel/msg527001.html

I've a feeling there is a bit of miscommunication here,
let me try to clarify things:

Icenowy, Maxime wants you to split this into 2 patches:

1) Adding just the uart1_pins_a and uart1_pins_cts_rts_a nodes to
sun8i-a23-a33.dtsi; and
2) Another patch with the sun8i-a33-inet-d978-rev2.dts changes

And for 2. Maxime wants you to change:

	aliases {
		/delete-property/serial0;
		serial1 = &uart1;
	};

to:

	aliases {
		serial0 = &uart1;
	};

There is no serial0 and Maxime wants the serial-s
to be numbered starting at 0 (iow there is no reason
to make the bluetooth uart serial1).

Regards,

Hans
