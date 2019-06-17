From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH 1/8] tpm: block messages while suspended
Date: Mon, 17 Jun 2019 19:38:36 +0300
Message-ID: <20190617163810.GA9427@linux.intel.com>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-2-swboyd@chromium.org>
 <20190614152700.GE11241@linux.intel.com>
 <5d03e3ba.1c69fb81.9c2c8.aa89@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5d03e3ba.1c69fb81.9c2c8.aa89@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 11:13:13AM -0700, Stephen Boyd wrote:
> Quoting Jarkko Sakkinen (2019-06-14 08:27:00)
> > On Thu, Jun 13, 2019 at 11:09:24AM -0700, Stephen Boyd wrote:
> > > diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> > > index 1b5436b213a2..48df005228d0 100644
> > > --- a/include/linux/tpm.h
> > > +++ b/include/linux/tpm.h
> > > @@ -132,6 +132,8 @@ struct tpm_chip {
> > >       int dev_num;            /* /dev/tpm# */
> > >       unsigned long is_open;  /* only one allowed */
> > >  
> > > +     unsigned long is_suspended;
> > > +
> > >       char hwrng_name[64];
> > >       struct hwrng hwrng;
> > 
> > I think it would better idea to have a bitmask of some sort that
> > would have bits for 'open' and 'suspended'.
> > 
> 
> Sure. I can combine is_open and is_suspended into some sort of 'unsigned
> long flags' member and then have #define TPM_IS_OPEN 0 and #define
> TPM_IS_SUSPENDED 1 defines?

Sounds sustainable.

/Jarkko
