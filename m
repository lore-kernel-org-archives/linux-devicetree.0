From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/2] ASoC: simple-card: Add documentation
 for force-dpcm property
Date: Mon, 14 Oct 2019 16:17:31 +0300
Message-ID: <CAEnQRZDbXZUhix_aR_DCUzFn1NYz1Zh7MxW5uwnuycps9PNohw@mail.gmail.com>
References: <20191013190014.32138-1-daniel.baluta@nxp.com> <20191013190014.32138-3-daniel.baluta@nxp.com>
 <20191014115635.GB4826@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014115635.GB4826@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Guido Roncarolo <guido.roncarolo@nxp.com>, Jerome Laclavere <jerome.laclavere@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 14, 2019 at 2:57 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Oct 13, 2019 at 10:00:14PM +0300, Daniel Baluta wrote:
>
> > This property can be global in which case all links created will be DPCM
> > or present in certian dai-link subnode in which case only that specific
> > link is forced to be DPCM.
>
> > +- force-dpcm                         : Indicates dai-link is always DPCM.
>
> DPCM is an implementation detail of Linux (and one that we want to phase
> out going forwards too), we shouldn't be putting it in the DT bindings
> where it becomes an ABI.

Hi Mark,

I see your point. This is way I marked the patch series as RFC. I need to find
another way to reuse simple-card as machine driver for SOF.

thanks,
Daniel.
