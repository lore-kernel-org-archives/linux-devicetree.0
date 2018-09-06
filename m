Return-Path: <SRS0=8xA8=LU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:56262 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbeIGBzr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Sep 2018 21:55:47 -0400
Date: Thu, 6 Sep 2018 23:18:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Addding a property that silently breaks linux kernel driver?
Message-ID: <20180906211824.GA20607@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: san@skov.dk
List-ID: <devicetree@vger.kernel.org>

Hi all.

The NXP RTC support that two different capacitors are connected.
The default (what the RTC is programmed to after reset) is 7 pF.
But one may also connect 12.5 pF to save power.
To use the 12.5 pF the RTC needs to be properly configured.

The RTC can only support either 7 pF or 12.5 pF.

A wrongly configured RTC will loose several hours in a week.


We came up with the following binding:
==========================================
* NXP PCF8523 Real Time Clock

NXP PCF8523 Real Time Clock

Required properties:
- compatible: Should contain "nxp,pcf8523".
- reg: I2C address for chip.

Optional property:
- nxp,quartz_load_12.5pF: The capacitive load on the quartz is 12.5pf,
  which differ from the default value of 7pf

Example:

pcf8523: pcf8523@68 {
       compatible = "nxp,pcf85063";
       reg = <0x68>;
       nxp,quartz_load_12.5pF;
};
=======================================

The Q:
The above scheme will SILENTLY break out-of-tree Linux users because
we will change so if nothing is specified the RTC is configured to 7 pF.
And you need to specify if 12.5 pF is used.

But all users of the kernel driver will assume 12.5 pF, because this
is the driver default. But not the default of the RTC.

We will change all in-kernel device trees when we add this, but...

Should we try do do this in a way so we respect the current
kernel driver implmentation, or should we respect the reset default
value of the RTC?

	Sam
