From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v16 0/6] Device Tree support for FPGA programming
Date: Thu, 11 Feb 2016 15:22:52 -0600
Message-ID: <CAL_JsqJHuhFG-wtkzDcBzz4b3cM=A8hgT+8DiwSeSKRPZT-e9g@mail.gmail.com>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com> <alpine.DEB.2.02.1602111411460.26384@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1602111411460.26384@linuxheads99>
Sender: linux-kernel-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, delicious.quinoa@gmail.com, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 2:49 PM, atull <atull@opensource.altera.com> wrote:
> On Fri, 5 Feb 2016, atull@opensource.altera.com wrote:
>
>> From: Alan Tull <atull@opensource.altera.com>
>>
>> v16 Refactors the FPGA Area and FPGA Bus into single thing called an
>> FPGA Region and eliminates using simple-bus.  I'm using the word
>> "region" as it's a term is used in the literature of both the major
>> FPGA manufacturors.
>>
>> Changes for v16:
>> * Refactor the FPGA Area and FPGA Bus into a FPGA Region.
>> * Don't use simple-bus.
>> * FPGA Managers and FPGA Bridges are now specified by phandle using the
>>   "fpga-mgr" and "fpga-bridges" properties.  fpga-bridges can specify
>>   more than one bridge.
>> * Device Tree overlays should be targeted to a FPGA Region.
>> * The overlays need only contain firmware-name and the child nodes.
>> * To model a system containing >1 partial reconfiguration region,
>>   an overlay could add FPGA Regions to the base FPGA Regions.
>> * Child FPGA Regions inherit the parent FGPA Manager, but specify
>>   their own set of bridges if needes as partial reconfig regions
>>   will likely need their own bridges.
>> * All this is discussed in bindings/fpga/fpga-region.txt
>>
>> One other highlight:
>> The little engine that runs this thing is a reconfig notifier
>> in fpga-region.c.  This notifier that will program an FPGA if a
>> "firmware-name" property gets added to a fpga-region.  Then
>> it will call of_platform_populate().  The current behavior in Linux
>> when a DT overlay is applied is that the reconfig notifications
>> go out in heirarchical order: first notifications are for the
>> properties, then notifications for the child nodes.  So an overlay
>> that adds a 'firmware-name' property and some child nodes to a
>> fpga-region will cause FPGA programming and child node
>> populating in the right order.
>
> I figured out how to get rid of the reconfig notifier.
>
>>
>> One issue with the dynamic DT stuff:
>> I've tried returning and error from the notifier if FPGA programming
>> fails; the error is noted on the console, but the child nodes
>> get probed anyway.
>
> I looked into it further and now I've got a solution for this issue
> that I can post soon.  I can stop using the DT overlay configfs
> interface and add a sysfs file for applying an overlay to an FPGA
> region.  The FPGA region implementation will see the overlay before it
> becomes part of the live tree.  Then it can do the FPGA programming
> and see that succeed before the child nodes become part of the live
> tree.  If FPGA programming fails, the overlay will be rejected before
> it becomes part of the live tree.  By the time 'firmware-name' and the
> child nodes show up in the live tree, they will be post-configuration
> information.

Um, no. We don't need 2 interfaces for loading overlays from
userspace. I could see this being a common problem and it needs to be
solved. But given the configfs interface is not upstream yet, perhaps
you should worry about that after the current series is in.

Perhaps we need a pre-add notifier and the core will only load the
overlay if nothing handles it. Really, a solution without notifiers
would be preferred. Maybe register handlers with the DT core for
certain paths.

Rob
