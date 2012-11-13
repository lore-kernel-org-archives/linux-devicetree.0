From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC] MIPS: BCM63XX: add empty Device Trees for all supported
 boards
Date: Mon, 12 Nov 2012 22:12:35 -0700
Message-ID: <50A1D6C3.2010108@wwwdotorg.org>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com> <1352638249-29298-15-git-send-email-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1352638249-29298-15-git-send-email-jonas.gorski@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Maxime Bizon <mbizon@freebox.fr>, Florian Fainelli <florian@openwrt.org>, Kevin Cernekee <cernekee@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/11/2012 05:50 AM, Jonas Gorski wrote:
> Add empty board files for all boards supported by the legacy board
> support.

> diff --git a/arch/mips/bcm63xx/dts/96328avng.dts b/arch/mips/bcm63xx/dts/96328avng.dts

> +/ {
> +	model = "96328avng";
> +	compatible = "96328avng";

The board should be compatible with both the board name and the SoC on
the board. I know that right now the MIPS code is choosing the DT to use
based on the board name, but I think it's more typical to pass an
explicit DT to the kernel, and then choose the kernel support to execute
based on the compatible value (certainly this is the case on ARM and I
assume other architectures too). That would require the DT content to
include the SoC name in the compatible property, so that the kernel
support didn't then need to contain a table of all supported board names.

> +	ubus@10000000 {
> +
> +	};

Do you need to include this empty node in each file? I guess it gets
added to in the next patch so it's not a big deal though.

> diff --git a/arch/mips/bcm63xx/dts/Kconfig b/arch/mips/bcm63xx/dts/Kconfig

> +config BOARD_96328AVNG
> +	bool "96328avng reference board"
> +	select BCM63XX_CPU_6328

Why not simply compile all DTs whenever the SoC support is enabled? I
suppose you're trying to avoid packing all the DTs into the kernel
image. Does it make more sense to amend the MIPS kernel boot process so
that a single user-/firmware-selected DT is passed to the kernel, rather
than packing the DTs into the kernel and selecting one?
