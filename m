From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] firmware: of: populate /firmware/ node during init
Date: Fri, 11 Aug 2017 10:05:43 -0500
Message-ID: <CABGGisyQKfre_qMqnngOiKbqUaHF0KWKtZyYPJ47iPwgL5t6xw@mail.gmail.com>
References: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
 <1502458237-1683-2-git-send-email-sudeep.holla@arm.com> <CAK8P3a1p8xS4u5EQ9auqgcmhXaybhDdsa6ah3G-7TeEf+ko9kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1p8xS4u5EQ9auqgcmhXaybhDdsa6ah3G-7TeEf+ko9kA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 11, 2017 at 9:37 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Aug 11, 2017 at 3:30 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> Since "/firmware" does not have its own "compatible" property as it's
>> just collection of nodes representing firmware interface, it's sub-nodes
>> are not populated during system initialization.
>>
>> Currently different firmware drivers search the /firmware/ node and
>> populate the sub-node devices selectively. Instead we can populate
>> the /firmware/ node during init to avoid more drivers continuing to
>> populate the devices selectively.
>>
>> This patch adds initcall to achieve the same.
>
> Hmm, I'm a bit skeptical whether representing anything under /firmware
> as a platform device is a good idea. Having a more structured way to
> probe those seems like a good idea, but maybe a different subsystem
> would be more appropriate.
>
> I do realize that a 'platform_device' has become a rather generic abstraction
> for almost anything, but at some point we might want to draw the line
> of what is a platform_device.

I guess the question how are they different? Most of what's under
drivers/firmware/ are platform drivers. I think they are mostly either
smc calls or mailbox interfaces. Would there be any advantage to
creating an smc bus or mailbox bus?

It's easier to convert from a platform driver to some new bus_type
than convert from a non-driver if we decide to do that later.

The other approach would be to do a whitelist of compatibles. That's
what's being done for /reserved-memory (currently there's one
(ramoops) and a 2nd is being added).

Rob
