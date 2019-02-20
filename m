From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 2/5] nvmem: sunxi-sid: add support for H5's SID controller
Date: Wed, 20 Feb 2019 22:05:10 +0800
Message-ID: <CAEExFWuAwUzXwjTiekGsjxY0Jop5_tYVgLj5gi9+Kqq=aFyT4w@mail.gmail.com>
References: <20190217162316.14111-1-tiny.windzz@gmail.com>
 <20190217162316.14111-3-tiny.windzz@gmail.com>
 <20190218084931.fdut6d4cgwkwvihx@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190218084931.fdut6d4cgwkwvihx@flea>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, robh+dt@kernel.org, Srini Kandagatla <srinivas.kandagatla@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

HI Maxime and ChenYu,

On Mon, Feb 18, 2019 at 4:49 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Sun, Feb 17, 2019 at 11:23:13AM -0500, Yangtao Li wrote:
> > Add support for H5's SID controller.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/nvmem/sunxi_sid.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> > index 570a2e354f30..036029e90921 100644
> > --- a/drivers/nvmem/sunxi_sid.c
> > +++ b/drivers/nvmem/sunxi_sid.c
> > @@ -219,11 +219,17 @@ static const struct sunxi_sid_cfg sun50i_a64_cfg = {
> >       .size = 0x100,
> >  };
> >
> > +static const struct sunxi_sid_cfg sun50i_h5_cfg = {
> > +     .value_offset = 0x200,
> > +     .size = 0x100,
> > +};
>
> IIRC, there was an endianness issue on the newer SoCs, with the driver
> converting the data from big endian to little endian, while it's
> actually stored little endian in the SID.
>
> Have you checked the SID content?
It seems that data by hexdump /sys/bus/nvmem/devices/sunxi_sid/nvmem or
by md command in uboot , the data is different in some soc.

Sorry, I replied a bit late.
Any suggestions to solve it?

Yangtao
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
