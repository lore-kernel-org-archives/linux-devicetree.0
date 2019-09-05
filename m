From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
Date: Thu, 5 Sep 2019 14:36:38 +0300
Message-ID: <20190905113638.GE2680@smile.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-3-dongchun.zhu@mediatek.com>
 <20190905082134.GY5475@paasikivi.fi.intel.com>
 <20190905101908.GB2680@smile.fi.intel.com>
 <20190905104001.GZ5475@paasikivi.fi.intel.com>
 <ad357e27-3e51-6922-1924-5d2c2daf1934@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ad357e27-3e51-6922-1924-5d2c2daf1934@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, sam.hung@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, Sakari Ailus <sakari.ailus@linux.intel.com>, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 12:57:34PM +0200, Javier Martinez Canillas wrote:
> On 9/5/19 12:40 PM, Sakari Ailus wrote:
> > On Thu, Sep 05, 2019 at 01:19:08PM +0300, Andy Shevchenko wrote:
> >> On Thu, Sep 05, 2019 at 11:21:34AM +0300, Sakari Ailus wrote:
> >>> On Thu, Sep 05, 2019 at 03:21:42PM +0800, dongchun.zhu@mediatek.com w=
rote:
> >>>> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >>
> >>>> +static const struct i2c_device_id dw9768_id_table[] =3D {
> >>>> +	{ DW9768_NAME, 0 },
> >>>> +	{ },
> >>>
> >>> Could you drop the I=B2C ID table?
> >>
> >> But why?
> >> It will allow you to instanciate the device from user space.
> =

> Yes, the I2C device table is still needed if the device can be instantiat=
ed
> from user-space using the sysfs interface, or otherwise the module won't =
be
> automatically loaded.
> =

> Kieran posted a "[PATCH RFC] modpost: Support I2C Aliases from OF tables"
> patch that adds a MODULE_DEVICE_TABLE(i2c_of, ..) macro so modpost could
> add legacy I2C modalias using the information in the OF device ID tables:
> =

> https://patchwork.kernel.org/patch/11038861/
> =

> If that lands, then we could get rid of the I2C device tables altogether
> for non-legacy I2C drivers.
> =

> > =

> > The device is supposed to be present in DT (or ACPI tables) already.
> >
> =

> Agreed. Also by looking at the driver's probe function I see that the
> device lookups a 'vin' and 'vdd' regulators supplies and it fails if
> aren't defined, so it can't be instantiated from user-space anyways.

Thank you for clarifications!

So, it can use ->probe_new() in that case.

> =

> BTW, these two regulators supplies should be listed as 'vin-supply'
> and 'vdd-supply' as required properties in the DT binding document.

-- =

With Best Regards,
Andy Shevchenko
