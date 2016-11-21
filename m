From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH V2] usb: xhci: add support for performing fake doorbell
Date: Mon, 21 Nov 2016 17:31:44 +0200
Message-ID: <58331360.5000508@linux.intel.com>
References: <20161001215817.25384-1-zajec5@gmail.com>
 <20161017203036.23399-1-zajec5@gmail.com>
 <CACna6rw0tnjEOSqjd=q66yWZWa+oNAkH-tk=RLiLzz_=i0x-sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6rw0tnjEOSqjd=q66yWZWa+oNAkH-tk=RLiLzz_=i0x-sA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli <f.fainelli@gmail.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 21.11.2016 09:57, Rafał Miłecki wrote:
> Hi Mathias,
>
> On 17 October 2016 at 22:30, Rafał Miłecki <zajec5@gmail.com> wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Broadcom's Northstar XHCI controllers seem to need a special start
>> procedure to work correctly. There isn't any official documentation of
>> this, the problem is that controller doesn't detect any connected
>> devices with default setup. Moreover connecting USB device to controller
>> that doesn't run properly can cause SoC's watchdog issues.
>>
>> A workaround that was successfully tested on multiple devices is to
>> perform a fake doorbell. This patch adds code for doing this and enables
>> it on BCM4708 family.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: Enable quirk for brcm,bcm4708 machines instead of adding separated binding
>>      for it. Thanks Rob for your comment on this.
>
> Do you think you can pick & push this one? V2 follows Rob's suggestion
> and he has some DT knowledge for sure, so I guess it should be OK.
> --

Is there some more background information on this?

I don't have any contacts to Broadcom myself, adding the BMC Kernel Feedback list to CC.
Maybe someone over there has an errata, documentation or just general feedback.

How was this workaround even figured out? ringing the doorbell for the first
device doesn't seem like something found by trial and error,  especially when
xhci specs state that:

"Software shall not write the Doorbell of an endpoint until after it has issued a
Configure Endpoint Command for the endpoint and received a successful Command
Completion Event."

The whole workaround is a bit intrusive, allocating a fake device, ring a doorbell for a
fake device in the wrong state, clearing off HSE (host system error) which should only be set
when things really go bad, some random usleeps, and possible calling xhci_start() twice.

I can't take this as is without some more info.

-Mathias
