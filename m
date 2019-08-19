From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] ARM: dts: socfpga: update to new Denali NAND binding
Date: Mon, 19 Aug 2019 15:17:59 +0900
Message-ID: <CAK7LNASrdNwFEEFoy8mH4CnWHN5d8qCw_LeU1St0x1oa9jRNFQ@mail.gmail.com>
References: <20190621112306.17769-1-yamada.masahiro@socionext.com> <0e357fa8-3241-4ce4-fae7-d0ad36fb14c6@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0e357fa8-3241-4ce4-fae7-d0ad36fb14c6@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 12:39 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
>
>
> On 6/21/19 6:23 AM, Masahiro Yamada wrote:
> > With commit d8e8fd0ebf8b ("mtd: rawnand: denali: decouple controller
> > and NAND chips"), the Denali NAND controller driver migrated to the
> > new controller/chip representation.
> >
> > Update DT for it.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  arch/arm/boot/dts/socfpga.dtsi                |  2 +-
> >  arch/arm/boot/dts/socfpga_arria10.dtsi        |  2 +-
> >  .../boot/dts/socfpga_arria10_socdk_nand.dts   | 20 ++++++++++++-------
> >  3 files changed, 15 insertions(+), 9 deletions(-)
> >
>
> Applied! Thanks!
>
> Dinh


You did not send this to upstream for v5.3-rc1.

Which version is this aiming for?





-- 
Best Regards
Masahiro Yamada
