From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/4] ARM: dts: uniphier: Add USB3 controller nodes
Date: Wed, 3 Oct 2018 12:39:12 +0900
Message-ID: <CAK7LNAQjXkD_j3WO=SR=5708f=C7tmcZUc9ryZ5mXnMnKujmZw@mail.gmail.com>
References: <1538478722-20351-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1538478722-20351-2-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1538478722-20351-2-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 2, 2018 at 8:12 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Add USB3 controller nodes including usb-core, resets, regulator, ss-phy
> and hs-phy. This supports for Pro4, PXs2 and the boards.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  arch/arm/boot/dts/uniphier-pro4-ace.dts    |   8 ++
>  arch/arm/boot/dts/uniphier-pro4-ref.dts    |   8 ++
>  arch/arm/boot/dts/uniphier-pro4.dtsi       |  94 +++++++++++++++
>  arch/arm/boot/dts/uniphier-pxs2-gentil.dts |   8 ++
>  arch/arm/boot/dts/uniphier-pxs2-vodka.dts  |   4 +
>  arch/arm/boot/dts/uniphier-pxs2.dtsi       | 180 +++++++++++++++++++++++++++++
>  6 files changed, 302 insertions(+)


I will enable this on uniphier-ld6b-ref.dts
and uniphier-pro4-sanji.dts as well
when I pick up this series.


-- 
Best Regards
Masahiro Yamada
