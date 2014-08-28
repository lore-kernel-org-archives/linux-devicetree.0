From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Thu, 28 Aug 2014 08:33:42 +0100
Message-ID: <20140828073342.GH24579@lee--X1>
References: <1409062444-12019-1-git-send-email-zyw@rock-chips.com>
 <20140827133936.GD6364@lee--X1>
 <12367482.Ifp3ZtRrMQ@dtor-glaptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <12367482.Ifp3ZtRrMQ@dtor-glaptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@chromium.org>
Cc: Chris Zhong <zyw@rock-chips.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, mturquette@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, grant.likely@linaro.org, hl@rock-chips.com, huangtao@rock-chips.com, cf@rock-chips.com, zhangqing@rock-chips.com, xxx@rock-chips.com, dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, javier.martinez@collabora.co.uk, kever.yang@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Wed, 27 Aug 2014, Dmitry Torokhov wrote:

> On Wednesday, August 27, 2014 02:39:36 PM Lee Jones wrote:
> > On Tue, 26 Aug 2014, Chris Zhong wrote:
> > > +
> > > +static struct of_device_id rk808_of_match[] =3D {
> > > +	{ .compatible =3D "rockchip,rk808" },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, rk808_of_match);
> > > +
> > > +static const struct i2c_device_id rk808_ids[] =3D {
> > > +	 { "rk808" },
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(i2c, rk808_ids);
> >=20
> > My OCD senses are tingling.  Either have a blank line above the cal=
ls
> > to MODULE_DEVICE_TABLE() or don't.
>=20
> Wait, don't we also need sentinel entries in both these tables?

Good spot, yes please.

 { },

Will do fine.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
