From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via serdev/devicetree
Date: Mon, 12 Nov 2018 22:19:02 +0100
Message-ID: <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com>
References: <20181110232034.17277-1-andreas@kemnade.info> <20181111024648.7rt7rlhaqihtqecv@earth.universe> <20181112215812.18ebca35@aktux>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112215812.18ebca35@aktux>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree <devicetree@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, LKML <linux-kernel@vger.kernel.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org


> Am 12.11.2018 um 21:59 schrieb Andreas Kemnade <andreas@kemnade.info>:
> 
> Hi,
> 
> On Sun, 11 Nov 2018 03:46:48 +0100
> Sebastian Reichel <sebastian.reichel@collabora.com> wrote:
> 
>> Hi,
>> 
>> On Sun, Nov 11, 2018 at 12:20:34AM +0100, Andreas Kemnade wrote:
>>> This is a first try to be able to use h4 devices specified in
>>> the devicetree, so you do not need to call hciattach and
>>> it can be automatically probed.
>>> 
>>> Of course, proper devicetree bindings documentation is
>>> missing. And also you would extend that by regulator/
>>> enable gpio settings.
>>> 
>>> But before proceeding further it should be checked if the
>>> general way of doing things is right.
>>> 
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---  
>> 
>> Patch looks good to me, just one note
>> 
> I found one thing myself:
> Shouldn't we have a generic compatible string like "generic-h4".
> ehci-platform.c has for example:
>        { .compatible = "generic-ehci", },

There might be differences in h4 compatible devices (e.g. default
baud rate) so that I would not bet there a "generic-h4" suffices
in the long run.

And, shouldn't there be a vendor prefix anyways?

I.e. something like "bluetooth,h4"? Because it seems to be defined in
https://www.bluetooth.org/docman/handlers/DownloadDoc.ashx?doc_id=41266

On the other hand, with hci-ll protocol the compatible strings are chip variants.
Well, this seems to be required to decide which firmware to download.

So it boils down to if DT compatibility should be compatible to generic
functions or specific chips? AFAI see this is more or less random and
there seems to be no general rule.

Just some thoughts but no strong preference.

BR,
Nikolaus
