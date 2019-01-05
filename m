From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 6/8 v2] arm64: dts: hi3660: Add dma to uart nodes
Date: Fri, 4 Jan 2019 20:34:09 -0800
Message-ID: <CALAqxLVGznbM8+rHHn8j_+m1P-E9+_jJNfRZKPVqF+pTQWG_Mg@mail.gmail.com>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
 <1546635388-13795-7-git-send-email-john.stultz@linaro.org>
 <20190105034904.GD2477@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190105034904.GD2477@Mani-XPS-13-9360>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Ryan Grachek <ryan@edited.us>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Tanglei Han <hantanglei@huawei.com>, lkml <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 4, 2019 at 7:49 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi John,
>
> On Fri, Jan 04, 2019 at 12:56:26PM -0800, John Stultz wrote:
> > Try to add DMA support to the uart nodes following
> > the assignments made in the dts from the victoria vendor kernel
> > here:
> > https://consumer.huawei.com/en/opensource/detail/?siteCode=worldwide&keywords=p10&fileType=openSourceSoftware&pageSize=10&curPage=1
> >
> > Cc: Tanglei Han <hantanglei@huawei.com>
> > Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> > Cc: Ryan Grachek <ryan@edited.us>
> > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: Wei Xu <xuwei5@hisilicon.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > index 20ae40d..aaa2b04 100644
> > --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > @@ -466,6 +466,8 @@
> >                       compatible = "arm,pl011", "arm,primecell";
> >                       reg = <0x0 0xfdf02000 0x0 0x1000>;
> >                       interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +                     dma-names = "rx", "tx";
> > +                     dmas =  <&dma0 0 &dma0 1>;
>
> Usage of DMA channel 0 contradicts with the description provided in
> patch, "dma: k3dma: Add support to dma_avail_chan".

Hrm. Good point.  I'll double check w/ Dr Su on this, I'm not sure if
that inconsistency is due to the the vendor kernel (where these came
from) having different reserved channels or just something overlooked
if the uart0 is not actually being used (as we find on hikey960 as
well).

thanks
-john
