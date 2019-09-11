From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [V2, 2/2] media: i2c: Add more sensor modes for ov8856 camera
 sensor
Date: Wed, 11 Sep 2019 14:43:00 +0300
Message-ID: <20190911114300.GI5781@paasikivi.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-3-dongchun.zhu@mediatek.com>
 <CAAFQd5Ar39TeFJbprQuMwCBVgjsuap1iQviz2dbf5Yw6OU1ZWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAAFQd5Ar39TeFJbprQuMwCBVgjsuap1iQviz2dbf5Yw6OU1ZWA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@chromium.org>, andriy.shevchenko@linux.intel.com, srv_heupstream <srv_heupstream@mediatek.com>, devicetree@vger.kernel.org, shengnan.wang@mediatek.com, Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Tomasz,

On Wed, Sep 11, 2019 at 07:12:02PM +0900, Tomasz Figa wrote:
> Hi Sakari,
> 
> On Tue, Sep 10, 2019 at 10:05 PM <dongchun.zhu@mediatek.com> wrote:
> >
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >
> > This patch mainly adds two more sensor modes for OV8856 CMOS image sensor.
> > That is, the resolution of 1632*1224 and 3264*2448, corresponding to the bayer order of BGGR.
> > The sensor revision also differs in some OTP register.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  drivers/media/i2c/ov8856.c | 654 +++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 639 insertions(+), 15 deletions(-)
> >
> 
> What do you think about the approach taken by this patch?
> 
> My understanding is that the register arrays being added by it can be
> only used with 24MHz input clock, while the existing ones are for
> 19.2MHz. That means that this patch makes the driver expose completely
> different modes (resolutions, mbus formats) depending on the input
> clock. Are we okay with this?

These register list based drivers only support a tiny subset of
configurations a sensor can support, and the number of those configurations
may be amended over time.

I don't see a problem in choosing a different set of available
configurations based on the external clock frequency; that may, after all,
cause that some of the configurations, at a particular frame rate, are not
even achievable --- albeit this is perhaps unlikely in this case.

In practice, it's often the case that the sensor vendor provides these
configurations and the vendor may provide different configurations
(including output resolutions etc.) to different parties. So it may well be
the submitter of the patch would also not have access to similar
configurations (output size, cropping etc.) that now exist in the driver.

I'll review the patch itself soonish.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
