From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Date: Thu, 04 Jul 2019 11:43:55 +0300
Message-ID: <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com>
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628151327.206818-1-oshrialkoby85@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oshri Alkoby <oshrialkoby85@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, oshri.alkoby@nuvoton.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, dan.morav@nuvoton.com, tomer.maimon@nuvoton.com
List-Id: devicetree@vger.kernel.org

On Fri, 2019-06-28 at 18:13 +0300, Oshri Alkoby wrote:

The long descriptions are still missing. Please take the time and write
a proper commit messages that clearly tell what the patch does.

Check out tpm_tis_core.c and tpm_tis_spi.c. TPM TIS driver implements
that spec so you should only implement a new physical layer.

/Jarkko
