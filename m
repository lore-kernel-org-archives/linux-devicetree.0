From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
Date: Thu, 5 Sep 2019 13:19:08 +0300
Message-ID: <20190905101908.GB2680@smile.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-3-dongchun.zhu@mediatek.com>
 <20190905082134.GY5475@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190905082134.GY5475@paasikivi.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Javier Martinez Canillas <javierm@redhat.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, sam.hung@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 11:21:34AM +0300, Sakari Ailus wrote:
> On Thu, Sep 05, 2019 at 03:21:42PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>

> > +static const struct i2c_device_id dw9768_id_table[] =3D {
> > +	{ DW9768_NAME, 0 },
> > +	{ },
> =

> Could you drop the I=B2C ID table?

But why?
It will allow you to instanciate the device from user space.

+Cc: Javier.

Javier, is it needed in new code?

-- =

With Best Regards,
Andy Shevchenko
