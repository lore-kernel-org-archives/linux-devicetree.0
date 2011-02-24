From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] ipmi: convert OF driver to platform driver
Date: Thu, 24 Feb 2011 15:34:50 +0100
Message-ID: <201102241534.50886.arnd@arndb.de>
References: <1298497079-20546-1-git-send-email-robherring2@gmail.com> <20110224031528.GB12139@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110224031528.GB12139@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, linux-kernel@vger.kernel.org, Christian Krafft <parabelboi@bopserverein.de>
List-Id: devicetree@vger.kernel.org

On Thursday 24 February 2011, Grant Likely wrote:
> On Wed, Feb 23, 2011 at 03:37:59PM -0600, Rob Herring wrote:
> > From: Rob Herring <rob.herring@calxeda.com>
> > 
> > of_bus is deprecated in favor of the plain platform bus. This patch
> > merges the ipmi OF driver with the existing platform driver.
> > 
> > CONFIG_PPC_OF occurrances are removed or replaced with CONFIG_OF.
> > 
> > Compile tested with and without CONFIG_OF. Tested OF probe and
> > default probe cases.
> > 
> > Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> 
> Wow.  That driver does some weird things with the driver model that
> really should be cleaned up.  That said, this change looks correct.
> I'll add it to my tree and see how it goes.

Please keep me in the look when you want to do further into cleaning
this up. The OF code was initially done for the QS21 running SLOF, and
predates the flattened device tree specs.

I don't know if Christian still remembers the code, but it might
be worthwhile having him on Cc as well.

	Arnd
