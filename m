From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/5] RFC: eeprom: at24: Allow passing gpiodesc from pdata
Date: Wed, 20 Jun 2018 03:45:01 +0300
Message-ID: <CAHp75Vd8VeYh8KOvCW54u-ZnP3jM60aCD9AnWxKYsSBSX09Y4A@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <20180618074556.6944-3-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618074556.6944-3-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>, dev@lists.96boards.org, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Andy Shevchenko <andy@infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 10:45 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> This makes it possible to pass an initialized GPIO descriptor
> to the driver through platform data.
>
> This is useful when we are dealing with EEPROMs on expansion
> boards where the GPIO has to be looked up indirectly using a
> connector abstraction (several systems using the same
> connector) so the machine descriptor tables cannot be used
> to associate the descriptor with the device and we then want
> to pass this descriptor on to the EEPROM driver this way
> instead.

How this descriptor is supposed to be created?
Whenever we probe the device we might add properties to it (consider
how MFD does instansiate them), I guess same way GPIO lookup tables
work. No?

P.S. I really would like to hear a _strong_ argument why it can't be
done using other means like built-in device properties or GPIO lookup
tables (which on my opinion have to work in the similar way at run
time).

-- 
With Best Regards,
Andy Shevchenko
