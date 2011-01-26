From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH] driver-core: remove conditionals around devicetree
 pointers
Date: Wed, 26 Jan 2011 11:17:34 +0800
Message-ID: <20110126031734.GA1636@suse.de>
References: <20110126015414.31133.56437.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110126015414.31133.56437.stgit@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 25, 2011 at 07:02:02PM -0700, Grant Likely wrote:
> Having conditional around the of_match_table and the of_node pointers
> turns out to make driver code use ugly #ifdef blocks.  Drop the
> conditionals and remove the #ifdef blocks from the affected drivers.
> 
> Also tidy up minor whitespace issues within the same hunks.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> 
> I've held off doing this since I didn't want to needlessly increase
> the size of struct device and struct device_driver for users who don't
> use CONFIG_OF.  However, its quibbling about a tiny amount of memory,
> and #ifdef'ing it out this way is ugly for driver code.
> 
> Alternately, if I should be concerned about the extra memory, I could
> define some macros/inlines similar to how CONFIG_NUMA is handled.

No objection from me, I was wondering when you would get around to doing
this :)

If you want me to take this in my tree, I'd be glad to, otherwise feel
free to send it through yours, and add a:
	Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
to it.

Nice job,

greg k-h
