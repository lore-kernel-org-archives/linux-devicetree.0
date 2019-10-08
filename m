From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 0/3] reset: meson: add Meson-A1 SoC support
Date: Tue, 08 Oct 2019 16:23:06 +0200
Message-ID: <1570544586.18914.9.camel@pengutronix.de>
References: <1569738255-3941-1-git-send-email-xingyu.chen@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1569738255-3941-1-git-send-email-xingyu.chen@amlogic.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Xingyu Chen <xingyu.chen@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Xingyu,

On Sun, 2019-09-29 at 14:24 +0800, Xingyu Chen wrote:
> This patchset adds support for Meson-A1 SoC Reset Controller. A new struct
> meson_reset_param is introduced to describe the register differences between
> Meson-A1 and previous SoCs.
>
> Changes since v2 at [1]:
> - add comments in header file to indicate holes
> - reorder the Signed-off-by and Reviewed-by
> - remove Jianxin's Signed-off-by
> - add Kevin's Reviewed-by

Thank you, I have applied patches 2 and 3 to reset/next.

regards
Philipp

> Changes since v1 at [0]:
> - rebase on linux-next
> - add Neil's Reviewed-by
> 
> [0] https://lore.kernel.org/linux-amlogic/1568808746-1153-1-git-send-email-xingyu.chen@amlogic.com
> [1] https://lore.kernel.org/linux-amlogic/1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com
> 
> Xingyu Chen (3):
>   arm64: dts: meson: add reset controller for Meson-A1 SoC
>   dt-bindings: reset: add bindings for the Meson-A1 SoC Reset Controller
>   reset: add support for the Meson-A1 SoC Reset Controller
> 
>  .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  6 ++
>  drivers/reset/reset-meson.c                        | 35 ++++++++--
>  include/dt-bindings/reset/amlogic,meson-a1-reset.h | 74 ++++++++++++++++++++++
>  4 files changed, 109 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h
> 
