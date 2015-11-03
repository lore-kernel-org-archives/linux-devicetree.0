From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND 02/16] Documentation: dt-bindings: backlight: add
 TI LMU backlight binding information
Date: Tue, 3 Nov 2015 09:32:52 -0600
Message-ID: <CAL_JsqJpGBOVQs4P1Ephz6TkCciazUtKtt+HUU5BQSL3UW9oxg@mail.gmail.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-3-git-send-email-milo.kim@ti.com> <CAL_JsqJVtObYi5+KYNC7fKDokM3a77mH5nqkExW73s+yPcC9DQ@mail.gmail.com>
 <56385E84.2050702@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56385E84.2050702@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 3, 2015 at 1:13 AM, Kim, Milo <milo.kim@ti.com> wrote:
>
> On 11/3/2015 12:02 AM, Rob Herring wrote:
>>
>> On Sun, Nov 1, 2015 at 11:24 PM, Milo Kim <milo.kim@ti.com> wrote:
>>>
>>> LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697 use common dt-bindings
>>> for describing device.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: Jingoo Han <jingoohan1@gmail.com>
>>> Cc: Lee Jones <lee.jones@linaro.org>
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Milo Kim <milo.kim@ti.com>
>>> ---
>>>   .../bindings/video/backlight/ti-lmu-backlight.txt  | 67
>>> ++++++++++++++++++++++
>>
>>
>> Please move to bindings/leds/backlight/
>
>
> There are backlight bindings under video/backlight. I'd like to know why

Not if you look in linux-next.

> this 'led' location is preferred. My guess is most of properties are from
> common LED properties. Any other reasons?

Yes, that is the main reason.

Rob
