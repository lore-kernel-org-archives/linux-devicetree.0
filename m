From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 1/8] tpm: block messages while suspended
Date: Mon, 24 Jun 2019 22:26:54 +0800
Message-ID: <20190624142654.zprcpz42hivuyrjq@gondor.apana.org.au>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-2-swboyd@chromium.org>
 <20190613232613.GH22901@ziepe.ca>
 <5d03e394.1c69fb81.f028c.bffb@mx.google.com>
 <20190617225134.GA30762@ziepe.ca>
 <5d0c2cd6.1c69fb81.e66af.32bf@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5d0c2cd6.1c69fb81.e66af.32bf@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2019 at 06:03:17PM -0700, Stephen Boyd wrote:
>
> What do you think of the attached patch? I haven't tested it, but it
> would make sure that the kthread is frozen so that the hardware can be
> resumed before the kthread is thawed and tries to go touch the hardware.

Looks good to me.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
