From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] arm64: dts: uniphier: Add PCIe host controller and PHY
 nodes
Date: Mon, 21 Jan 2019 08:02:18 +0900
Message-ID: <CAK7LNARYk12eSzFDr7r7UQJD+0NZy9fgJtuxCV3ZYuA4WS3pjg@mail.gmail.com>
References: <1545283393-2078-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545283393-2078-1-git-send-email-hayashi.kunihiko@socionext.com>
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

On Thu, Dec 20, 2018 at 3:46 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Add PCIe host controller and PHY nodes. This supports for LD20, PXs3 and
> their boards.
>
> This node defines PCIe memory, I/O, and config spaces as follows.
>
>   MEM: 20000000-2ffdffff (255MB)
>   I/O: 2ffe0000-2ffeffff ( 64KB)
>   CFG: 2fff0000-2fffffff ( 64KB)
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   | 47 ++++++++++++++++++++++
>  .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts |  4 ++
>  arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   | 47 ++++++++++++++++++++++
>  3 files changed, 98 insertions(+)


Applied to linux-uniphier. Thanks.


-- 
Best Regards
Masahiro Yamada
