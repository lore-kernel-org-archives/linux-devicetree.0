From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [Dev] [PATCH 4/5] RFC: bus: 96boards Low-Speed Connector
Date: Tue, 19 Jun 2018 12:19:34 +0100
Message-ID: <20180619111934.ms7oc46atzzs4ern@holly.lan>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <20180618074556.6944-5-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180618074556.6944-5-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>, dev@lists.96boards.org, Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 09:45:55AM +0200, Linus Walleij wrote:
> This illustrates my idea for using a small connector driver to
> plug in "mezzanine boards" on the 96boards low-speed connector.
> 
> These "mezzanine boards" are no different than "capes", "logic
> modules", etc. This thing, a non-discoverable connector where
> a user can plug in a few peripherals has been reinvented a few
> times.
> 
> As a proof-of-concept we add the Secure96, a quite minimal
> mezzanine board.
> 
> Users can register their boards in a simple way. Either just
> add their compatible-string in the device tree:
> 
> board {
>         compatible = "96boards,secure96";
> };
> 
> And if they can't even change three lines in their device tree,
> or if they at runtime decide to plug in some board and test it,
> they can use sysfs, as exemplified by plugging in the secure96
> security board at runtime:
> 
> > cd /sys/devices/platform/connector
> > echo 1 > secure96
> [   61.014629] lscon connector: called mezzanine_store on secure96
> [   61.020530] lscon connector: populate secure96
> [   61.027081] at24 1-0050: 2048 byte 24c128 EEPROM, writable, 128 bytes/write
> [   61.053569] atmel-ecc 1-0060: configuration zone is unlocked
> [   61.502535] tpm_tis_spi spi0.0: 2.0 TPM (device-id 0x1B, rev-id 16)
> (...)
> 
> The plug-in board can be removed from sysfs and added back
> again multiple times like this with the devices being runtime
> added and removed by two writes to sysfs.
> 
> > echo 0 > secure96
> > echo 1 > secure96
> > echo 0 > secure96
> (...)

Having a sysfs interface is useful (I certainly love being able to use
sysfs to manage ad-hoc I2C chains).

However it feels like the current blurring between connector device and
mezzanine device is shining through in this interface if only because
the look and feel is very different to instantiating an I2C device from
user-space.


Daniel.
