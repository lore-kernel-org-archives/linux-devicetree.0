From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [4/5] IBM Akebono: Add the Akebono platform
Date: Fri, 02 May 2014 12:33:22 +1000
Message-ID: <1398998002.2925.15.camel@pasglop>
References: <1394077948-8395-5-git-send-email-alistair@popple.id.au>
	 <1398936447.4121.12.camel@x220> <10214508.Vq3Ynjy2Co@mexican>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10214508.Vq3Ynjy2Co@mexican>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Cc: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-05-02 at 10:35 +1000, Alistair Popple wrote:

> > The plan to add MMC_SDHCI_OF_476GTR seems to have been abandoned (see
> > the discussion of https://lkml.org/lkml/2014/2/21/24 ). So this select
> > is not needed. Should I submit a trivial patch to drop this select?
> 
> Thanks for pointing this out, I should have removed the select for 
> MMC_SDHCI_OF_476GTR as suggested. I can submit a patch to drop the select or 
> send an updated version of the original patch. Which is easiest for you Ben?

I don't rebase next so it has to be a followup patch.

Cheers,
Ben.

> > > +	select ATA
> > > +	select SATA_AHCI_PLATFORM
> > > +	help
> > > +	  This option enables support for the IBM Akebono (476gtr) evaluation
> > > board +
> > > +
> > > 
> > >  config ICON
> > >  
> > >  	bool "Icon"
> > >  	depends on 44x
> > 
> > Paul Bolle
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
