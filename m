From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv9 2/2] dma: Add Freescale eDMA engine driver support
Date: Thu, 16 Jan 2014 12:02:48 +0100
Message-ID: <201401161202.49333.arnd@arndb.de>
References: <1389839400-29728-1-git-send-email-b35083@freescale.com>
 <1389839400-29728-3-git-send-email-b35083@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1389839400-29728-3-git-send-email-b35083@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jingchang Lu <b35083@freescale.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, swarren@wwwdotorg.org, vinod.koul@intel.com, Alison Wang <b18965@freescale.com>, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 16 January 2014, Jingchang Lu wrote:
> Add Freescale enhanced direct memory(eDMA) controller support.
> This module can be found on Vybrid and LS-1 SoCs.
> 
> Signed-off-by: Alison Wang <b18965@freescale.com>
> Signed-off-by: Jingchang Lu <b35083@freescale.com>

Very nice! All my previous comments have been addressed, so

Acked-by: Arnd Bergmann <arnd@arndb.de>

One small comment still:

> +
> +static DEFINE_MUTEX(fsl_edma_mutex);
> +

I think this mutex should be part of struct fsl_edma_engine, not global.

	Arnd
