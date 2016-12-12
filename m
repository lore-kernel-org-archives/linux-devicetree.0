From: "Thang Q. Nguyen" <tqnguyen@apm.com>
Subject: Re: usb:xhci: support disable usb2 LPM Remote Wakeup
Date: Mon, 12 Dec 2016 11:00:07 +0700
Message-ID: <CAKrQpStd4+ZZjdYyq93zq-wnqQCiQmSi5jJrYbuiZX5kVH74YA@mail.gmail.com>
References: <1480855321-5047-1-git-send-email-tqnguyen@apm.com> <20161209213629.76ixdmr24ln72uaw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161209213629.76ixdmr24ln72uaw@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Vu Nguyen <vnguyen@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 10, 2016 at 4:36 AM, Rob Herring <robh@kernel.org> wrote:
> On Sun, Dec 04, 2016 at 07:42:01PM +0700, Thang Q. Nguyen wrote:
>> From: Thang Nguyen <tqnguyen@apm.com>
>>
>> As per USB 2.0 link power management addendum ECN, table 1-2, page 4,
>> device or host initiated via resume signaling; device-initiated resumes
>> can be optionally enabled/disabled by software. This patch adds support
>> to control enabling the USB2 RWE feature via DT/ACPI attribute.
>>
>> Signed-off-by: Vu Nguyen <vnguyen@apm.com>
>> Signed-off-by: Thang Nguyen <tqnguyen@apm.com>
>> ---
>>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>>  drivers/usb/host/xhci-plat.c                       | 3 +++
>>  drivers/usb/host/xhci.c                            | 5 ++++-
>>  drivers/usb/host/xhci.h                            | 1 +
>>  4 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> index 966885c..9b4cd14 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> @@ -25,6 +25,7 @@ Required properties:
>>
>>  Optional properties:
>>    - clocks: reference to a clock
>> +  - usb2-rwe-disable: disable USB2 LPM Remote Wakeup capable
>
> Remote wakeup has been around since USB 1.0 days. Does this need to be
> USB2 or XHCI specific?
This is XHCI specific. Per XHCI specification 1.1, remote wakeup is
optional for XHCI 1.0 and required for XHCI 1.1. This patch provides
ability for software to disable RWE for USB2 in XHCI1.0 controller.
>
>>    - usb3-lpm-capable: determines if platform is USB3 LPM capable
>>
>>  Example:



-- 

Thang Q. Nguyen    | Staff SW Eng.

C: +849.7684.7606 | O: +848.3770.0640

F: +848.3770.0641  | tqnguyen@apm.com
