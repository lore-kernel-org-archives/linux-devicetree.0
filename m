From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v3 3/5] nfc: pn533: add UART phy driver
Date: Sun, 28 Oct 2018 14:46:24 +0100
Message-ID: <9494A12C-C53A-4F6E-B6F3-BABB09867677@holtmann.org>
References: <20181025132937.24405-1-poeschel@lemonage.de>
 <20181025132937.24405-3-poeschel@lemonage.de>
 <20181028102725.GL27852@localhost>
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181028102725.GL27852@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Lars Poeschel <poeschel@lemonage.de>, devicetree <devicetree@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Johan,

>> This adds the UART phy interface for the pn533 driver.
>> The pn533 driver can be used through UART interface this way.
>> It is implemented as a serdev device.
> 
> Just a few drive-by comments below.
> 
>> +// SPDX-License-Identifier: GPL-2.0
> 
> This should match MODULE_LICENSE below which currently says v2 *or
> later*.
> 
>> +/*
>> + * Driver for NXP PN532 NFC Chip - UART transport layer
>> + *
>> + * Copyright (C) 2018 Lemonage Software GmbH
>> + * Author: Lars Pöschel <poeschel@lemonage.de>
>> + * All rights reserved.
>> + */
> 
>> +#define VERSION "0.1"
> 
> We don't version kernel drivers individually, so please drop this here
> and below.

if we don’t then maybe send patches to remove MODULE_VERSION first. Otherwise this is totally fine to do.

There are currently 670 usages of MODULE_VERSION and I have not heard anybody looking at removing this.

Regards

Marcel
