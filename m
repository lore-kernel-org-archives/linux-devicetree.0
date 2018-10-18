From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] of: overlay: user space synchronization
Date: Thu, 18 Oct 2018 14:32:16 -0500
Message-ID: <20181018193216.GA9971@bogus>
References: <1539736466-28638-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539736466-28638-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 16, 2018 at 05:34:26PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> When an overlay is applied or removed, the live devicetree visible in
> /proc/device-tree/, aka /sys/firmware/devicetree/base/, reflects the
> changes.  There is no method for user space to determine whether the
> live devicetree was modified by overlay actions.

Because userspace has no way to modify the DT and the ways the kernel 
can do modifications is limited.

Do you have an actually need for this outside of testing/development?

> Provide a sysfs file, /sys/firmware/devicetree/tree_version,  to allow
> user space to determine if the live devicetree has remained unchanged
> while a series of one or more accesses of /proc/device-tree/ occur.
> 
> The use of both (1) dynamic devicetree modifications and (2) overlay
> apply and removal are not supported during the same boot cycle.  Thus
> non-overlay dynamic modifications are not reflected in the value of
> tree_version.

I'd prefer to see some sort of information on overlays exported and user 
space can check if that changed. IIRC, Pantelis had a series to do that 
along with a kill switch to prevent further modifications. At least some 
of that series only had minor issues to fix.

Also, shouldn't we get uevents if the tree changes? Maybe that's not 
guaranteed, but I'd bet we can't handle cases where we don't get events. 
A property added to an existing node comes to mind.

Rob
