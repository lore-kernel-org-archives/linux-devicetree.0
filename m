From: Insop Song <insop.song@gainspeed.com>
Subject: Re: [PATCH] Configure FSL eSPI CSBEF, CSAFT, and whether to send all
 received data to user
Date: Mon, 14 Apr 2014 14:38:53 -0700
Message-ID: <20140414213853.GF14129@neon.local.cohere.net>
References: <1397328516-13260-1-git-send-email-Jane.Wan@gainspeed.com>
 <20140414205151.GH25182@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140414205151.GH25182@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jane Wan <Jane.Wan@gainspeed.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, Emilian.Medve@Freescale.com, kenth.eriksson@transmode.com, thomas.de.schampheleire@gmail.com, b48286@freescale.com, jg1.han@samsung.com, sr@denx.de, spi-devel-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 14, 2014 at 09:51:51PM +0100, Mark Brown wrote:
> On Sat, Apr 12, 2014 at 11:48:35AM -0700, Jane Wan wrote:
> > Make FSL eSPI properties configurable through device tree.  The
> > configurable parameters include CSnBEF and CSnAFT in ESPI_SPMODEn
> > registers (n=0,1,2,3), and whether to send all received data to user.
> 
> Don't send cover letters for individual patches, include anything that's
> needed in the patch changelog or after the ---.
> 
> > Test done:
> > - Kernel version 3.8.13
> 
> We're developing v3.15 now, you need to submit against current code.
> 

We will generate a new patch.

> Please also be sure to CC the mailing list on patches, the sourceforge
> list has been unused for quite some time now.

We use scripts/get_maintainer.pl to get the mailing addresses.
We will double check the mailing list from MAINTAINER file.

Regards,

Insop
