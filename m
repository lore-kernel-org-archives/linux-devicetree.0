From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 3/3] power: reset: use syscon driver to parse reboot
 register from scu
Date: Fri, 17 Jan 2014 17:52:46 +0100
Message-ID: <201401171752.47393.arnd@arndb.de>
References: <1389748055-23534-1-git-send-email-fkan@apm.com>
 <1389748055-23534-4-git-send-email-fkan@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1389748055-23534-4-git-send-email-fkan@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Feng Kan <fkan@apm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 15 January 2014, Feng Kan wrote:
> +static int __init xgene_reboot_init(void)
>  {
>         arm_pm_restart = xgene_restart;
>         return 0;
>  }
>  device_initcall(xgene_reboot_init);

This won't work on a generic kernel, since you unconditionally set the
pm_restart function to your own, which is broken for everything else.

Please keep the platform_driver to attach to the reboot device
as you had before. It might be good to turn this into a generic
"syscon-reset" driver that gets both the register number and
the contents to write from the device node.

	Arnd
