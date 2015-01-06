From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v18 12/12] drm: bridge/dw_hdmi: add rockchip rk3288 support
Date: Tue, 6 Jan 2015 13:51:29 +0000
Message-ID: <20150106135129.GG12302@n2100.arm.linux.org.uk>
References: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
 <1417761259-17429-1-git-send-email-andy.yan@rock-chips.com>
 <CAGS+omA1Gf8yqrd4Bu=Pm1OBdsJBHg0gt+TP_6vi88Zz+O3jHA@mail.gmail.com>
 <6479148.dVz0vTNYfK@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <6479148.dVz0vTNYfK@phil>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Kurtz <djkurtz@chromium.org>, Yakir Yang <ykk@rock-chips.com>, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Xu Jianqun <jay.xu@rock-chips.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, "mark.yao@rock-chips.com" <mark.yao@rock-chips.com>, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.o>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 11, 2014 at 12:24:15PM +0100, Heiko St=FCbner wrote:
> Past practices suggest that having the dw in the name is a sane solution =
too, =

> like in dw_mmc-foo (mmc/host), dwmac-foo (net/ethernet/stmicro/stmmac).
> =

> And personally I'd keep to this already established naming scheme ... i.e=
. not =

> hiding the dw heritage.
> =

> And also it looks like other involved parties like Philipp and Russell se=
emed =

> to be ok with the naming through the revisions till now.

I don't have much of a preference when it comes to this.  I was disappointed
that the original imx-hdmi driver did not use "dw" in its filename, as the
documentation clearly stated in several places that it was a designware
part, and as we all know, they're a company which sells IP, so their
designs are going to crop up in different places.

So I welcome this patch set - and I've also tested it on a SolidRun
Hummingboard i2ex along with all my CEC and audio patches, where it
seems to be fine.  So for the set:

Tested-by: Russell King <rmk+kernel@arm.linux.org.uk>

Apart from the two minor items I've pointed out in separate replies:

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

Thanks.

-- =

FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
