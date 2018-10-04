From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/4] ARM: dts: uniphier: Add USB3 controller nodes
Date: Thu, 4 Oct 2018 09:49:31 +0900
Message-ID: <CAK7LNATgBVDt3g4OfxF4kj5w-_u3Y4Yd9-FjC3wseijoR12O0g@mail.gmail.com>
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


Series, applied.

Thanks.


-- 
Best Regards
Masahiro Yamada
