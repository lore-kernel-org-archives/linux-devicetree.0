From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for chromeos-firmware
Date: Wed, 2 Dec 2015 12:44:38 -0600
Message-ID: <CAL_JsqLhoEc9M=ZUgqL1_ZFKVN+1UfL=h-mWUdri0O_bqZyf_g@mail.gmail.com>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk>
 <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk>
 <20151202151552.GA11101@rob-hp-laptop> <565F2137.609@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <565F2137.609@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 2, 2015 at 10:49 AM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:
>
>
> On 02/12/15 15:15, Rob Herring wrote:
>>
>> On Tue, Dec 01, 2015 at 07:12:49PM +0000, Martyn Welch wrote:
>>>
>>> This patch adds documentation for the chromeos-firmware binding.
>>>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Pawel Moll <pawel.moll@arm.com>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
>>> Cc: Kumar Gala <galak@codeaurora.org>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
>>> ---
>>>   .../devicetree/bindings/misc/chromeos-firmware.txt | 27
>>> ++++++++++++++++++++++
>>
>>
>> bindings/firmware/ please.
>>
>
> OK.
>
>>>   1 file changed, 27 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>> b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>> new file mode 100644
>>> index 0000000..8240611
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>> @@ -0,0 +1,27 @@
>>> +Device-Tree bindings for chromeos-firmware.c.
>>
>>
>> Perhaps a bit more description what this is.
>>
>> What aspect of this is firmware? How does this relate to the EC?
>>
>
> With respect to write-protect, this line is the write protection for the
> flash which holds the bootloader.

What is driving the write-protect? Are trying to assign ownership of
the SOC GPIOs to the bootloader/firmware? If so, I think this is all
wrong.

Rob
