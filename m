From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v2 2/4] powerpc, mpc52xx: add a4m072 board support
Date: Mon, 19 Mar 2012 00:38:57 +0100
Message-ID: <20120319003857.7a64163f@wker>
References: <1308729311-15375-3-git-send-email-hs@denx.de>
 <1308739150-31527-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1308739150-31527-1-git-send-email-hs@denx.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Heiko Schocher <hs@denx.de>
Cc: devicetree-discuss@ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Wed, 22 Jun 2011 12:39:10 +0200
Heiko Schocher <hs@denx.de> wrote:
...
> diff --git a/arch/powerpc/boot/dts/a4m072.dts b/arch/powerpc/boot/dts/a4m072.dts
> new file mode 100644
> index 0000000..adb6746
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/a4m072.dts
...
> +		cdm@200 {
> +			fsl,ext_48mhz_en = <0x0>;
> +			fsl,fd_enable = <0x01>;
> +			fsl,fd_counters = <0xbbbb>;

When applying this patch I've fixed these properties according to
previously added bindings (fsl,init-*-*), but one question remains:
is fd-counters value really 0xbbbb? Here, the 3rd bit in each nibble
should always be cleared as mentioned in the register description.

...
> +		timer@600 {
> +			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
> +			reg = <0x600 0x80>;
> +			interrupts = <1 9 0>;

I've removed above three lines as these are already in the dtsi file.

Thanks,
Anatolij
