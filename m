From: Alexander Steffen <Alexander.Steffen@infineon.com>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Date: Tue, 30 Jul 2019 19:42:04 +0200
Message-ID: <ef3e9f2f-9c8e-7cc1-dc4c-dc1833592238@infineon.com>
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
 <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com>
 <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com>
 <CAM9mBwJC2QD5-gV1eJUDzC2Fnnugr-oCZCoaH2sT_7ktFDkS-Q@mail.gmail.com>
 <45603af2fc8374a90ef9e81a67083395cc9c7190.camel@linux.intel.com>
 <6e7ff1b958d84f6e8e585fd3273ef295@NTILML02.nuvoton.com>
 <CAP6Zq1hPo9dG71YFyr7z9rjmi-DvoUZJOme4+2uqsfO+7nH+HQ@mail.gmail.com>
 <20190715094541.zjqxainggjuvjxd2@linux.intel.com>
 <9c8e216dbc4f43dbaa1701dc166b05e0@NTILML02.nuvoton.com>
 <548d3727-4a8f-38d4-2193-8a09cbae1e64@infineon.com>
 <2e86f1b6a3c04c9889d0f12f4eb079d4@SFHDAG3NODE3.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e86f1b6a3c04c9889d0f12f4eb079d4@SFHDAG3NODE3.st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit HOUYERE <benoit.houyere@st.com>, "Eyal.Cohen@nuvoton.com" <Eyal.Cohen@nuvoton.com>, "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Cc: "oshrialkoby85@gmail.com" <oshrialkoby85@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "peterhuewe@gmx.de" <peterhuewe@gmx.de>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "oshri.alkoby@nuvoton.com" <oshri.alkoby@nuvoton.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "gcwilson@us.ibm.com" <gcwilson@us.ibm.com>, "kgoldman@us.ibm.com" <kgoldman@us.ibm.com>, "nayna@linux.vnet.ibm.com" <nayna@linux.vnet.ibm.com>, "Dan.Morav@nuvoton.com" <Dan.Morav@nuvoton.com>, "oren.tanami@nuvoton.com" <oren.tanam>
List-Id: devicetree@vger.kernel.org

Hi Benoit,

good to see you're still around.

On 30.07.2019 10:39, Benoit HOUYERE wrote:
> Hi Alexander, Jarkko and Eyal,
> 
> A first I2C TCG patch (tpm_tis_i2c.c) has been proposed in the same time as tpm_tis_spi.c by Christophe 3 years ago.
> 
> https://patchwork.kernel.org/patch/8628681/

Thanks for mentioning this. I forgot it exists, since it was still on 
the old mailing list.

> At the time, we have had two concerns :
> 	1) I2C TPM component number, in the market, compliant with new I2C TCG specification to validate new I2C driver.
> 	2) Lots changing  was already provided by tpm_tis_spi.c on 4.8.
> 
> That's why Tpm_tis_i2c.c has been postponed.
> 
> Tpm_tis_spi Linux driver is now robust, if we have several different I2C TPM solutions today to validate a tpm_tis_i2c driver, I 'm ready to contribute to it for validation (STmicro TPM) or propose a solution compatible on 5.1 linux driver if needed under timeframe proposed (second half of august).

Could you run your tests against the simple implementation that I posted 
a while ago (https://patchwork.kernel.org/cover/11049365/) and provide 
your feedback? Since it is already based on the current tpm_tis_core, it 
is probably easier to integrate necessary changes there.

By the way, has it gotten any easier in the meantime to get hold of your 
TPMs to use them for kernel tests?

Alexander
