From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt: Move device tree documentation out of powerpc
	directory
Date: Wed, 26 Jan 2011 20:12:10 +0100
Message-ID: <20110126191210.GA3377@merkur.ravnborg.org>
References: <1296062434-18027-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1296062434-18027-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 26, 2011 at 10:20:34AM -0700, Grant Likely wrote:
> The device tree is used by more than just PowerPC.  Make the documentation
> directory available to all.

How does the planned stucture look like for this
new directory?
I see that in your move the architecture is dropped.
But some of these looks like they are arch candidates.
The 4xx/* for example looks like powerpc stuff that
should be in a powerpc directory.

Another is sja1000. This is obviously a can driver.
So how about mirroring the kernel structure:

Proposal:

drivers/net/can   <=== sja1000.txt
drivers/ata/      <=== fsl/sata.txt
arch/powerpc      <=== powerpc specific stuff

This is a bit more effort but then we end
up with a well-known structure.

	Sam
