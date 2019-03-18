From: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 4/6] nvmem: sunxi_sid: Read out data in native format
Date: Mon, 18 Mar 2019 17:09:44 +0800
Message-ID: <CAGb2v64pq5V0_nZ7f0ZPwuNxNU8HbY0A6CqeC6TMd2z2xhJHwg@mail.gmail.com>
References: <20190318073354.12151-1-wens@kernel.org> <20190318073354.12151-5-wens@kernel.org>
 <20190318084212.lv2lorskizl65uzg@flea> <CAGb2v67H9FkjKjSE5a7fUCb_t95Zfuk1p0bjWYJxjMqhMN-hfg@mail.gmail.com>
 <20190318085751.kziqzxnadtho4kdb@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318085751.kziqzxnadtho4kdb@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 18, 2019 at 4:57 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, Mar 18, 2019 at 04:45:19PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Mar 18, 2019 at 4:42 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Mar 18, 2019 at 03:33:52PM +0800, Chen-Yu Tsai wrote:
> > > > From: Chen-Yu Tsai <wens@csie.org>
> > > >
> > > > Originally the SID e-fuses were thought to be in big-endian format.
> > > > Later sources show that they are in fact native or little-endian.
> > > > The most compelling evidence is the thermal sensor calibration data,
> > > > which is a set of one to three 16-bit values. In native-endian they
> > > > are in 16-bit cells with increasing offsets, whereas with big-endian
> > > > they are in the wrong order, and a gap with no data will show if there
> > > > are one or three cells.
> > > >
> > > > Switch to a native endian representation for the nvmem device. For the
> > > > H3, the register read-out method was already returning data in native
> > > > endian. This only affects the other SoCs.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > >
> > > I thought only the newer SoCs were impacted by this issue?
> >
> > It is noticable on the newer SoCs. The old ones only have the 128-bit SID,
> > which could be read either way, as AFAIK it's just a serial number.
> >
> > If you think we should leave the old ones alone I can factor that in.
>
> IIRC, there was also the SoC ID in the SID on those SoCs as well,
> which we might have to use in the future so we'll want to make sure it
> is correct.

We'll need to ask Allwinner about this then.

FWIW, the fel command in sunxi-tools reads them out in little endian. I
believe this and the SID page on the linux-sunxi wiki predate the sunxi_sid
driver.

ChenYu
