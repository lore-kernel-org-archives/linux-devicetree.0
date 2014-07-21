From: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
Subject: RE: [RFC V2] devicetree: Dialog Semiconductor consolidate existing
 vendor prefixes to standardise on 'dlg'
Date: Mon, 21 Jul 2014 14:40:02 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB7D0B274CB@SW-EX-MBX02.diasemi.com>
References: <201407151520.s6FFKcjB009745@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201407151520.s6FFKcjB009745@swsrvapps-01.diasemi.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Arnaud Ebalard <arno@natisbad.org>, DEVICE
 TREE <devicetree@vger.kernel.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Guenter Roeck <linux@roeck-us.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jason Cooper <jason@lakedaemon.net>, Jason
 Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonathan Cameron <jic23@kernel.org>, Kumar Gala <galak@codeaurora.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, LINUX SH <linux-sh@vger.kernel.org>, Lee
 Jones <lee.jones@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Martin Fuzzey <mfuzzey@parkeon.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Samuel
Cc: LKML <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org


On 15 July 2014 16:04, Steve Twiss wrote:

>From: Opensource [Steve Twiss] [mailto:stwiss.opensource@diasemi.com]
>Sent: 15 July 2014 16:04
>Subject: [RFC V2] devicetree: Dialog Semiconductor consolidate existing vendor
>prefixes to standardise on 'dlg'
[...]
>This patch series updates the device tree vendor prefix for
>Dialog Semiconductor.
>Various methods are currently used throughout the kernel: 'diasemi',
>'dialog' and 'dlg'. Others have also been suggested.
>This patch set aims to consolidate the usage of the vendor prefix to
>use a common standard. The prefix 'dlg' is used.
[...]

Hello all,

Have there been any further thoughts on this? I would like move this issue forwards so
that this problem this does not keep arising.

>From my point of view, the argument is a simple one: what is the value of existing multiple
vendor prefixes if they do not work and are not used anywhere?

But, as usual I recognise that the kernel community have different aims and I am willing
to compromise with my patches in order to move ahead.

Regards,
Steve
