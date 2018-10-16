From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] of: overlay: user space synchronization
Date: Mon, 15 Oct 2018 19:47:16 -0700
Message-ID: <294737e8-f94e-5d53-acaf-ecb9a4ef42af@gmail.com>
References: <1539649621-5518-1-git-send-email-frowand.list@gmail.com>
 <5408.1539650158@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5408.1539650158@turing-police.cc.vt.edu>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: valdis.kletnieks@vt.edu
Cc: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/15/18 17:35, valdis.kletnieks@vt.edu wrote:
> On Mon, 15 Oct 2018 17:27:01 -0700, frowand.list@gmail.com said:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> When an overlay is applied or removed, the live devicetree visible in
>> /proc/device-tree/, aka /sys/firmware/devicetree/base/, reflects the
>> changes.  There is no method for user space to determine whether the
>> live devicetree was modified by overlay actions.
>>
>> Provide a sysfs file, /sys/firmware/devicetree/tree_version,  to allow
>> user space to determine if the live devicetree has remained unchanged
>> while a series of one or more accesses of /proc/device-tree/ occur.
>>
>> The use of both dynamic devicetree modifications and overlay apply and
>> removal are not supported during the same boot cycle.  Thus non-overlay
>> dynamic modifications are not reflected in the value of tree_version.
> 
> Is there an easy way from userspace to detect "yes/no dynamic modifications
> have been done since boot"?
> 

Unfortunately not.

I considered adding detecting dynamic modifications in another patch, making
this a two patch series, but that feature will be much more intrusive than
detecting modifications made by overlays.  I may add that feature in the
future, but not anytime soon.

If you want to understand a little bit about why dynamic modifications
occur, please see my reply to Geert in the thread about version 1 of
this patch.
