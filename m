From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] reset: allow drivers to request probe deferral
Date: Thu, 18 Jul 2013 11:06:51 -0600
Message-ID: <51E820AB.1040008@wwwdotorg.org>
References: <1374148653-14009-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374148653-14009-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Pavel Machek <pavel@ucw.cz>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On 07/18/2013 05:57 AM, Philipp Zabel wrote:
> If the requested reset controller is not yet available, have reset_control_get
> and device_reset return -EPROBE_DEFER so the driver can decide to request
> probe deferral.

Reviewed-by: Stephen Warren <swarren@nvidia.com>
