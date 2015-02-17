From: Arun Ramamurthy <arun.ramamurthy@broadcom.com>
Subject: Re: [PATCH 1/2] phy: usbphy: Add dt documentation for Broadcom Cygnus
 USB PHY driver
Date: Tue, 17 Feb 2015 12:00:49 -0800
Message-ID: <54E39DF1.50409@broadcom.com>
References: <1424200821-16368-1-git-send-email-arun.ramamurthy@broadcom.com> <1424200821-16368-2-git-send-email-arun.ramamurthy@broadcom.com> <8242260.cl4QTECoeX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8242260.cl4QTECoeX@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>
List-Id: devicetree@vger.kernel.org

Thank you for the review Arnd.
On 15-02-17 11:41 AM, Arnd Bergmann wrote:
> On Tuesday 17 February 2015 11:20:20 Arun Ramamurthy wrote:
>> +       /* This nodes declares  port 0
>> +       and port 1 as host*/
>> +
>> +       ehci0: usb@0x18048000 {
>> +               compatible = "generic-ehci";
>> +               reg = <0x18048000 0x100>;
>> +               interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> +               phys = <&usbphy0 0 1 &usbphy0 1>;
>
> The second reference in the example is missing the last cell,
> as you have #phy-cells = <2>.
>
I am missing a 1 for the port number, will update in next patchset, 
thank you
>> +               phy-names = "usbp0","usbp1";
>> +               status = "okay";
>> +       };
>
> Further, the binding for "generic-ehci" requires the name to be "usb",
> not "usbp0". You should probably update that binding if you can have
> multiple references to mention that.
>
> Can you make both names "usb"? If not, we should document a common
> naming scheme that the driver can use.
>
Arnd, I patched the ehci and ohci driver to accept multiple phys so they 
require different names and cannot both be "usb". That patch was 
accepted by Alen Stern but I did not update the bindings documentation.
I will send out another patch for that. Could we go with the naming 
scheme of "usb" + "p" + port number or do you have other suggestions?


> 	Arnd
>
