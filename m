From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v1 3/3] ARM: dts: bcm2711: Enable GENET support for the
 RPi4
Date: Sat, 12 Oct 2019 19:05:03 +0200
Message-ID: <bc741ef2-64aa-562c-69cc-f787b35c1058@gmx.net>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
 <20191011184822.866-4-matthias.bgg@kernel.org>
 <dfe9062b-1960-f67b-2a9e-864c0680f5d3@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dfe9062b-1960-f67b-2a9e-864c0680f5d3@gmx.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@kernel.org, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 12.10.19 um 01:09 schrieb Stefan Wahren:
> Am 11.10.19 um 20:48 schrieb matthias.bgg@kernel.org:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> Enable Gigabit Ethernet support on the Raspberry Pi 4
>> Model B.
> I asked some questions about genet to the RPi guys [1] which are
> relevant to this patch (missing clocks and interrupt, MAC address
> assignment) but i didn't get an answer yet.
>
> During my tests with a similiar patch series i noticed that the driver
> won't probe without a MAC address.
>
> How does it get into DT (via U-Boot)?
Okay, the bootloader uses the ethernet0 alias for the genet DT node. So
this should also be added to the RPi 4 DTS. But i consider the MAC
randomize patch still helpful.
>
> [1] -
> https://github.com/raspberrypi/linux/issues/3101#issuecomment-534665860
>
