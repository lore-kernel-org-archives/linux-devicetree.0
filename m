From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH 2/8] tpm_tis_core: add optional max xfer size check
Date: Fri, 14 Jun 2019 18:24:36 +0300
Message-ID: <20190614152436.GC11241@linux.intel.com>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-3-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613180931.65445-3-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:09:25AM -0700, Stephen Boyd wrote:
> From: Andrey Pronin <apronin@chromium.org>
> 
> If tpm reports a bigger burstcnt than allowed by the physical protocol,
> set burstcnt to the max allowed value.
> 
> In practice, seen in case of xfer issues (e.g. in spi interface case,
> lost header causing flow control issues and wrong values returned on read
> from TPM_STS). Without catching, causes the physical layer to reject xfer.
> 
> Signed-off-by: Andrey Pronin <apronin@chromium.org>
> Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> [swboyd@chromium.org: Drop extra parenthesis in if statement]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
