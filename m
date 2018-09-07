Return-Path: <SRS0=gCiJ=LV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:37367 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbeIGPVN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Sep 2018 11:21:13 -0400
Subject: Re: Addding a property that silently breaks linux kernel driver?
References: <20180906211824.GA20607@ravnborg.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <980c85d3-44a3-a524-b9ce-9062d1818211@mentor.com>
Date: Fri, 7 Sep 2018 13:40:27 +0300
MIME-Version: 1.0
In-Reply-To: <20180906211824.GA20607@ravnborg.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Cc: san@skov.dk
List-ID: <devicetree@vger.kernel.org>

Hi Sam,

On 09/07/2018 12:18 AM, Sam Ravnborg wrote:
> Hi all.
> 
> The NXP RTC support that two different capacitors are connected.
> The default (what the RTC is programmed to after reset) is 7 pF.
> But one may also connect 12.5 pF to save power.
> To use the 12.5 pF the RTC needs to be properly configured.
> 
> The RTC can only support either 7 pF or 12.5 pF.
> 
> A wrongly configured RTC will loose several hours in a week.
> 
> 
> We came up with the following binding:
> ==========================================
> * NXP PCF8523 Real Time Clock
> 
> NXP PCF8523 Real Time Clock
> 
> Required properties:
> - compatible: Should contain "nxp,pcf8523".
> - reg: I2C address for chip.
> 
> Optional property:
> - nxp,quartz_load_12.5pF: The capacitive load on the quartz is 12.5pf,
>   which differ from the default value of 7pf
> 
> Example:
> 
> pcf8523: pcf8523@68 {
>        compatible = "nxp,pcf85063";
>        reg = <0x68>;
>        nxp,quartz_load_12.5pF;
> };
> =======================================
> 
> The Q:
> The above scheme will SILENTLY break out-of-tree Linux users because
> we will change so if nothing is specified the RTC is configured to 7 pF.

That's the expected behaviour.

> And you need to specify if 12.5 pF is used.
> 
> But all users of the kernel driver will assume 12.5 pF, because this
> is the driver default. But not the default of the RTC.

I've opened the driver rtc-pcf85063 and PCF85063A.pdf datasheet, and I don't
see why 12.5 pF internal oscillator capacitor selection is the default one,
it is not.

The only touched configuration of PCF85063_REG_CTRL1 register is STOP bit,
CAP_SEL bit value is unmodified by the driver.

So I would assume it should be fine just to add a new property for 12.5pF
load capacitance.

> 
> We will change all in-kernel device trees when we add this, but...
> 
> Should we try do do this in a way so we respect the current
> kernel driver implmentation, or should we respect the reset default
> value of the RTC?
> 
> 	Sam
> 

--
Best wishes,
Vladimir
