From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] uio/pdrv_genirq: Add OF support
Date: Sun, 17 Apr 2011 19:53:42 +0200
Message-ID: <201104171953.42440.arnd@arndb.de>
References: <1302774106-32764-1-git-send-email-monstr@monstr.eu> <20110414230602.GC2780@local>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110414230602.GC2780@local>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>
Cc: Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, w.sang@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Friday 15 April 2011, Hans J. Koch wrote:
> > +#ifdef CONFIG_OF
> > +/*
> > + * Empty match table for of_platform binding
> > + * Select your custom compatible string in format
> > + * { .compatible = "<compatible string>", },
> > + */
> > +static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> > +     { /* end of list */ },
> 
> doesn't that want a NULL termination?
> 

It is NULL terminated, that is the /* end of list */.

	Arnd
