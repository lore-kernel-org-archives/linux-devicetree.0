From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v7 3/7] of/platform: Add functional dependency link from
 DT bindings
Date: Mon, 19 Aug 2019 10:16:25 -0700
Message-ID: <19c99a6e-51c3-68d7-d1d6-640aae754c14@gmail.com>
References: <20190724001100.133423-1-saravanak@google.com>
 <20190724001100.133423-4-saravanak@google.com>
 <141d2e16-26cc-1f05-1ac0-6784bab5ae88@gmail.com>
 <CAGETcx-dVnLCRA+1CX47gtZgtwTcrN5KefpjMzh9OJB-BEnqyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGETcx-dVnLCRA+1CX47gtZgtwTcrN5KefpjMzh9OJB-BEnqyg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/15/19 6:50 PM, Saravana Kannan wrote:
> On Wed, Aug 7, 2019 at 7:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 7/23/19 5:10 PM, Saravana Kannan wrote:
>>> Add device-links after the devices are created (but before they are
>>> probed) by looking at common DT bindings like clocks and
>>> interconnects.


< very big snip (lots of comments that deserve answers) >


>>
>> /**
>>  * of_link_property - TODO:
>>  * dev:
>>  * con_np:
>>  * prop:
>>  *
>>  * TODO...
>>  *
>>  * Any failed attempt to create a link will NOT result in an immediate return.
>>  * of_link_property() must create all possible links even when one of more
>>  * attempts to create a link fail.
>>
>> Why?  isn't one failure enough to prevent probing this device?
>> Continuing to scan just results in extra work... which will be
>> repeated every time device_link_check_waiting_consumers() is called
> 
> Context:
> As I said in the cover letter, avoiding unnecessary probes is just one
> of the reasons for this patch. The other (arguably more important)

Agree that it is more important.


> reason for this patch is to make sure suppliers know that they have
> consumers that are yet to be probed. That way, suppliers can leave
> their resource on AND in the right state if they were left on by the
> bootloader. For example, if a clock was left on and at 200 MHz, the
> clock provider needs to keep that clock ON and at 200 MHz till all the
> consumers are probed.
> 
> Answer: Let's say a consumer device Z has suppliers A, B and C. If the
> linking fails at A and you return immediately, then B and C could
> probe and then figure that they have no more consumers (they don't see
> a link to Z) and turn off their resources. And Z could fail
> catastrophically.

Then I think that this approach is fatally flawed in the current implementation.

A device can be added by a module that is loaded.  In that case the device
was not present at late boot when the suppliers may turn off their resources.
(I am assuming the details since I have not reviewed the patches later in
the series that implement this part.)

Am I missing something?

If I am wrong, then I'll have more comments for your review replies for
patches 2 and 3.

> 

< another snip >

> Thanks,
> Saravana
> 

-Frank
