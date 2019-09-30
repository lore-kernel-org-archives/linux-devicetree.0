From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
Date: Mon, 30 Sep 2019 10:08:19 -0500
Message-ID: <CAL_JsqJf-TGE-SWWj=6AVbpfuN1AsEdDTSOCOk+iUzTT3yZSgw@mail.gmail.com>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
 <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com>
 <0bf7c8c8-d03e-c08e-4879-3d3a2fb90ca7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0bf7c8c8-d03e-c08e-4879-3d3a2fb90ca7@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 30, 2019 at 7:45 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>
> On 9/24/19 12:33 AM, Rob Herring wrote:
> > On Fri, Sep 13, 2019 at 10:14 AM Rob Herring wrote:
> >>
> >> On Sat, Sep 7, 2019 at 5:16 PM wrote:
> >>>
> >>> From: Marek Vasut
> >>>
> >>> Add dma-ranges property into /soc node to describe the DMA capabilities
> >>> of the bus. This is currently needed to translate PCI DMA ranges, which
> >>> are limited to 32bit addresses.
> >>
> >> FYI, I've started working on this problem and issues around
> >> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.
> >
> > I've pushed out a branch here:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dma-masks
> >
> > Can you test it on Renesas. I don't have a real platform having the issue.
>
>
> With the following patches applied:
>       https://patchwork.ozlabs.org/patch/1144870/

I'd rather not have yet another instance of {dma-}ranges parsing code.
With this series[1], dma-ranges gets parsed into resource list for
you.

>       https://patchwork.ozlabs.org/patch/1144871/

How can this one be applied? It would conflict horribly. Plus I think
it duplicates what's in my series.

Rob

> on R8A7795 Salvator-XS, works fine.

[1] https://lore.kernel.org/linux-arm-kernel/20190924214630.12817-7-robh@kernel.org/T/
