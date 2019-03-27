From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 1/1] arm64: dts: renesas: use extended audio dmac
 register
Date: Wed, 27 Mar 2019 12:16:03 +0100
Message-ID: <20190327111558.yw2wld4oivcw5x7a@verge.net.au>
References: <20190326095826.4987-1-jiada_wang@mentor.com>
 <20190326095826.4987-2-jiada_wang@mentor.com>
 <CAMuHMdUOcPhy5D-RagprwZkqOOgNt+4bGfSLQzydydHBOt76kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUOcPhy5D-RagprwZkqOOgNt+4bGfSLQzydydHBOt76kQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jiada Wang <jiada_wang@mentor.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 11:09:45AM +0100, Geert Uytterhoeven wrote:
> On Tue, Mar 26, 2019 at 10:59 AM Jiada Wang <jiada_wang@mentor.com> wrote:
> > Basic audio dmac register only supports busif from 0 to 3,
> > in order to use busif4 ~ busif7, extended audio dmac register
> > need to be used.
> >
> > This patch updates H3 (= r8a7795), M3-W (= r8a7796) and
> > M3-N (=r8a77965) to use extended audio dmac register set.
> >
> > Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Jiada,

applied for v5.2 with Morimoto-san's Ack from v3.
