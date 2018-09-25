From: =?UTF-8?Q?Rodrigo_Exterck=C3=B6tter_Tj=C3=A4der?=
        <rodrigo@tjader.xyz>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: Olimex A64-OLinuXino: enable eMMC.
Date: Tue, 25 Sep 2018 14:47:59 -0300
Message-ID: <CAG7TQgFTsR4pf4jAcWMFoOmiP7AXYqjts60RP2kuJGU44AcQJQ@mail.gmail.com>
References: <20180919141815.18737-1-rodrigo@tjader.xyz> <20180921142811.h5jraemk565alh3i@flea>
 <CAG7TQgE_KU_cK_4E+NG8Qcw-QB2=C6YoqBYR2svmWxywFyySCw@mail.gmail.com> <20180925090139.qbu6tqav5oth7zkw@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925090139.qbu6tqav5oth7zkw@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 6:01 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> We can't really do that, unfortunately. If the device tree name was to
> change for a given board, we'd break all the build systems, boot
> scripts and distros out there.

What if we keep the device tree for the version without WiFi and eMMC
with the current name and create new device trees for the other two
versions?
