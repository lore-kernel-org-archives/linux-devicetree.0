From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/10] MIPS: dts: qca: ar9132: fix typo: "ppl" -> "pll"
Date: Sun, 21 Feb 2016 20:54:20 -0600
Message-ID: <20160222025420.GI15973@rob-hp-laptop>
References: <1455400697-29898-1-git-send-email-antonynpavlov@gmail.com>
 <1455400697-29898-3-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1455400697-29898-3-git-send-email-antonynpavlov@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Marek Vasut <marex@denx.de>, Wills Wang <wills.wang@live.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 14, 2016 at 12:58:09AM +0300, Antony Pavlov wrote:
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Alban Bedel <albeu@free.fr>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/clock/qca,ath79-pll.txt | 2 +-
>  arch/mips/boot/dts/qca/ar9132.dtsi                        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I'd just roll this into the previous patch.

Acked-by: Rob Herring <robh@kernel.org>
