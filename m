From: Yao Yuan <yao.yuan@freescale.com>
Subject: RE: [PATCH 4/4] ARM: dts: vf610-twr: relicense vf610-twr.dts under
 GPLv2/X11
Date: Sat, 5 Dec 2015 06:23:21 +0000
Message-ID: <BLUPR03MB13440BF1E1451539A75265C830B0@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1448323302-23563-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448323302-23563-1-git-send-email-stefan@agner.ch>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stoica Cosmin Stefan <cosminstefan.stoica@freescale.com>, Bill Pringlemeir <bpringle@sympatico.ca>, Duan Andy <fugang.duan@freescale.com>, Cory Tusar <cory.tusar@pid1solutions.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/24/2015 07:57 AM, Stefan Agner wrote:

> GPLv2-only devicetrees make reuse difficult for software components licensed
> under a different license.
> 
> The consensus is that a GPL/X11 dual-license should allow all necessary uses, so
> relicense the vf610-twr.dts file to this combination.
> 
> CCs were acquired using (updated some email addresses):
> git shortlog -sne --no-merges arch/arm/boot/dts/vf610-twr.dts
> 
> CC: Bill Pringlemeir <bpringle@sympatico.ca>
> CC: Chao Fu <B44548@freescale.com>
> CC: Cory Tusar <cory.tusar@pid1solutions.com>
> CC: Cosmin Stoica <cosminstefan.stoica@freescale.com>
> CC: Fugang Duan <B38611@freescale.com>
> CC: Jingchang Lu <b35083@freescale.com>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Xiubo Li <Li.Xiubo@freescale.com>

Acked-by: Yuan Yao <yao.yuan@freescale.com>

By the way the email address:
CC: Xiubo Li <Li.Xiubo@freescale.com>
Jingchang Lu <b35083@freescale.com>
Chao Fu <B44548@freescale.com>
is no longer valid.

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  arch/arm/boot/dts/vf610-twr.dts | 40
> ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-
> twr.dts index 5438ee4..ce937b9 100644
> --- a/arch/arm/boot/dts/vf610-twr.dts
> +++ b/arch/arm/boot/dts/vf610-twr.dts
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
