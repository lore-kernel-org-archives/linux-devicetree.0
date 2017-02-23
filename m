From: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH v3 01/18] drivers/fsi: Add empty fsi bus definitions
Date: Thu, 23 Feb 2017 22:24:10 +0800
Message-ID: <53c63405-8aeb-9751-62d6-4583847dce3c@ozlabs.org>
References: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
 <20170201165358.45415-2-cbostic@linux.vnet.ibm.com>
 <CAMuHMdUhiXCnjT60Lsqq4eGGnVv9eavtkVL1Mdk_6naBHBDVrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUhiXCnjT60Lsqq4eGGnVv9eavtkVL1Mdk_6naBHBDVrQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Greg KH <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, joel@jms.id.au, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, andrew@aj.id.au, Alistair Popple <alistair@popple.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Chris Bostic <cbostic@us.ibm.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

>> --- /dev/null
>> +++ b/drivers/fsi/Kconfig
>> @@ -0,0 +1,12 @@
>> +#
>> +# FSI subsystem
>> +#
>> +
>> +menu "FSI support"
>> +
>> +config FSI
>> +       tristate "FSI support"
> 
> I guess this should depend on some POWER symbol || COMPILE_TEST?

No, this is pretty hardware-independent - all it requires on the HW side
is two GPIOs.

Although the FSI slave devices are typically only present on POWER
systems, they can be driven from anything, with currently
implementations being on ARM and 32-bit powerpc.

Cheers,


Jeremy
