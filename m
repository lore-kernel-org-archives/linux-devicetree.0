From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v9 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161010101 erratum
Date: Tue, 31 Jan 2017 12:14:30 +0000
Message-ID: <20170131121429.GC11191@leverpostej>
References: <1484832916-7248-1-git-send-email-dingtianhong@huawei.com>
 <765699aa-cbc6-67eb-9108-cbf335338e4c@linaro.org>
 <35cf654f-3944-fc76-5120-25e33f71be4f@arm.com>
 <20170124163551.GB2021@mai> <20170130155209.GC1160@leverpostej>
 <20170130215430.GJ2206@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170130215430.GJ2206@mai>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, catalin.marinas@arm.com, will.deacon@arm.com, stuart.yoder@nxp.com, linuxarm@huawei.com, oss@buserror.net, Ding Tianhong <dingtianhong@huawei.com>, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 10:54:30PM +0100, Daniel Lezcano wrote:
> On Mon, Jan 30, 2017 at 03:52:09PM +0000, Mark Rutland wrote:
> > Hi Daniel,
> > 
> > On Tue, Jan 24, 2017 at 05:35:51PM +0100, Daniel Lezcano wrote:
 
> It is up to me to ensure the clockevent/clocksource drivers in general are
> following the right direction. And this driver looks more and more opaque. I
> will spend some times to do a review of the driver as soon as I have time.

FWIW, I'd locally fixed up the patches in the branch I previously
mentioned, so many issues in this series no longer exist.

I will post the cleaned up series momentarily. Hopefully that should be
less painful to review.

Thanks,
Mark.
