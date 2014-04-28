From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] sysfs, device-tree: aid for debugging device tree boot problems
Date: Mon, 28 Apr 2014 16:09:33 +0100
Message-ID: <CACxGe6ub+10pcoOLEPhdxq=gJpA+JygW+CDFGoXmx+bO=d7KCw@mail.gmail.com>
References: <53571685.5060403@gmail.com> <20140423032044.GA26233@kroah.com>
 <20140423115418.A8C0EC40969@trevor.secretlab.ca> <5358432F.8040202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5358432F.8040202@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 23, 2014 at 11:48 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 4/23/2014 4:54 AM, Grant Likely wrote:
>> On Tue, 22 Apr 2014 20:20:44 -0700, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>>> On Tue, Apr 22, 2014 at 06:25:25PM -0700, Frank Rowand wrote:
>>>> Create some infrastructure to aid trouble shooting device tree related
>>>> boot issues.
>>>>
>>>> Add a %driver_name file to each device tree node sysfs directory which has had
>>>> a driver bound to it.  This allows detecting device tree nodes which failed
>>>> to be bound to any driver.
>>>
>>> Why is this needed, shouldn't there already be a "driver" symlink in
>>> sysfs for these devices when a driver binds to them?  The rest of the
>>> driver model works that way, why is of devices any different?
>>>
>>
>> Because it hasn't been added yet! I only just committed the change to
>> convert device_nodes into kobjects in v3.14. The next step is to add
>> driver symlinks.
>
> No need to add a "driver" symlink.  The device directories in sysfs already
> have a driver symlink.

Sorry, I meant of_node symlink. That is the bit I've been planning to add.

g.
