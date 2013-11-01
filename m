From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: Strange location and name for platform  devices when
 device-tree is used.
Date: Sat, 02 Nov 2013 07:33:21 +1100
Message-ID: <1383338001.28909.42.camel@pasglop>
References: <20131101145925.66e22f73@notabene.brown>
	 <1383279744.28909.26.camel@pasglop> <1383280054.28909.30.camel@pasglop>
	 <20131101160329.37f3707b@notabene.brown>
	 <1383282516.28909.36.camel@pasglop>
	 <20131101180459.81793C40A28@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131101180459.81793C40A28@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: NeilBrown <neilb@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-11-01 at 11:04 -0700, Grant Likely wrote:

> There are two problems here. First, making the change moves all the DT
> populated devices under the /sys/devices/platform tree, not just
> platform devices.

All DT populated *platform* devices. There are others that have their
own locations.

> Second, I expect there is going to be userspace breakage to move them.
> I've considered moving them before, but so far have felt that being
> tidier hasn't been worth the potential breakage. Userspace /shouldn't/
> be relying on the node name, but we all know that userspace always does
> what it should, right?
> 
> That said, I'm mostly concerned about breakage on Power machines, not on
> the ARM devices in this regard. If you are convinced that I'm worrying about
> nothing, then I'm fine with making the change. If anyone complains
> however then it will need to be reverted.

I don't see an issue with power.

Cheers,
Ben.
