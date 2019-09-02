From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v5 00/18] add thermal driver for h6
Date: Mon, 2 Sep 2019 09:27:35 +0200
Message-ID: <20190902072735.zkrueocyz4glc26n@flea>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
 <20190901215214.f4vbxemdd7mf3gun@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190901215214.f4vbxemdd7mf3gun@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Sep 01, 2019 at 11:52:14PM +0200, Ondřej Jirman wrote:
> Hello Yangtao,
>
> On Sat, Aug 10, 2019 at 05:28:11AM +0000, Yangtao Li wrote:
> > This patchset add support for A64, H3, H5, H6 and R40 thermal sensor.
> >
> > Thx to Icenowy and Vasily.
> >
> > BTY, do a cleanup in thermal makfile.
>
> I've added support for A83T and also some cleanups, according to my
> feedback:
>
> https://megous.com/git/linux/log/?h=ths-5.3
>
> Feel free to pick up whatever you like from that tree.
>
> For others, there are also DTS patches in that tree for H3, H5, A83T, and H6, so
> that shoul make testing of this driver easier.

I'm not convinced that always expanding the number of SoC supported is
the best strategy to get this merged. Usually, keeping the same
feature set across version, consolidating that, and then once it's in
sending the new SoC support works best.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
