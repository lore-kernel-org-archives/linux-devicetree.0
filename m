From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 engine driver support
Date: Mon, 25 Apr 2016 10:04:15 +0100
Message-ID: <20160425090415.GB20365@dell>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-4-git-send-email-peter.griffin@linaro.org>
 <C246CAC1457055469EF09E3A7AC4E11A4A57989B@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A57989B-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "maxime.coquelin-qxv4g6HH51o@public.gmane.org" <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, "patrice.chotard-qxv4g6HH51o@public.gmane.org" <patrice.chotard-qxv4g6HH51o@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "ludovic.barre-qxv4g6HH51o@public.gmane.org" <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Apr 2016, Appana Durga Kedareswara Rao wrote:
> > -----Original Message-----
> > From: dmaengine-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:dmaengine-
> > owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Peter Griffin
> > Sent: Thursday, April 21, 2016 4:34 PM
> > To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TasMV2rI37PzA@public.gmane.org=
org;
> > srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; maxime.coquelin-qxv4g6HH51o@public.gmane.org;
> > patrice.chotard-qxv4g6HH51o@public.gmane.org; vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> > Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> > dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; arnd@arndb.d=
e;
> > broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; ludovic.barre-qxv4g6HH51o@public.gmane.org
> > Subject: [PATCH 03/18] dmaengine: st_fdma: Add STMicroelectronics F=
DMA
> > engine driver support

What is this text?  If you wish to contribute to upstream mailing
lists, please fix your email client.  Also, please read:

  Documentation/email-clients.txt

> > This patch adds support for the Flexible Direct Memory Access (FDMA=
) core
> > driver. The FDMA is a slim core CPU with a dedicated firmware.
> > It is a general purpose DMA controller capable of supporting 16
> > independent DMA channels. Data moves maybe from memory to memory
> > or between memory and paced latency critical real time targets and =
it
> > is found on al STi based chipsets.
> >=20
> > Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/dma/Kconfig   |  12 +
> >  drivers/dma/Makefile  |   1 +
> >  drivers/dma/st_fdma.c | 967
> > ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 980 insertions(+)
> >  create mode 100644 drivers/dma/st_fdma.c

[...]
> > +static int st_fdma_clk_enable(struct st_fdma_dev *fdev)
> > +{
> > +	int i, ret;
> > +
> > +	for (i =3D 0; i < CLK_MAX_NUM; i++) {
> > +		ret =3D clk_prepare_enable(fdev->clks[i]);
> > +		if (ret < 0)
>=20
> You should disable and unprepared the other clocks...

Replying to a 1000 line email and not snipping (especially for a one
single-line comment), it considered bad etiquette.  Please remove all
unrelated text in future.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
