From: Alistair Popple <alistair@popple.id.au>
Subject: Re: [4/5] IBM Akebono: Add the Akebono platform
Date: Fri, 02 May 2014 10:35:02 +1000
Message-ID: <10214508.Vq3Ynjy2Co@mexican>
References: <1394077948-8395-5-git-send-email-alistair@popple.id.au> <1398936447.4121.12.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398936447.4121.12.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Paul,

On Thu, 1 May 2014 11:27:27 Paul Bolle wrote:
> On Thu, 2014-03-06 at 14:52 +1100, Alistair Popple wrote:

[...]

> > This patch adds support for the IBM Akebono board.
> > +	select IBM_EMAC_RGMII_WOL
> 
> The patch that added this symbol (and the related driver) was submitted
> in https://lkml.org/lkml/2014/2/21/25 . It's not (yet) included in
> linux-next. Is it queued somewhere else?

To be honest I'm not sure. I will follow this up on the netdev list.

> > +	select USB
> > +	select USB_OHCI_HCD_PLATFORM
> > +	select USB_EHCI_HCD_PLATFORM
> > +	select MMC_SDHCI
> > +	select MMC_SDHCI_PLTFM
> > +	select MMC_SDHCI_OF_476GTR
> 
> The plan to add MMC_SDHCI_OF_476GTR seems to have been abandoned (see
> the discussion of https://lkml.org/lkml/2014/2/21/24 ). So this select
> is not needed. Should I submit a trivial patch to drop this select?

Thanks for pointing this out, I should have removed the select for 
MMC_SDHCI_OF_476GTR as suggested. I can submit a patch to drop the select or 
send an updated version of the original patch. Which is easiest for you Ben?

> > +	select ATA
> > +	select SATA_AHCI_PLATFORM
> > +	help
> > +	  This option enables support for the IBM Akebono (476gtr) evaluation
> > board +
> > +
> > 
> >  config ICON
> >  
> >  	bool "Icon"
> >  	depends on 44x
> 
> Paul Bolle
