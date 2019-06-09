From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 0/7] Allwinner H6 DMA support
Date: Sun, 9 Jun 2019 22:42:31 +0200
Message-ID: <CAJiuCcebCkdkR9tDOUOEO+Rs-VuSUVLtDpqw3pWUX8o8aPtMsw@mail.gmail.com>
References: <20190527201459.20130-1-peron.clem@gmail.com> <20190528111024.gj25jh5vstizze74@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528111024.gj25jh5vstizze74@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Tue, 28 May 2019 at 13:10, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Mon, May 27, 2019 at 10:14:52PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > This series has been first proposed by Jernej Skrabec[1].
> > As this series is mandatory for SPDIF/I2S support and because he is
> > busy on Cedrus stuff. I asked him to make the minor change requested
> > and repost it.
> > Authorship remains to him.
> >
> > I have tested this series with SPDIF driver and added a patch to enable
> > DMA_SUN6I_CONFIG for arm64.
> >
> > Original Post:
> > "
> > DMA engine engine on H6 almost the same as on older SoCs. The biggest
> > difference is that it has slightly rearranged bits in registers and
> > it needs additional clock, probably due to iommu.
> >
> > These patches were tested with I2S connected to HDMI. I2S needs
> > additional patches which will be sent later.
>
> For the whole series,
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks, Is it ok to pick patch 5/6/7 to sunxi tree ?

Regards,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
