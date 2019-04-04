From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 4/5] nvmem: sunxi-sid: add new reg_read func
Date: Thu, 4 Apr 2019 21:36:41 +0800
Message-ID: <CAGb2v67mZU+iNG=_ROqanPT=u3ybV7i+EJ253TiXiNaH4Ky+Cg@mail.gmail.com>
References: <20190402154514.11284-1-tiny.windzz@gmail.com> <20190402154514.11284-5-tiny.windzz@gmail.com>
 <7dc60dd9-3bbb-f215-4554-a0051c0cfbfd@linaro.org> <20190404110508.rbk3z5urndtiqbmq@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404110508.rbk3z5urndtiqbmq@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 4, 2019 at 7:05 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Apr 04, 2019 at 11:59:44AM +0100, Srinivas Kandagatla wrote:
> >
> >
> > On 02/04/2019 16:45, Yangtao Li wrote:
> > > Because there was an endianness issue. It seems that reg_read
> > > function which the nvmem the driver currently exposes is wrong.
> > > So add the new read function, the new function is used when the
> > > native_endian flag is set.
> > >
> > > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> >
> > This patch and 5/5 does not apply cleanly on nvmem-next.
> > Also I would need an ack from Maxime to be able to apply it.
>
> Chen-Yu has mostly been taking care of this recently, so I'd like his
> feedback on this.

As you previously requested, my patches already switch everything
to native endianess. There's no need to differentiate between the
old and the new now. So this patch and the native_endian flag is
not needed.

ChenYu
