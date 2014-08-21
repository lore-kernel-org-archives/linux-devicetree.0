From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Thu, 21 Aug 2014 16:38:36 +0100
Message-ID: <20140821153836.GO4266@lee--X1>
References: <1408627817-16171-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1408627817-16171-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, mturquette@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, grant.likely@linaro.org, hl@rock-chips.com, huangtao@rock-chips.com, cf@rock-chips.com, zhangqing@rock-chips.com, xxx@rock-chips.com, dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, dtor@chromium.org, javier.martinez@collabora.co.uk, kever.yang@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Thu, 21 Aug 2014, Chris Zhong wrote:
> The RK808 chip is a power management IC for multimedia and handheld
> devices. It contains the following components:
>=20
> - Regulators
> - RTC
>=20
> The rk808 core driver is registered as a platform driver and provides
> communication through I2C with the host device for the different
> components.
>=20
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>=20
> ---
>=20
> Changes in v3: None

Why haven't you fixed up my review comments?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
