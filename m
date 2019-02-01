From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/5] Add initial Bitmain BM1880 SoC/Board support
Date: Fri, 1 Feb 2019 09:41:52 +0100
Message-ID: <CAK8P3a3DVniy47azCP=NAWecCZST_huaeXjLKRczBsit7e4uKQ@mail.gmail.com>
References: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
 <CAK8P3a3Y_w5_ZavpyUh0VKrS8FeUPTJKkchtGGLc1qe3nG2mfA@mail.gmail.com> <20190201035005.GA4283@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201035005.GA4283@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 1, 2019, 04:50 Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org wrote:
> On Sun, Jan 27, 2019 at 10:24:09AM +0100, Arnd Bergmann wrote:
> > On Sat, Jan 26, 2019 at 5:11 AM Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > This patchset adds initial support for Bitmain BM1880 SoC and Sophon
> > > Edge board. BM1880 SoC consists of a Dual Core ARM Cortex A53 Application
> > > processor subsystem, a single core RISC-V subsystem and a Tensor
> > > Processor subsystem. This patchset adds support for only ARM Cortex
> > > A53 Application processor subsystem with UART, which enables the board to
> > > boot into initramfs with 2 CPUs.
> >
> > Nice work! All patches in this series
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks. What is the merge strategy for this patchset? Shall I send a
> Pull Request to arm@kernel.org with topic branches?

I think we should take new platforms as a single topic branch separate
from the normal branches, so please send a single pull request for this
one.

Also, if you have drivers that are closely tied to this platform, that
branch include those as well, provided that you have an Ack from the
respective subsystem maintainers.

     Arnd
