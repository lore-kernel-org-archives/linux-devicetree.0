From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [V2, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS entry
Date: Thu, 5 Sep 2019 14:35:09 +0300
Message-ID: <20190905113509.GD2680@smile.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-2-dongchun.zhu@mediatek.com>
 <20190905101406.GA2680@smile.fi.intel.com>
 <20190905104829.GB5475@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190905104829.GB5475@paasikivi.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, sam.hung@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 01:48:30PM +0300, Sakari Ailus wrote:
> On Thu, Sep 05, 2019 at 01:14:06PM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 05, 2019 at 03:21:41PM +0800, dongchun.zhu@mediatek.com wrote:
> > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > 
> > > This patch is to add the Devicetree binding documentation and
> > > MAINTAINERS entry for dw9768 actuator.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt | 9 +++++++++
> > >  MAINTAINERS                                                     | 7 +++++++
> > 
> > This should be:
> > 1) two separate patches
> 
> Why? The MAINTAINERS entry is usually added in the first patch needing it,
> isn't it?

Bindings are required to be a separate patch.
Rob, is it still the case or am I mistaken?

-- 
With Best Regards,
Andy Shevchenko
