From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/15] pinctrl: sh-pfc: Initial R-Car M3-N support
Date: Sun, 18 Feb 2018 20:57:27 -0600
Message-ID: <20180219025727.6yexb4iqmvlt2luq@rob-hp-laptop>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
 <1518515162-23663-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1518515162-23663-5-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 13, 2018 at 10:45:51AM +0100, Jacopo Mondi wrote:
> Add initial PFC support for R-Car M3-N (r8a77965) SoC.
> No groups or functions defined, just pin and registers enumeration.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
>  drivers/pinctrl/sh-pfc/Makefile                    |    1 +
>  drivers/pinctrl/sh-pfc/core.c                      |    6 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 2728 ++++++++++++++++++++
>  drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
>  6 files changed, 2742 insertions(+)
>  create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77965.c
