From: Greg KH <gregkh@suse.de>
Subject: Re: [RFC] drivercore: Add of_match_table to the common device
	drivers
Date: Sun, 7 Mar 2010 10:05:34 -0800
Message-ID: <20100307180534.GA3604@suse.de>
References: <20100307064111.1442.63478.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100307064111.1442.63478.stgit@angua>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kay.sievers@vrfy.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 06, 2010 at 11:47:00PM -0700, Grant Likely wrote:
> OF-style matching can be available to any device, on any type of bus.
> This patch allows any driver to provide an OF match table when CONFIG_OF
> is enabled so that drivers can be bound against devices described in
> the device tree.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> 
> Hi Greg and Kay,
> 
> Here is a potentially even more controversial RFC patch, the relevant
> chunk being the addition of an of-style match table to struct device_driver
> when CONFIG_OF is set.  The idea being that OF style device binding is
> applicable on any bus, regardless of the bus type.  Each bus' probe could
> be trivially extended to allow for an OF-style probe match.
> 
> I've used a #ifdef in this version, but it doesn't have to be conditional
> if that would make for cleaner code.  Either way, none of the core code
> would need to have and #ifdef bits.
> 
> As with the previous patch, I want to get feedback before I proceed too
> far down this path.

I have no objection to this patch at all, it looks good to me.

Perhaps, in the future, you might be able to move the OF driver/device
binding into the driver core itself to make it easier in the end.  But
for now, feel free to add:
	Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
and send it off through your tree.

thanks,

greg k-h
