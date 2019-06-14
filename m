From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH 7/8] tpm: add sysfs attributes for tpm2
Date: Fri, 14 Jun 2019 18:31:36 +0300
Message-ID: <20190614153136.GF11241@linux.intel.com>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-8-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613180931.65445-8-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:09:30AM -0700, Stephen Boyd wrote:
> From: Andrey Pronin <apronin@chromium.org>
> 
> Add sysfs attributes in TPM2.0 case for:
>  - TPM_PT_PERMANENT flags
>  - TPM_PT_STARTUP_CLEAR flags
>  - lockout-related properties
> 
> Signed-off-by: Andrey Pronin <apronin@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

You can use /dev/tpm0 for this from user space.

/Jarkko
