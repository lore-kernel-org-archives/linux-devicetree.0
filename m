From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3] of: overlay: user space synchronization
Date: Fri, 2 Nov 2018 21:54:40 -0700
Message-ID: <918df992-d21f-b237-1ff3-f0b410b32112@gmail.com>
References: <1539736466-28638-1-git-send-email-frowand.list@gmail.com>
 <20181018193216.GA9971@bogus>
 <2f99d700-6276-cfa4-8878-4eb161126330@gmail.com>
 <CAL_Jsq+=OiXTSSEr4QuiyqCzyrKdH0M8HhmOjVha3SWM5Y62Gw@mail.gmail.com>
 <399b1ed0-ac64-d962-5eea-23a99011aada@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <399b1ed0-ac64-d962-5eea-23a99011aada@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

First, the point of this patch was to provide a way for userspace (program,
command line interface, whatever -- that is orthogonal) to ensure that its
view of the devicetree via /proc/device-tree/ is consistent since an overlay
apply or remove can alter the devicetree.

For in-kernel use, typically some sort of lock or rcu would be used to
provide this type of functionality.


On 10/22/18 12:30 AM, Frank Rowand wrote:
> On 10/19/18 9:06 AM, Rob Herring wrote:
>> On Thu, Oct 18, 2018 at 7:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>
>>> On 10/18/18 12:32, Rob Herring wrote:
>>>> On Tue, Oct 16, 2018 at 05:34:26PM -0700, frowand.list@gmail.com wrote:
>>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>>
>>>>> When an overlay is applied or removed, the live devicetree visible in
>>>>> /proc/device-tree/, aka /sys/firmware/devicetree/base/, reflects the
>>>>> changes.  There is no method for user space to determine whether the
>>>>> live devicetree was modified by overlay actions.
>>>>
>>>> Because userspace has no way to modify the DT and the ways the kernel
>>>> can do modifications is limited.
>>>>
>>>> Do you have an actually need for this outside of testing/development?
>>>
>>> I do not know if anyone uses /proc/device-tree for anything outside of
>>> testing/development.  If we believe that there is no other use of
>>> /proc/device-tree we can simply document that there is no expectation
>>> that accessors will see a consistent, unchanging /proc/device-tree.
>>
>> I didn't mean whether /proc/device-tree is used outside of testing. It
>> is. The question is whether any users care if there are changes
>> happening. If so what is the use case?
> 
> What is the point of looking at a devicetree if you don't know if it
> is in a consistent state or part way through a change?
> 
>  
>> kexec used to be one of the main users, but I think it has switched
>> over to the exported FDT which matches what the kernel was originally
>> passed.
> 
> Yes, last I checked kexec was using FDT from /sys/firmware/fdt.
> 
> 
>>>
>>> That would be a much smaller patch.
>>>
>>>
>>>>> Provide a sysfs file, /sys/firmware/devicetree/tree_version,  to allow
>>>>> user space to determine if the live devicetree has remained unchanged
>>>>> while a series of one or more accesses of /proc/device-tree/ occur.
>>>>>
>>>>> The use of both (1) dynamic devicetree modifications and (2) overlay
>>>>> apply and removal are not supported during the same boot cycle.  Thus
>>>>> non-overlay dynamic modifications are not reflected in the value of
>>>>> tree_version.
>>>>
>>>> I'd prefer to see some sort of information on overlays exported and user
>>>> space can check if that changed. IIRC, Pantelis had a series to do that
>>>> along with a kill switch to prevent further modifications. At least some
>>>> of that series only had minor issues to fix.
>>>
>>> The kill switch addresses a different concern, which was from the security
>>> community.  The kill switch is on my todo list.
>>
>> Yes, but there could be other uses. It's not a big step from wanting
>> to know if the DT has changed to wanting to control it changing or
>> not.
>>
>> Perhaps the kill switch needs 2 levels: a temporary freeze and a
>> permanent freeze. In any case, they don't seem completely unrelated
>> and I don't really want to see userspace ABI added bit by bit.
> 
> I can add a kill switch patch.

The point behind the kill switch is to allow a way to disable modification
of the devicetree from userspace via an overlay manager.  Since there is
no userspace overlay manager, there is no need for a kill switch.  The
kill switch (or equivalent functionality) should be added as part of
adding the overlay manager, when that occurs.

Addressing adding userspace ABI bit by bit, any discussion of what the userspace
overlay manager interface will look like is purely conjecture.  I do not want
to wait till the overlay manager to be added before the current problem of
user space synchronization is addressed.


>>> I don't remember exactly what info the overlay information export patch
>>> provided.  I'll have to go find it and re-read it.
>>>
>>>
>>>> Also, shouldn't we get uevents if the tree changes? Maybe that's not
>>>
>>> Yes (off the top of my head).  But a shell script accessing /proc/device-tree
>>> is not going to get uevents.
>>
>> No, but userspace can get them. Accessible from a shell script is not
>> a requirement of kernel interfaces.
> 
> OK for now.  I haven't thought that concept through, but it is not key to
> whether this feature is useful.  The same functionality is also needed
> by programs.
> 
> I'll have to dig into the uevent implementation and architecture to see
> whether uevents are a possible solution.  This patch can wait for me to
> finish this.

Getting a uevent does not provide the information needed to ensure that
the devicetree is in a consistent state over a set of accesses to
/proc/device-tree (that is, a "critical section").


> 
> If the current patch ends up being the best method, I still need to
> re-work to add memory barriers (or somehow convince myself that they
> are not needed).

In the current version of the patch, I was reluctant to provide the
synchronization via a lock in the sysfs show function because I did
not find any documentation or discussion that assured me that a lock
was legal in that context.  I have since asked Greg KH if using a
lock for synchronization in the show function is ok and he assured
me that it is.  Based on that, I have a new version of the patch that
is conceptually cleaner, easier to understand, and easier to use.

-Frank

> 
> -Frank
> 
> 
>>
>> Rob
>>
> 
> 
