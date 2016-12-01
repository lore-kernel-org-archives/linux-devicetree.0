From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/2] Synopsys USB 2.0 Device Controller (UDC) Driver
Date: Wed, 30 Nov 2016 16:54:45 -0800
Message-ID: <7de6b970-c88c-b277-eaae-d9c0067b590f@synopsys.com>
References: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com>
 <1480485910-7797-3-git-send-email-raviteja.garimella@broadcom.com>
 <874m2pntdh.fsf@linux.intel.com>
 <CAEHZuqNgDwJL7HCP18R_M8TZcW-mENQsfyChv0_Zmm4M2ZTOkg@mail.gmail.com>
 <87k2blm8yx.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87k2blm8yx.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Raviteja Garimella <raviteja.garimella@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
List-Id: devicetree@vger.kernel.org

On 11/30/2016 4:47 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Raviteja Garimella <raviteja.garimella@broadcom.com> writes:
>> Hi Balbi,
>>
>> On Wed, Nov 30, 2016 at 4:10 PM, Felipe Balbi <balbi@kernel.org> wrote:
>>>
>>> Hi,
>>>
>>> Raviteja Garimella <raviteja.garimella@broadcom.com> writes:
>>>> This is driver for Synopsys Designware Cores USB Device
>>>> Controller (UDC) Subsystem with the AMBA Advanced High-Performance
>>>> Bus (AHB). This driver works with Synopsys UDC20 products.
>>>>
>>>> Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
>>>
>>> use drivers/usb/dwc2 instead of duplicating it.
>>
>> The ones we have in drivers/usb/dwc2 is for Designware high speed OTG
>> controller IP. The one that I submitted for review is for USB Device
>> controller IP (UDC). The IPs are different.
> 
> I'll wait for John's confirmation that this really isn't compatible with
> dwc2. John?
> 

Hi Felipe,

This is our older UDC IP, not compatible with HSOTG.

It is also no longer supported by Synopsys and considered EOL.

Regards,
John
