From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
Date: Sun, 18 Aug 2019 00:32:07 +0300
Message-ID: <20190817213207.GC3504@valkosipuli.retiisi.org.uk>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
 <20190704084651.3105-2-dongchun.zhu@mediatek.com>
 <20190723074153.GA4606@paasikivi.fi.intel.com>
 <ef65288c523f405396991bd6d757bba0@mtkmbs02n1.mediatek.inc>
 <1566013985.21623.9.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1566013985.21623.9.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, menghui.lin@mediatek.com, tfiga@google.com, shengnan.wang@mediatek.com, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dongchun,

On Sat, Aug 17, 2019 at 11:53:05AM +0800, Dongchun Zhu wrote:
...
> > > +
> > > +The device node shall contain one 'port' child node with an
> > > +'endpoint' subnode for its digital output video port, in accordance
> > > +with the video interface bindings defined in
> > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +The endpoint optional property 'data-lanes' shall be "<1>".
> > 
> > How many lanes does the module (or the sensor) have?
> > 
> 
> From sensor datasheet, OV02A10 supports 1-lane MIPI interface.

If only one lane is supported, the property should be omitted: there's
nothing that the driver needs to know here.

-- 
Sakari Ailus
