From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: Re: [PATCH 5/6] arm: mvebu: Enable USB controllers on Armada XP
 OpenBlocks AX3-4 board
Date: Wed, 16 Jan 2013 09:01:01 +0900
Message-ID: <CABMQnVLD+VKj53dfQC24AwCboed3EGt+gqTKt-B9q8nhEx3Ytg@mail.gmail.com>
References: <1358243670-11935-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1358243670-11935-5-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1358243670-11935-5-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, Florian Fainelli <florian@openwrt.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,



On Tue, Jan 15, 2013 at 6:54 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Cc: Lior Amsalem <alior@marvell.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
> index b24644f..55f5b6f 100644
> --- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
> +++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
> @@ -127,5 +127,14 @@
>                         nr-ports = <2>;
>                         status = "okay";
>                 };
> +               usb@d0050000 {
> +                       status = "okay";
> +               };
> +               usb@d0051000 {
> +                       status = "okay";
> +               };
> +               usb@d0052000 {
> +                       status = "okay";
> +               };
USB2 of openblocks-ax3-4 is used as Mini-PCIE.
I think this is unnecessary.

>         };
>  };
> --
> 1.7.8.6
>

Best regards,
  Nobuhiro

-- 
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
