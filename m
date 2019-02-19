From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/5] nvmem: sunxi-sid: add support for H5's SID controller
Date: Tue, 19 Feb 2019 23:07:44 +0800
Message-ID: <CAGb2v64vtTZy7yWcaQ2xKXzU1Jem7PW_hXaWZ9GjT+j0uFOt2w@mail.gmail.com>
References: <20190217162316.14111-1-tiny.windzz@gmail.com>
 <20190217162316.14111-3-tiny.windzz@gmail.com>
 <20190218084931.fdut6d4cgwkwvihx@flea>
 <CAGb2v65Frw+=DjcuqNUPd-UG6qsiVDBH0bd5btx+5=ns7VAQrQ@mail.gmail.com>
 <20190219150311.yfqkr5svs6b3arjy@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190219150311.yfqkr5svs6b3arjy@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 11:03 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Mon, Feb 18, 2019 at 05:19:40PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Feb 18, 2019 at 4:49 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Sun, Feb 17, 2019 at 11:23:13AM -0500, Yangtao Li wrote:
> > > > Add support for H5's SID controller.
> > > >
> > > > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > > > ---
> > > >  drivers/nvmem/sunxi_sid.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> > > > index 570a2e354f30..036029e90921 100644
> > > > --- a/drivers/nvmem/sunxi_sid.c
> > > > +++ b/drivers/nvmem/sunxi_sid.c
> > > > @@ -219,11 +219,17 @@ static const struct sunxi_sid_cfg sun50i_a64_cfg = {
> > > >       .size = 0x100,
> > > >  };
> > > >
> > > > +static const struct sunxi_sid_cfg sun50i_h5_cfg = {
> > > > +     .value_offset = 0x200,
> > > > +     .size = 0x100,
> > > > +};
> > >
> > > IIRC, there was an endianness issue on the newer SoCs, with the driver
> > > converting the data from big endian to little endian, while it's
> > > actually stored little endian in the SID.
> >
> > About that, it seems the internals are either little endian or native (same
> > as the bus). Either way the nvmem the driver currently exposes is wrong.
>
> Do you mean that it can be configured either way, or it's little
> endian and since you are running a little endian system you can't
> tell?

I can't tell. There doesn't seem to be a toggle for endianess though.

> > My idea is to keep the current one with the current name, but have it not
> > associate itself with the DT node. We then register an extra one, called
> > "sunxi-sid-native" which uses the native endian. This one will be associated
> > with the DT node, so the THS driver can consume nvmem cells.
> >
> > What do you think?
>
> I thought about this some more, and I don't think anyone really has
> used the sysfs interface for it. Since the data are in an unusable
> order (without an additional conversion at least), we would have had a
> bug report by now (just like we had when someone tried to use it for
> the thermal calibration).
>
> So maybe the easy way out is just to disable the conversion on the
> affected SoCs, and see if anyone complains?

That works. And please see my other mail about the DT nvmem cell arrangement.

ChenYu
