From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v2 3/7] tegra: fdt: Add extra I2C bindings for
 U-Boot
Date: Fri, 13 Jan 2012 07:31:23 +0100
Message-ID: <4F0FCFBB.3070407@denx.de>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
	<1326394818-32227-4-git-send-email-sjg@chromium.org>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-reply-to: <1326394818-32227-4-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hello Simon,

Simon Glass wrote:
> Add U-Boot's peripheral clock information to the Tegra20 device tree file.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> Changes in v2:
> - Adjust definitions to fit new peripheral clock bindings
> - Change 'speed' to 'clock-frequency'
> - Remove u-boot,pinmux binding (sadly)
> 
>  arch/arm/dts/tegra20.dtsi |   10 +++++++++-

Hmm.. we have no such a directory in the u-boot source tree ... ?
I think, this patch is for the linux tree?

[...]

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
