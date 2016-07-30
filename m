From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Revert "pstore/ram: add Device Tree bindings"
Date: Fri, 29 Jul 2016 17:49:41 -0700
Message-ID: <CAGXu5j+YpTLarGSAPwHi81VXzvj4J090LBnAO6wgReAS_EQU=A@mail.gmail.com>
References: <20160728202537.11961-1-robh@kernel.org> <CAGXu5jJnfCGsqiuVWNrvrZkmKz5nD0hnQSQ+Vr4x-GD5dDa7AA@mail.gmail.com>
 <CAL_Jsq+VmaFjWKqKfuqh5a1WkSYuw8w8SKBHK7MF6j-i7Fv_gA@mail.gmail.com> <CAGXu5jL94J59+TKfgmT-5vPOBpNhXc96Nn1Ka1ZMWrT0TP989Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jL94J59+TKfgmT-5vPOBpNhXc96Nn1Ka1ZMWrT0TP989Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 28, 2016 at 3:44 PM, Kees Cook <keescook@chromium.org> wrote:
> On Thu, Jul 28, 2016 at 2:10 PM, Rob Herring <robh@kernel.org> wrote:
>> On Thu, Jul 28, 2016 at 3:50 PM, Kees Cook <keescook@chromium.org> wrote:
>>> On Thu, Jul 28, 2016 at 1:25 PM, Rob Herring <robh@kernel.org> wrote:
>>>> This reverts commit 35da60941e44dbf57868e67686dd24cc1a33125a.
>>>> ---
>>>> WTF!
>>>>
>>>> I don't recall acking this nor have my comments (Arnd's really) been
>>>> addressed[1]. This should not have been merged yet.
>>>
>>> The conversation seemed to me to describe an alternative that could be
>>> moved to, but that it was going to need more work. In the meantime,
>>> these are the DT bindings used in real devices already. It seemed
>>> clear to me that reducing the delta now and improving the
>>> implementation in the future was the right thing to do in this case. I
>>> didn't think your comments were a hard NAK, but rather a "we should do
>>> this in the future", and I added it as a TODO for the pstore tree.
>>>
>>> Is a revert really justified here? This doesn't break anything (quite
>>> the opposite, actually).
>>
>> Yes. Bindings are an ABI, so they can't evolve other than get
>> additional properties.
>
> Okay. I still think that from a pragmatic perspective, this isn't
> different from reality: Android carries a version of this, so that ABI
> already "exists", but, regardless, I misunderstood the intensity of
> your concerns. :)
>
>> I'm keen to have this in too because I know there are lots of users
>> (extract a DT from a Calxeda system ;)). It's not really that far off
>> (drop memory-region and define the location in /reserved-memory) I
>> think. So send a follow-up for 4.8 and then it doesn't need a revert.
>
> Okay, I'll see what I can figure out.

Confusing: ARM doesn't show reserved memblocks in /proc/iomem. I spent
way too much time thinking my .dts was wrong. :( Booting with
"memblock=debug" helped...

So, the proposed DT looks like this:

{/
        reserved-memory {
                  ramoops@78000000 {

There's no "compatible" entry in "reserved-memory", so it's skipped
for probing, as far as I can tell. Which brings me back to your
original email where you said:

> This will in addition need an
> of_platform_populate call on the /reserved-memory node to get the
> platform device created.

Where should I add the of_platform_populate() call? All the reserved
memory logic is way too early during FDT, so right now I have it
working by adding it to init_machine_late() which feels very ugly (and
a bit too late: I'd like it as early as possible). :P

It seems like it should go right after the top-level call to
of_platform_populate(NULL, NULL, NULL, NULL), but that seems to be
done on a per-board basis? I can't figure it out.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
