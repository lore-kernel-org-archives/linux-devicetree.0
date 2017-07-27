From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2835: Add Raspberry Pi Zero W
Date: Thu, 27 Jul 2017 20:41:21 +0200 (CEST)
Message-ID: <669060612.138196.1501180881798@email.1und1.de>
References: <1500579429-9101-1-git-send-email-stefan.wahren@i2se.com>
 <1500579429-9101-4-git-send-email-stefan.wahren@i2se.com>
 <87vamfx8nx.fsf@eliezer.anholt.net>
 <1bc16f65-7872-d554-d29b-d9cd746c28bd@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1bc16f65-7872-d554-d29b-d9cd746c28bd-eS4NqCHxEME@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 27. Juli 2017 um 13:35 geschrieben:
> 
> 
> Am 26.07.2017 um 22:09 schrieb Eric Anholt:
> > Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> >
> >> +/dts-v1/;
> >> +#include "bcm2835.dtsi"
> >> +#include "bcm2835-rpi.dtsi"
> >> +#include "bcm283x-rpi-usb-host.dtsi"
> >> +
> >> +/ {
> >> +	compatible = "raspberrypi,model-zero-w", "brcm,bcm2835";
> >> +	model = "Raspberry Pi Zero W";
> >> +
> >> +	aliases {
> >> +		uart0 = "/soc/serial@7e201000";
> >> +		uart1 = "/soc/serial@7e215040";
> >> +		serial0 = "/soc/serial@7e201000";
> >> +		serial1 = "/soc/serial@7e215040";
> >> +	};
> > Should we have this in the other board DTs?  What does it do?
> 
> This was the hardest part to make the Zero W useable. I took it from
> downstream [1], because without it i don't see anything on debug UART
> (config.txt already has enable_uart=1).
> 
> I could add a helpful comment, but i can't explain why it's necessary
> for RPI Zero W and not for the older RPI Zero.
> 
> Maybe the foundation guys have an alternative solution or at least
> explanation.
> 

Here is Phil Elwell's explanation (he couldn't reply via plain text today):

Serial port usage became an issue with the release of the Pi 3. The good
UART (uart0, ttyAMA0, pl011) was required to drive the Bluetooth modem,
leaving the "mini-UART" (uart1, ttyS0, AUX UART, 8250), with limited
capabilities and even smaller FIFOs, available for a console and other
uses. However, not all users want to use Bluetooth, and some need the
better UART for other purposes.

For some reason (possibly clock related) the firmware initialises a UART
for the OS to use - I believe UBoot makes use of it. If the roles are no
longer fixed there has to be a way to tell the firmware which UART to
initialise. This is particularly important using ttyS0 because the VPU
clock has to be fixed to avoid data corruption due to baud rate changes.

At the same time, we have always tried to make it possible to use the same
SD card in any Pi, so we wanted a way to abstract away the differences in
serial port usage. I couldn't find a standard mechanism to give serial
ports in Linux arbitrary names or numbers to insulate userland from the
hardware specifics, so I added the /dev/serial<n> symbolic links.

I was trying to move away from a proliferation of config.txt settings and
make device tree the communication mechanism between user, firmware and
kernel, so I chose to use DT aliases to declare the name-to-UART mapping -
it seemed like a nice fit. Overlays can change them, and the firmware,
kernel and userspace scripts can read them. For example, a udev rule
creates the symbolic links during the boot process based on the contents of
/proc/device-tree/aliases, and the firmware rewrites the kernel command
line, replacing the aliases with the appropriate device name.

On the firmware side we added one new setting - enable_uart - which
defaults to 1 unless the mini-UART is the primary (console) UART, in which
case it must be explicitly set to 1 in config.txt in order for the UART
(and GPIO pins) to be configured. This difference is because most users
will never use the serial ports, and the need for a constant baud rate
makes it necessary to lock the VPU core frequency to 250MHz which could be
seen as a performance penalty.

To answer the question you originally asked, the aliases are needed on a
Zero W (just as on a Pi 3) because by default it uses ttyS0 for Bluetooth,
but the firmware doesn't know this unless the DT tells it so via the
aliases. Otherwise it behaves like all Pis before the 3 and puts the
console on ttyAMA0.
