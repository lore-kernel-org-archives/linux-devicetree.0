From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH] arm64: dts: mt8183: Add node for the Mali GPU
Date: Thu, 19 Sep 2019 06:16:48 +0800
Message-ID: <CANMq1KD++==d0Mb6T2gKU1T7c_MaedswOYdxqEqEKKUL1bxgiw@mail.gmail.com>
References: <20190905081546.42716-1-drinkcat@chromium.org> <CAL_JsqJCO2G90TTT9Mpy4kjVKQyXWw4aXEEnbRp_SE8X=EGc5g@mail.gmail.com>
 <CANMq1KCTPdFhJG1SLf-i+-557Yx-1WLzWCHu3tT_5Q2BF+JgdQ@mail.gmail.com> <20190913181729.GB3115@kevin>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913181729.GB3115@kevin>
Sender: linux-kernel-owner@vger.kernel.org
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nick Fan <nick.fan@mediatek.com>, Boris Brezillon <boris.brezillon@collabora.com>, Douglas Anderson <dianders@chromium.org>, Dominik Behr <dbehr@chromium.org>
List-Id: devicetree@vger.kernel.org

Thanks Rob and Alyssa.

+Douglas Anderson +Dominik Behr who may be interested (if not already aware)

On Sat, Sep 14, 2019 at 2:17 AM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> > > > The binding we use with out-of-tree Mali drivers includes more
> > > > clocks, I assume this would be required eventually if we have an
> > > > in-tree driver:
> > >
> > > We have an in-tree driver...
> >
> > Right but AFAICT it does not support Bifrost GPU (yet?).
>
> By the time MT8183 shows up in more concrete devices, it will, certainly
> in kernel-space and likely in userspace as well. At present, the DDK can
> be modified to run on top of the in-tree Mali drivers, i.e. "Bifrost on
> mainline linux-next (+ page table/compatible patches), with blob
> userspace".
>
> While the open userspace isn't ready here quite yet, I would definitely
> encourage upstream kernel for ChromeOS, since then there's no need to
> maintain the out-of-tree GPU driver.

That's an interesting idea, I had no idea, thanks for the info!

Would that work with midgard as well? We have released hardware with
RK3288/3399, so it might be nice to experiment with these first.

>
> ---
>
> More immediately, per Rob's review, it's important that the bindings
> accepted upstream work with the in-tree Bifrost driver. Conceptually,
> once Mesa supports Bifrost, if I install Debian on a MT8183 board,
> everything should just work. I shouldn't need MT-specific changes / need
> to change names for the DT. Regardless of which kernel driver you end up
> using, minimally sharing the DT is good for everyone :-)

Yes. I'll try to dig further with MTK, but this may take some time.

>
> -Alyssa
