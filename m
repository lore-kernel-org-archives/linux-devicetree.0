From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 8/8] tpm: add legacy sysfs attributes for tpm2
Date: Thu, 13 Jun 2019 20:44:14 -0300
Message-ID: <20190613234414.GJ22901@ziepe.ca>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-9-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613180931.65445-9-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:09:31AM -0700, Stephen Boyd wrote:
> From: Andrey Pronin <apronin@chromium.org>
> 
> Userland scripts and tests rely on certain sysfs attributes
> present in the familiar location:
> /sys/class/tpm/tpm0/device/enabled
> /sys/class/tpm/tpm0/device/owned

no, we are expecting TPM2 userspace to use the new names and
locations. TPM2 is already not compatible with TPM1

Jason
