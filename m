From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3] of: overlay: user space synchronization
Date: Thu, 18 Oct 2018 17:06:35 -0700
Message-ID: <2f99d700-6276-cfa4-8878-4eb161126330@gmail.com>
References: <1539736466-28638-1-git-send-email-frowand.list@gmail.com>
 <20181018193216.GA9971@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018193216.GA9971@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/18/18 12:32, Rob Herring wrote:
> On Tue, Oct 16, 2018 at 05:34:26PM -0700, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> When an overlay is applied or removed, the live devicetree visible in
>> /proc/device-tree/, aka /sys/firmware/devicetree/base/, reflects the
>> changes.  There is no method for user space to determine whether the
>> live devicetree was modified by overlay actions.
> 
> Because userspace has no way to modify the DT and the ways the kernel 
> can do modifications is limited.
> 
> Do you have an actually need for this outside of testing/development?

I do not know if anyone uses /proc/device-tree for anything outside of
testing/development.  If we believe that there is no other use of
/proc/device-tree we can simply document that there is no expectation
that accessors will see a consistent, unchanging /proc/device-tree.

That would be a much smaller patch.


>> Provide a sysfs file, /sys/firmware/devicetree/tree_version,  to allow
>> user space to determine if the live devicetree has remained unchanged
>> while a series of one or more accesses of /proc/device-tree/ occur.
>>
>> The use of both (1) dynamic devicetree modifications and (2) overlay
>> apply and removal are not supported during the same boot cycle.  Thus
>> non-overlay dynamic modifications are not reflected in the value of
>> tree_version.
> 
> I'd prefer to see some sort of information on overlays exported and user 
> space can check if that changed. IIRC, Pantelis had a series to do that 
> along with a kill switch to prevent further modifications. At least some 
> of that series only had minor issues to fix.

The kill switch addresses a different concern, which was from the security
community.  The kill switch is on my todo list.

I don't remember exactly what info the overlay information export patch
provided.  I'll have to go find it and re-read it.


> Also, shouldn't we get uevents if the tree changes? Maybe that's not 

Yes (off the top of my head).  But a shell script accessing /proc/device-tree
is not going to get uevents.


> guaranteed, but I'd bet we can't handle cases where we don't get events. 
> A property added to an existing node comes to mind.> 
> Rob
> 
