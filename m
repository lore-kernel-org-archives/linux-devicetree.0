From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Date: Mon, 1 Apr 2019 17:36:01 +0100
Message-ID: <8e574cfa-29d9-0f0a-d670-c4869bd262c4@arm.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus> <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 29/03/2019 14:11, Rob Herring wrote:
> On Thu, Mar 28, 2019 at 1:47 PM James Morse <james.morse@arm.com> wrote:
>> On 28/03/2019 13:16, Rob Herring wrote:
>>> On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
>>>> DT documentation for L2 cache controller added.

>>>> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>>>> new file mode 100644
>>>> index 0000000..abce09f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>>>> @@ -0,0 +1,31 @@
>>>> +SiFive L2 Cache EDAC driver device tree bindings
>>>> +-------------------------------------------------
>>>> +This driver uses the EDAC framework to report L2 cache controller ECC errors.
>>>
>>> Bindings are for h/w blocks, not drivers. (And Boris may want a single
>>> driver, but bindings should reflect the h/w, not what Linux (currently)
>>> wants.
>>
>> For h/w block compatibles and edac, I think all we need now is to ensure the DT contains
>> the three compatible strings: platform (if there is one), soc and ip-name (if its a
>> re-usable thing).
>> This is so that linux can pick the biggest of the three (usually platform) to probe the
>> driver from, as this lets us capture platform properties we only find out about later.
> 
> DT is not the only what to instantiate drivers. If the OS really wants
> to have a single driver for multiple h/w blocks, then it needs to
> instantiate a driver itself (based on the top-level compatible
> probably) and then that driver can find the DT nodes it needs itself.

I think this is where we are heading. (but I need to get my head round this top-level thing).

Can the OS do both, depending on the platform?
e.g. on a system with one component the driver runs 'standalone', whereas on a bigger
system with multiple components the same driver is used as a library by something else.

I don't see how this would work if the common component's DT entry looks the same on both
platforms. Wouldn't this depend on the order stuff is done in, or 'but not this one'
checks in the driver?


> In any case, it's all irrelevant to the DT binding. We don't design
> bindings around what some particular OS wants.

I agree.

What we want to do is spot the problems on the horizon so we either have the right
information in the DT today, or at least know what it looks like so we don't cause a
regression when a new platform makes previous behaviour generic/a-library.


Thanks,

James
