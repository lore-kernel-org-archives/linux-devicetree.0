From: Lu Jingchang-B35083 <B35083@freescale.com>
Subject: RE: [PATCH 3/3] dma: Add Freescale eDMA engine driver support
Date: Mon, 23 Sep 2013 06:56:37 +0000
Message-ID: <B56CDBE15CE27145A4B77D2D24263E852260F9@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1378374799-16357-1-git-send-email-b35083@freescale.com>
 <20130917045359.GN17188@intel.com>
 <B56CDBE15CE27145A4B77D2D24263E85223E21@039-SN1MPN1-003.039d.mgd.msft.net>
 <20130923042549.GC17188@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130923042549.GC17188@intel.com>
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
To: Vinod Koul <vinod.koul@intel.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "djbw@fb.com" <djbw@fb.com>
List-Id: devicetree@vger.kernel.org


> -----Original Message-----
> From: Vinod Koul [mailto:vinod.koul@intel.com]
> Sent: Monday, September 23, 2013 12:26 PM
> To: Lu Jingchang-B35083
> Cc: djbw@fb.com; shawn.guo@linaro.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH 3/3] dma: Add Freescale eDMA engine driver support
> 
> On Tue, Sep 17, 2013 at 08:08:46AM +0000, Lu Jingchang-B35083 wrote:
> > > > +	case DMA_PAUSE:
> > > > +		if (fsl_chan->edesc)
> > > > +			fsl_edma_disable_request(fsl_chan);
> > > racy here too...
> > It only set the channel HW register, no list is handled,
> > is lock needed here? Thanks!
> well thats the point while you are terminating the current trasnaction
> can
> complete and then start another one. You want to try and prevent these
> case
> also. Here you are neither locking the HW access nor the the list, so its
> juts
> waiting to crash!
Thanks! I have sent out the new v6 patch last week with holding lock here,
Could you please help review it?


Best Regards,
Jingchang
