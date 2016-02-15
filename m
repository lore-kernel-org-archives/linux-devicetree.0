From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v16 0/6] Device Tree support for FPGA programming
Date: Mon, 15 Feb 2016 09:40:04 -0800
Message-ID: <CAAtXAHc4VkmBp5UuLs31BgyV--++0k5VANZf4ico0uRQO-BWxQ@mail.gmail.com>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
	<alpine.DEB.2.02.1602111411460.26384@linuxheads99>
	<CAL_JsqJHuhFG-wtkzDcBzz4b3cM=A8hgT+8DiwSeSKRPZT-e9g@mail.gmail.com>
	<alpine.DEB.2.02.1602111548200.26384@linuxheads99>
	<alpine.DEB.2.02.1602111614530.26384@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1602111614530.26384@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Josh Cartwright <joshc@ni.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Thu, Feb 11, 2016 at 2:17 PM, atull <atull@opensource.altera.com> wrote:

>> > > I looked into it further and now I've got a solution for this issue
>> > > that I can post soon.  I can stop using the DT overlay configfs
>> > > interface and add a sysfs file for applying an overlay to an FPGA
>> > > region.  The FPGA region implementation will see the overlay before it
>> > > becomes part of the live tree.  Then it can do the FPGA programming
>> > > and see that succeed before the child nodes become part of the live
>> > > tree.  If FPGA programming fails, the overlay will be rejected before
>> > > it becomes part of the live tree.  By the time 'firmware-name' and the
>> > > child nodes show up in the live tree, they will be post-configuration
>> > > information.

I agree this would be a very nice interface, but Rob is right, having
two different
interfaces to load device-trees is probably bad in general.

>> Yes.  If any handler returns error, the overlay doesn't go into the
>> main tree.  Handler type to be registed could be:
>>
>>   int pre_add_handler(struct device_node *overlay,
>>                       struct device_node *target)
>
> And a third parameter of some flags to indicate whether the
> overlay is being added or removed.

Looks good to me.

>> That gives us the overlay after it's been unflattened and phandles
>> resolved and the node that it was targeted to.  I was going to
>> need find_target_node() to be exported, but this avoids that.
>>
>> Registration could by compatible string, of match, or path.  Path
>> would be too rigid in my case, I'd want to register for compatible
>> "fpga-region"

Looks good to me. I think we're getting pretty close :)

Moritz
