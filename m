From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH] dt: Move device tree documentation out of powerpc
 directory
Date: Wed, 26 Jan 2011 14:43:01 -0500
Message-ID: <20110126194301.GA13541@zod.rchland.ibm.com>
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
>The device tree is used by more than just PowerPC.  Make the documentation
>directory available to all.
>
>Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>---
>
>Assuming nobody has an issue with this, I'll push it out to Linus for
>2.6.38 since it is only a documentation change.
>
>g.
>
> .../bindings}/4xx/cpm.txt                          |    0
> .../bindings}/4xx/emac.txt                         |    0
> .../bindings}/4xx/ndfc.txt                         |    0
> .../bindings}/4xx/ppc440spe-adma.txt               |    0
> .../bindings}/4xx/reboot.txt                       |    0

This should probably be renamed to ...bindings}/powerpc4xx/ in that
case.  Similarly for fsl (even more so since they have ARM parts too).

Also the booting-without-of.txt file is very powerpc specific.  So I
would suggest either creating a powerpc/ directory under /bindings or
something similar.

Opinions?

josh
