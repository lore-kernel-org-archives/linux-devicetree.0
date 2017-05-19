From: "Thang Q. Nguyen" <tqnguyen@apm.com>
Subject: Re: [v1 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2 HW LPM
Date: Fri, 19 May 2017 10:44:12 +0700
Message-ID: <CAKrQpSuKP9KaNY2hm4VHv38TOBhYMLF0=Qg9WYNYNAqn2=GwrQ@mail.gmail.com>
References: <1494634394-24388-1-git-send-email-tqnguyen@apm.com> <20170518223026.vspw4p3nettjn3kx@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170518223026.vspw4p3nettjn3kx@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Duc Tran <dxtran@apm.com>, Quang Han <qhan@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 5:30 AM, Rob Herring <robh@kernel.org> wrote:
> On Sat, May 13, 2017 at 07:13:14AM +0700, Thang Q. Nguyen wrote:
>> XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
>> to always enable hardware USB2 LPM.
>> However, the current xHCI driver always enable it by setting HLE=1 when
>> seeing HLC=1. This makes certain xHCI controllers that have broken USB2
>> HW LPM fail to work as there is no way to disable this feature.
>> This patch adds support to control disabling USB2 Hardware LPM via
>> DT/ACPI attribute.
>>
>> Signed-off-by: Tung Nguyen <tunguyen@apm.com>
>> Signed-off-by: Thang Q. Nguyen <tqnguyen@apm.com>
>> ---
>>  Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
>>  drivers/usb/host/xhci-plat.c                       |    3 +++
>>  drivers/usb/host/xhci.c                            |    7 ++++++-
>>  drivers/usb/host/xhci.h                            |    1 +
>>  4 files changed, 11 insertions(+), 1 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> index 2d80b60..b5da569 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> @@ -26,6 +26,7 @@ Required properties:
>>
>>  Optional properties:
>>    - clocks: reference to a clock
>> +  - usb2-hle-disable: disable USB2 LPM for hardware does not support it
>>    - usb3-lpm-capable: determines if platform is USB3 LPM capable
>
> Can we have some consistency in the naming of these 2 properties? At
> least use 'lpm' rather than 'hle'. I don't recall why the 2nd one is not
> default enabled, but that would make more sense.
Thanks. I will update the attribute to "usb2-lpm-disable" in the next
patch revision.
>
>>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>>
