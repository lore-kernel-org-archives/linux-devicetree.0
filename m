From: Alexander Steffen <Alexander.Steffen@infineon.com>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Date: Thu, 4 Jul 2019 13:29:41 +0200
Message-ID: <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com>
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
 <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Oshri Alkoby <oshrialkoby85@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, oshri.alkoby@nuvoton.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, dan.morav@nuvoton.com, tomer.maimon@nuvoton.com
List-Id: devicetree@vger.kernel.org

On 04.07.2019 10:43, Jarkko Sakkinen wrote:
> Check out tpm_tis_core.c and tpm_tis_spi.c. TPM TIS driver implements
> that spec so you should only implement a new physical layer.

I had the same thought. Unfortunately, the I2C-TIS specification 
introduces two relevant changes compared to tpm_tis/tpm_tis_spi:

1. Locality is not encoded into register addresses anymore, but stored 
in a separate register.
2. Several register addresses have changed (but still contain compatible 
contents).

I'd still prefer not to duplicate all the high-level logic from 
tpm_tis_core. But this will probably mean to introduce some new 
interfaces between tpm_tis_core and the physical layers.

Also, shouldn't the new driver be called tpm_tis_i2c, to group it with 
all the other (TIS) drivers, that implement a vendor-independent 
protocol? With tpm_i2c_ptp users might assume that ptp is just another 
vendor.

Alexander
