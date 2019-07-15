From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Date: Mon, 15 Jul 2019 12:45:41 +0300
Message-ID: <20190715094541.zjqxainggjuvjxd2@linux.intel.com>
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
 <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com>
 <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com>
 <CAM9mBwJC2QD5-gV1eJUDzC2Fnnugr-oCZCoaH2sT_7ktFDkS-Q@mail.gmail.com>
 <45603af2fc8374a90ef9e81a67083395cc9c7190.camel@linux.intel.com>
 <6e7ff1b958d84f6e8e585fd3273ef295@NTILML02.nuvoton.com>
 <CAP6Zq1hPo9dG71YFyr7z9rjmi-DvoUZJOme4+2uqsfO+7nH+HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP6Zq1hPo9dG71YFyr7z9rjmi-DvoUZJOme4+2uqsfO+7nH+HQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Oshri Alkobi <oshrialkoby85@gmail.com>, Alexander Steffen <Alexander.Steffen@infineon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, peterhuewe@gmx.de, jgg@ziepe.ca, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, IS20 Oshri Alkoby <oshri.alkoby@nuvoton.com>, devicetree <devicetree@vger.kernel.org>, AP MS30 Linux Kernel community <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, IS30 Dan Morav <Dan.Morav@nuvoton.com>, eyal.cohen@nuvoton.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2019 at 11:08:47AM +0300, Tomer Maimon wrote:
>    Thanks for your feedback and sorry for the late response.
>
>    Due to the amount of work required to handle this technical feedback and
>    project constraints we need to put this task on hold for the near future.
>
>    In the meantime, anyone from the community is welcome to take over this
>    code and handle the re-design for the benefit of the entire TPM community.

Ok, so there is already driver for this called tpm_tis_core.

So you go and create a new module, whose name given the framework of
things that we already have deployed, is destined to be tpm_tis_i2c.

Then you roughly implement a new physical layer by using  a callback
interface provided to you by tpm_tis_core.

The so called re-design was already addressed by Alexander [1].

How hard can it be seriously?

[1] https://lkml.org/lkml/2019/7/4/331

/Jarkko
