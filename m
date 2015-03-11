From: Arun Ramamurthy <arun.ramamurthy@broadcom.com>
Subject: Re: [PATCH 1/2] phy: usbphy: Add dt documentation for Broadcom Cygnus
 USB PHY driver
Date: Wed, 11 Mar 2015 14:37:58 -0700
Message-ID: <5500B5B6.50609@broadcom.com>
References: <1424200821-16368-1-git-send-email-arun.ramamurthy@broadcom.com> <54E53278.70705@broadcom.com> <54EE67A6.609@broadcom.com> <2079271.sEacVGN4vm@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2079271.sEacVGN4vm@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Alan Stern <stern@rowland.harvard.edu>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Jonathan Richardson <jonathar@broadcom.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Dmitry Torokhov <dtor@google.com>, Kumar Gala <galak@codeaurora.org>, Anatol Pomazau <anatol@google.com>
List-Id: devicetree@vger.kernel.org



On 15-03-10 01:27 PM, Arnd Bergmann wrote:
> On Wednesday 25 February 2015 16:24:06 Arun Ramamurthy wrote:
>>>>> Should I run this by Alan Stern?
>>>>
>>>> I've added him to Cc here. He clearly didn't know the background about
>>>> the DT binding change, and should not need to, but he may have an opinion
>>>> on what names we should use.
>>>>
>>>
>> Arnd, should I re patch the ehci-platform driver to avoid phy-names
>> entirely? Alan, if not do you have an opinion on what the usb phy names
>> should be? The current patch uses "usbp" + port number such as "usbp0" ,
>> "usbp1" etc
>
> I think avoiding the phy names would be best here, but it requires a
> kernel API change first, because we do not have a way to get a phy
> by index as we do for other subsystems (e.g. clocks or gpios).
>
Arnd , there is an existing api _of_phy_get that gets a phy by index. 
However it is not exported and is called from of_phy_get which is in 
turn called from devm_of_phy_get.

My plan is to create a new function maybe devm_of_phy_get_by_index that 
calls _of_phy_get directly? What are your thoughts?

> 	Arnd
>
