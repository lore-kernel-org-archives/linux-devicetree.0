From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] media: ov5695: Add suport for registering sensor-related
Date: Fri, 27 Sep 2019 12:45:25 +0300
Message-ID: <20190927094525.GP32742@smile.fi.intel.com>
References: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 03:18:23PM +0800, Dongchun Zhu wrote:
> Hello,
> =

> This series modifies the interface of async register V4L2 sub-device invo=
ked in probe function for OV5695 CMOS sensor.
> The Omnivision OV5695 image sensor would be used in camera features on Cr=
OS application.
> 5.0 Mega Pixel MIPI Camera Mdoule also supports auto-focus control (AFC) =
with embedded AF VCM Driver.
> =

> Here we use v4l2_async_register_subdev_sensor_common() instead of v4l2_as=
ync_register_subdev()
> to register a sensor sub-device to the asynchronous sub-device framework =
and parse set up
> common sensor-related devices, such as actuator.
> =

> This function is just like=A0v4l2_async_register_subdev()=A0with the exce=
ption that calling it will also parse
> firmware interfaces for remote references using=A0v4l2_async_notifier_par=
se_fwnode_sensor_common()
> and registers the async sub-devices.
> =

> After applying this change, we can see the VCM move when changing the sce=
ne.

When you derive Cc list, set some threshold to the get_maintainer.pl, like

	scripts/get_maintainer.pl --git --git-min-percent=3D67

-- =

With Best Regards,
Andy Shevchenko
