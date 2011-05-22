From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Sun, 22 May 2011 12:03:03 +0200
Message-ID: <201105221203.03970.arnd@arndb.de>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
	<a42f0c27-2811-4b68-bedf-7dfaa7bff6ff@VA3EHSMHS025.ehs.local>
	<BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Kevin Hilman <khilman@ti.com>, Segher Boessenkool <segher@kernel.crashing.org>, Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Jeremy Kerr <jeremy.kerr@canonical.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Saturday 21 May 2011 19:42:34 Grant Likely wrote:
> 1) drop amba-bus entirely and use platform_device everywhere, similar
> to what OMAP has done
> 2) strictly create amba_devices for nodes compatible with "arm,amba-device"
> 3) be intelligent about amba device creation; create an amba_device
> only for devices we know are driven with amba_driver.

Or maybe

4) Use amba_device for all devices on an amba bus (identified by
the compatible property of the bus), but mark the ones that do
not have primecell compatible registers so that the amba bus
does not try to look at them but instead takes the information
from the device tree.

Even though this might seem a bit silly when most devices are
not primecell ones, but it could be used as an incentive for
hardware designers (I can dream, right?) to provide them in future
designs. It would also make it easier to document the actual bus
hierarchy correctly.

	Arnd
