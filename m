From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Tue, 07 Jan 2014 22:03:11 +0100
Message-ID: <52CC6B8F.5000404@redhat.com>
References: <Pine.LNX.4.44L0.1401061043240.1282-100000@iolanthe.rowland.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBFGXWGLAKGQEQBLFB5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1401061043240.1282-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01/06/2014 04:49 PM, Alan Stern wrote:
> On Mon, 6 Jan 2014, Hans de Goede wrote:
>
>> Add support for ohci-platform instantiation from devicetree, including
>> optionally getting clks and a phy from devicetree, and enabling / disabling
>> those on power_on / off.
>>
>> This should allow using ohci-platform from devicetree in various cases.
>> Specifically after this commit it can be used for the ohci controller found
>> on Allwinner sunxi SoCs.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../devicetree/bindings/usb/platform-ohci.txt      |  25 ++++
>>   drivers/usb/host/ohci-platform.c                   | 146 ++++++++++++++++++---
>>   2 files changed, 151 insertions(+), 20 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/usb/platform-ohci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/platform-ohci.txt b/Documentation/devicetree/bindings/usb/platform-ohci.txt
>> new file mode 100644
>> index 0000000..6846f1c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/platform-ohci.txt
>> @@ -0,0 +1,25 @@
>> +Generic Platform OHCI controller
>> +
>> +Required properties:
>> + - compatible: Should be "platform-ohci"
>> + - reg: Address range of the ohci registers.
>> + - interrupts: Should contain the ohci interrupt.
>> +
>> +Optional properties:
>> + - clocks: array of clocks
>> + - clock-names: clock names "ahb" and/or "ohci"
>
> Where does "ahb" come from, what does it mean, and how is it relevant
> to generic platforms?

ahb is an ARM specific thing, so your right it does not belong in a
generic driver. I'll use clk1 and clk2 as names in my next version.

> What about platforms that use 3 clocks?

Ah yes I see some platforms have 3 clocks, I'll also add a clk3.

Regards,

Hans
