From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH] devicetree: Add empty of_platform_populate() for
 !CONFIG_OF_ADDRESS (sparc)
Date: Mon, 27 Feb 2012 11:39:58 +0100
Message-ID: <20120227103958.GJ27687@sortiz-mobl>
References: <1330121218-10442-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1330121218-10442-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Benoit Cousson <b-cousson@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Fri, Feb 24, 2012 at 03:06:58PM -0700, Grant Likely wrote:
> Sparc has its own helpers for translating address ranges when the device
> tree is parsed at boot time, and it isn't able to use of_platform_populate().
> However, there are some device drivers that want to use that function on
> other DT enabled platforms (ie. TWL4030).  This patch adds an empty
> of_platform_populate() implementation that returns an error when
> CONFIG_OF_ADDRESS is not selected.
Applied as well. Please let me know if you'd prefer to see this one going
through your irqdomain/next branch.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
