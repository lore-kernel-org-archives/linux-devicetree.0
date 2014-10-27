From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v1 0/2] ARM: hip04: add GPIO support
Date: Mon, 27 Oct 2014 19:23:47 +0800
Message-ID: <CAN1soZzn6p5LjpMSeP5crShARWU2=SOPQbs1vSosstXPqRFLKQ@mail.gmail.com>
References: <1413978960-10717-1-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413978960-10717-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Wang <wangzhou.bry@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, wangzhou1@hisilicon.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 22, 2014 at 7:55 PM, Zhou Wang <wangzhou.bry@gmail.com> wrote:
> This series add the support for the GPIOs of Hisilicon Soc hip04. Hip04 uses
> synopsis' GPIO IP, and we use the dwapb GPIO driver here. This series add the
> corresponding dts.
>
> As the hip04 basic dts has been merged in 3.18 mainline kernel, I just resend
> this patchset for review.
>
> Zhou Wang (2):
>   ARM: hip04: set ARCH_NR_GPIO to 128
>   ARM: dts: hip04: add GPIO pieces
>
>  arch/arm/Kconfig             |    1 +
>  arch/arm/boot/dts/hip04.dtsi |   75 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>

Acked-by: Haojian Zhuang <haojian.zhuang@gmail.com>
