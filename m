From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/4] add additional required properties for UniPhier
 ethernet nodes
Date: Wed, 25 Apr 2018 00:28:45 +0900
Message-ID: <CAK7LNAT2acPfF-mK47Lu3Qc89TrFmSCppLXqSxYiX+eJ=ZKXSg@mail.gmail.com>
References: <1524545223-5893-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524545223-5893-1-git-send-email-hayashi.kunihiko@socionext.com>
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

2018-04-24 13:46 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
> Add required clocks and their names, resets and their names, and system
> controller properties to fix the activation issues for the ethernet
> controllers implemented on some UniPhier SoCs.
>
> Kunihiko Hayashi (4):
>   ARM: dts: uniphier: add required clocks and resets to Pro4 ethernet
>     node
>   arm64: dts: uniphier: add clock-names and reset-names to ethernet node
>   ARM: dts: uniphier: add syscon-phy-mode property to each ethernet node
>   arm64: dts: uniphier: add syscon-phy-mode property to each ethernet
>     node

All applied to linux-uniphier.  Thanks!







-- 
Best Regards
Masahiro Yamada
