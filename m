From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 1/2] dmaengine: imx-sdma: use platform_device_id to
	identify sdma version
Date: Fri, 15 Jul 2011 16:22:05 +0800
Message-ID: <20110715082204.GD1840@S2100-06.ap.freescale.net>
References: <1310660057-17953-1-git-send-email-shawn.guo@linaro.org>
	<1310660057-17953-2-git-send-email-shawn.guo@linaro.org>
	<20110715080132.GI6069@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110715080132.GI6069@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Vinod Koul <vinod.koul@intel.com>, devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Fri, Jul 15, 2011 at 10:01:32AM +0200, Sascha Hauer wrote:
> On Fri, Jul 15, 2011 at 12:14:16AM +0800, Shawn Guo wrote:
> > It might be not good to use software defined version to identify sdma
> > device type, when hardware does not define such version.  Instead,
> > soc name is stable enough to define the device type.
> > 
> > The patch uses platform_device_id rather than version number passed
> > by platform data to identify sdma device type/version.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> Generally Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> However, I find no branch to apply this on. This patch *mostly* applied
> after I merged Grants gpio-next branch into mine and resolved the
> resulting merge conflicts.
> 
I appreciate it, if you can do that.  Otherwise, maybe we can let it
rest for a while until all trees get merged in coming -rc window.

-- 
Regards,
Shawn
