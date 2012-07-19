From: Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH 1/2] ARM: vt8500: Update vt8500-ehci driver to support
 device tree.
Date: Thu, 19 Jul 2012 16:45:25 +0200
Message-ID: <CABjd4YxfynH5f0dTwOh3EpiNr2vLq_2yJqys=Ztm_XV2oY4nsw@mail.gmail.com>
References: <1342704684-4858-1-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342704684-4858-1-git-send-email-linux@prisktech.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: vt8500-wm8505-linux-kernel@googlegroups.com
Cc: Tony Prisk <linux@prisktech.co.nz>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

2012/7/19 Tony Prisk <linux@prisktech.co.nz>:
> Signed-off-by: Tony Prisk <linux@prisktech.co.nz>
> ---
>  drivers/usb/host/ehci-vt8500.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)

Have you tried to use ehci-platform on VIA/WMT devices? If it works
(which I would expect), I believe it's better to include OF support
into ehci-platform and drop ehci-vt8500 completely after existing
boards are converted to Device Tree. When writing ehci-vt8500, I
mostly only copied stuff from the PCI version and made it initialize
from the platform bus (nothing specific to vt8500).

Thanks,
Alexey
