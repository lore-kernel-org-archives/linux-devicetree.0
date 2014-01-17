From: Jingchang Lu <jingchang.lu@freescale.com>
Subject: RE: [PATCHv9 2/2] dma: Add Freescale eDMA engine driver support
Date: Fri, 17 Jan 2014 02:22:26 +0000
Message-ID: <8e515b3695ea4c33a61f354b77be0b6b@BL2PR03MB467.namprd03.prod.outlook.com>
References: <1389839400-29728-1-git-send-email-b35083@freescale.com>
 <1389839400-29728-3-git-send-email-b35083@freescale.com>
 <201401161202.49333.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201401161202.49333.arnd@arndb.de>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Thursday, January 16, 2014 7:03 PM
> To: Lu Jingchang-B35083
> Cc: vinod.koul@intel.com; dan.j.williams@intel.com; shawn.guo@linaro.org;
> pawel.moll@arm.com; mark.rutland@arm.com; swarren@wwwdotorg.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; Wang Huan-B18965
> Subject: Re: [PATCHv9 2/2] dma: Add Freescale eDMA engine driver support
> 
> On Thursday 16 January 2014, Jingchang Lu wrote:
> > Add Freescale enhanced direct memory(eDMA) controller support.
> > This module can be found on Vybrid and LS-1 SoCs.
> >
> > Signed-off-by: Alison Wang <b18965@freescale.com>
> > Signed-off-by: Jingchang Lu <b35083@freescale.com>
> 
> Very nice! All my previous comments have been addressed, so
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> One small comment still:
> 
> > +
> > +static DEFINE_MUTEX(fsl_edma_mutex);
> > +
> 
> I think this mutex should be part of struct fsl_edma_engine, not global.
Yes, it should be for each edma controller, I will define it in struct fsl_edma_engine. Thanks.


Best Regards,
Jingchang
