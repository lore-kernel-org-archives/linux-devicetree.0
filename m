From: "Sherman Yin" <syin@broadcom.com>
Subject: RE: [PATCH 2/4] pinctrl: Add pinctrl binding for Broadcom Capri
 SoCs
Date: Thu, 10 Oct 2013 17:57:58 +0000
Message-ID: <051069C10411E24D9749790C498526FA1BE02465@SJEXCHMB12.corp.ad.broadcom.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com>
 <1380846199-12829-3-git-send-email-syin@broadcom.com>
 <CACRpkdZTKFtvc3vuNwuP9UuimXuEB2EsOQ3==mXrQw6CMDcxdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZTKFtvc3vuNwuP9UuimXuEB2EsOQ3==mXrQw6CMDcxdA@mail.gmail.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

>This should *all* be using generic pin config.
>
>For the devicetree side of this, read:
>Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>
>Your driver should also be selecting GENERIC_PINCONF in
>drivers/pinctrl/Kconfig so you use the generic pinconf
>library.
>
>Read
>include/linux/pinctrl/pinconf-generic.h
>for definitions of the generic config options.
>
>Your driver should be calling
>pinconf_generic_parse_dt_config() and
>pinconf_generic_dt_subnode_to_map() to get the config
>out of the device tree nodes.
>
>I don't understand the brcm,mode. Can this be selected on
>all pins or just for I2C? I would suspect it be related to
>things like disabling the schmitt-trigger, but elaborate on this
>so we understand what this is. It may need to be added to the
>generic options if it turns out to be unique enough.
>
>New options can be added but first we need to exactly understand
>those to see that their definitions does not overlap with already
>existing generic pin config terminology.
>
>> +The following are valid pin names and their pin types:
>> +
>> +       "adcsync",              std
>
>std? std what?
>
>Sorry I don't get anything from this list... you need to be way
>more specific in defining what is happening here.

Ok, I think some new APIs have been added since I first wrote this
driver early this year.  I'll take a look at the generic pin code and 
rework this driver.

Thanks,
Sherman

