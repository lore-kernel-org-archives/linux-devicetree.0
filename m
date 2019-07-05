From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Date: Fri, 05 Jul 2019 14:15:37 +0300
Message-ID: <2e2e646c3fae87307a149ee06e9fd4a7e493830d.camel@linux.intel.com>
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
         <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com>
         <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Steffen <Alexander.Steffen@infineon.com>, Oshri Alkoby <oshrialkoby85@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, oshri.alkoby@nuvoton.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, dan.morav@nuvoton.com, tomer.maimon@nuvoton.com
List-Id: devicetree@vger.kernel.org

On Thu, 2019-07-04 at 13:29 +0200, Alexander Steffen wrote:
> On 04.07.2019 10:43, Jarkko Sakkinen wrote:
> > Check out tpm_tis_core.c and tpm_tis_spi.c. TPM TIS driver implements
> > that spec so you should only implement a new physical layer.
> 
> I had the same thought. Unfortunately, the I2C-TIS specification 
> introduces two relevant changes compared to tpm_tis/tpm_tis_spi:

I doubt that there was any comparison made.

> 1. Locality is not encoded into register addresses anymore, but stored 
> in a separate register.
> 2. Several register addresses have changed (but still contain compatible 
> contents).
> 
> I'd still prefer not to duplicate all the high-level logic from 
> tpm_tis_core. But this will probably mean to introduce some new 
> interfaces between tpm_tis_core and the physical layers.

Agreed. Some plumbing needs to be done in tpm_tis_core to make it work
for this. We definitely do not want to duplicate code that has been
field tested for years.

> Also, shouldn't the new driver be called tpm_tis_i2c, to group it with 
> all the other (TIS) drivers, that implement a vendor-independent 
> protocol? With tpm_i2c_ptp users might assume that ptp is just another 
> vendor.

Yes, absolutely. I guess the driver has been done without looking at
what already exist in the TPM kernel stack.

/Jarkko
