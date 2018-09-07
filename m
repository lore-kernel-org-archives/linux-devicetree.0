Return-Path: <SRS0=gCiJ=LV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:55773 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbeIGWdc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Sep 2018 18:33:32 -0400
Date: Fri, 7 Sep 2018 19:51:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Addding a property that silently breaks linux kernel driver?
Message-ID: <20180907175127.GA16794@ravnborg.org>
References: <20180906211824.GA20607@ravnborg.org>
 <980c85d3-44a3-a524-b9ce-9062d1818211@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <980c85d3-44a3-a524-b9ce-9062d1818211@mentor.com>
Sender: devicetree-owner@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: devicetree@vger.kernel.org, san@skov.dk
List-ID: <devicetree@vger.kernel.org>

Hi Vladimir.

Thanks for taking your time to investigate this!

> > The NXP RTC support that two different capacitors are connected.
> > The default (what the RTC is programmed to after reset) is 7 pF.
> > But one may also connect 12.5 pF to save power.
> > To use the 12.5 pF the RTC needs to be properly configured.
> > 
> > The RTC can only support either 7 pF or 12.5 pF.
> > 
> > A wrongly configured RTC will loose several hours in a week.
> > 
> > 
> > We came up with the following binding:
> > ==========================================
> > * NXP PCF8523 Real Time Clock
> > 
> > NXP PCF8523 Real Time Clock
> > 
> > Required properties:
> > - compatible: Should contain "nxp,pcf8523".
> > - reg: I2C address for chip.
> > 
> > Optional property:
> > - nxp,quartz_load_12.5pF: The capacitive load on the quartz is 12.5pf,
> >   which differ from the default value of 7pf
> > 
> > Example:
> > 
> > pcf8523: pcf8523@68 {
> >        compatible = "nxp,pcf85063";
> >        reg = <0x68>;
> >        nxp,quartz_load_12.5pF;
> > };
> > =======================================
> > 
> > The Q:
> > The above scheme will SILENTLY break out-of-tree Linux users because
> > we will change so if nothing is specified the RTC is configured to 7 pF.
> 
> That's the expected behaviour.
> 
> > And you need to specify if 12.5 pF is used.
> > 
> > But all users of the kernel driver will assume 12.5 pF, because this
> > is the driver default. But not the default of the RTC.
> 
> I've opened the driver rtc-pcf85063 and PCF85063A.pdf datasheet, and I don't
> see why 12.5 pF internal oscillator capacitor selection is the default one,
> it is not.
> 
> The only touched configuration of PCF85063_REG_CTRL1 register is STOP bit,
> CAP_SEL bit value is unmodified by the driver.
> 
> So I would assume it should be fine just to add a new property for 12.5pF
> load capacitance.

The rtc-pcf8523 set CAP_SEL to select an x-tal with 7 pF capacitance.
See the call to pcf8523_select_capacitance(client, true);

The rtc-pcf85063 driver will not touch the CAP-SEL bit, so the default value
of 0 (equals 7 pF) is kept.

So we have two drivers where one set 7 pF and the other 12.5 pF.

I will do a small re-spin of my patchset and post them for
further comments/discussions.

	Sam
