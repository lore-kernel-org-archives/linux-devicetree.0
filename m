From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 00/25] irq_domain generalization and refinement
Date: Mon, 30 Jan 2012 20:53:44 -0800
Message-ID: <20120131045344.GA27609@quad.lixom.net>
References: <1327700179-17454-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1327700179-17454-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Rothwell <sfr@canb.auug.org.au>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 27, 2012 at 02:35:54PM -0700, Grant Likely wrote:
> Hey everyone,
> 
> This patch series is ready for much wider consumption now.  I'd like
> to get it into linux-next ASAP because there will be ARM board support
> depending on it.  I'll wait a few days before I ask Stephen to pull
> this in.
> 
> Stephen/Milton/Ben, any testing you can help with here would be
> appreciated since you've got access to a wider variety of Power
> machines than I do.

This series has been:

Tested-by: Olof Johansson <olof@lixom.net>

On powerpc/pasemi (it's the only one I still have easy access to).


-Olof
