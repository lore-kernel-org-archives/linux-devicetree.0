From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3] arm64: allwinner: a64: Add Amarula
 A64-Relic initial support
Date: Wed, 23 May 2018 15:57:05 +0530
Message-ID: <CAMty3ZC-N-6WzYg+kYd2+V3wbQdQmvU706Nog_Urd_EUaWnQjQ@mail.gmail.com>
References: <20180522132228.6564-1-jagan@amarulasolutions.com>
 <20180522143044.pgwawojiwnk2lzxb@flea> <CAMty3ZD3JT-ToGAUHN_uj7uVK-jkyAwfEdTBCmJSj34bACFpYQ@mail.gmail.com>
 <20180523081830.4ly6sj34reabbttn@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB64DSXMAKGQECI6YM4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180523081830.4ly6sj34reabbttn@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 23, 2018 at 1:48 PM, Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> On Wed, May 23, 2018 at 11:44:56AM +0530, Jagan Teki wrote:
>> On Tue, May 22, 2018 at 8:00 PM, Maxime Ripard
>> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>> > On Tue, May 22, 2018 at 06:52:28PM +0530, Jagan Teki wrote:
>> >> Amarula A64-Relic is Allwinner A64 based IoT device, which support
>> >> - Allwinner A64 Cortex-A53
>> >> - Mali-400MP2 GPU
>> >> - AXP803 PMIC
>> >> - 1GB DDR3 RAM
>> >> - 8GB eMMC
>> >> - AP6330 Wifi/BLE
>> >> - MIPI-DSI
>> >> - CSI: OV5640 sensor
>> >> - USB OTG
>> >
>> > You claim that this is doing OTG...
>> >
>> > [..]
>> >
>> >> +&usb_otg {
>> >> +     dr_mode = "peripheral";
>> >> +     status = "okay";
>> >> +};
>> >
>> > ... and yet you're setting it as peripheral...
>>
>> Though it claims OTG, board doesn't have any USB ports to operate(not
>> even Mini-AB) the only way to use the board as peripheral to transfer
>> images from host.
>
> I'm not sure what you mean here. If there's no USB connector, why do
> you even enable it?

I'm saying there is no host port on board. Board has connector
header[1] comes with few pins includes USB D+, D-, ID, VBUS, GROUND,
UART0 TX, RX etc. we have to connect wires to these pins to make
pluggable USB to host pc. and here USB pins used for transferring data
from host pc to target board like in peripheral mode.

Hope you understand.

[1] https://www.digikey.com/product-detail/en/molex-llc/5016451420/WM6074-ND/1787775

Jagan.

-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
