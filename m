From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH 3/8] tpm_tis_spi: add max xfer size
Date: Fri, 14 Jun 2019 18:25:36 +0300
Message-ID: <20190614152536.GD11241@linux.intel.com>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613180931.65445-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:09:26AM -0700, Stephen Boyd wrote:
> From: Andrey Pronin <apronin@chromium.org>
> 
> Reject burstcounts larger than 64 bytes reported by tpm.
> SPI Hardware Protocol defined in section 6.4 of TCG PTP
> Spec supports up to 64 bytes of data in a transaction.
> 
> Signed-off-by: Andrey Pronin <apronin@chromium.org>
> Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
