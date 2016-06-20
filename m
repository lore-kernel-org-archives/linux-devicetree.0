From: Holger Schurig <holgerschurig@gmail.com>
Subject: Re: Auto-detecting touchscreen controller and dealing with hw
 configuration differences on q8 tablets
Date: Mon, 20 Jun 2016 12:33:57 +0200
Message-ID: <87r3bsywru.fsf@gmail.com>
References: <bc978925-46a4-c069-8793-903a87ec70b8@redhat.com>
 <5E70AD96-4E8E-4430-AF99-0AA0FCF5F8E7@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5E70AD96-4E8E-4430-AF99-0AA0FCF5F8E7@konsulko.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>, Jelle van der Waa <jelle@vdwaa.nl>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> u-boot will work, but you will get into trouble if you demand users to drop to u-boot
> to make changes.

On my device I use barebox, which is a bit easier *) to use than U-Boot.

Still I don't expect my users to the bootloader. Instead my hardware has
a 256 byte i2c EEPROM where I store information. And the user can run a
user-space command to change settings there, e.g.

uccomm verbose_boot yes
uccomm power_config ignition

... and so on. I could do some of them via bootloader environment files,
but not all.

And this is the other obvious way of doing "communication" from Linux
user-space to bootloader: setting the environment. The bootloader could
mount the partition and try to source some file, to get the info needed.




*) in barebox, you have actual shell-like script that look sane, not
 variables that call variables, e.g. you can do things like this:

	if [ $oem_id = 255 ]; then
		splash -x 550 -y 500 -b 0xffffff /env/logo.png
		fb0.enable=1
		pwm_02080000.period_ns=200000
		pwm_02080000.duty_ns=160000
		pwm_02080000.enable=1
	fi
	gpio_set_value 191 1

There are also commands available to directly modify the device tree.
