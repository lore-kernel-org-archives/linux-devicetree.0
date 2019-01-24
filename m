Return-Path: <SRS0=r0ub=QA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46699 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfAXPty (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Jan 2019 10:49:54 -0500
Received: by mail-wr1-f65.google.com with SMTP id l9so6957917wrt.13
        for <devicetree@vger.kernel.org>; Thu, 24 Jan 2019 07:49:53 -0800 (PST)
From: Vladimir Vid <vladimir.vid@sartura.hr>
Subject: Re: [PATCH v4] arm64: dts: marvell: Add device tree for uDPU board
Date: Thu, 24 Jan 2019 16:54:26 +0100
Message-Id: <20190124155426.9781-1-vladimir.vid@sartura.hr>
In-Reply-To: <20190111172055.30451-1-vladimir.vid@sartura.hr>
References: <20190111172055.30451-1-vladimir.vid@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: gregory.clement@bootlin.com
Cc: devicetree@vger.kernel.org, Vladimir Vid <vladimir.vid@satura.hr>
List-ID: <devicetree@vger.kernel.org>

From: Vladimir Vid <vladimir.vid@satura.hr>

Hi Gregory,

> You have a GPIO for a card detect here:
>> +     cd-gpios = <&gpiosb 2 GPIO_ACTIVE_LOW>;
>> +     bus-width = <4>;
>> +     marvell,pad-type = "fixed-1-8v";
>> +     status = "okay";
>
> But here you say that the card is not removable:
>> +     non-removable;
>> +     no-sd;
>> +     no-sdio;
>
> Can you explain what do you expect to be connected here?

Originally there was an hardware bug with the eMMC where we had
to have both sdhci0 and sdhci1 interfaces in order to get it detected.

As a part of a workaround we added the non-removable options on both nodes.
This is fixed in the latest revision where sdhci1 is completely removed.
I'm currently working on v5 as there as some other changes as well.

Regards,
Vladimir
