From: Joe Perches <joe@perches.com>
Subject: Re: Re: [PATCH] gpio MIPS/OCTEON: Add a driver for OCTEON's on-chip
 GPIO pins.
Date: Thu, 20 Jun 2013 11:18:44 -0700
Message-ID: <1371752324.2146.25.camel@joe-AO722>
References: <1371251915-18271-1-git-send-email-ddaney.cavm@gmail.com>
	 <CACRpkdYHzBBbPNujYRGkMFGuQRzeYKs9jgfc3e3HWyxQFahvRQ@mail.gmail.com>
	 <51C34584.8070301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C34584.8070301@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-06-20 at 11:10 -0700, David Daney wrote:
> Sorry for not responding earlier, but my e-mail system seems to have 
> malfunctioned with respect to this message...
[]
> On 06/17/2013 01:51 AM, Linus Walleij wrote:
> >> +static int octeon_gpio_get(struct gpio_chip *chip, unsigned offset)
> >> +{
> >> +       struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
> >> +       u64 read_bits = cvmx_read_csr(gpio->register_base + RX_DAT);
> >> +
> >> +       return ((1ull << offset) & read_bits) != 0;
> >
> > A common idiom we use for this is:
> >
> > return !!(read_bits & (1ull << offset));
> 
> I hate that idiom, but if its use is a condition of accepting the patch, 
> I will change it.

Or use an even more common idiom and change the
function to return bool and let the compiler do it.
