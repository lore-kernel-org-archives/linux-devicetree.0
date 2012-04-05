From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] fixup! Input: of_keymap: Introduce
 matrix_keypad_of_build_keymap()
Date: Wed, 4 Apr 2012 17:45:00 -0700
Message-ID: <20120405004500.GA11757@core.coreip.homeip.net>
References: <406fb8092d6aca97a54add346a2528daefab9c8d.1333009670.git.viresh.kumar@st.com>
 <3d33526ed060e70cdd981f990e449d46a4566278.1333339090.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3d33526ed060e70cdd981f990e449d46a4566278.1333339090.git.viresh.kumar@st.com>
Sender: linux-input-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: swarren@nvidia.com, spear-devel@list.st.com, viresh.linux@gmail.com, devicetree-discuss@lists.ozlabs.org, olof@lixom.net, linux-input@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Mon, Apr 02, 2012 at 09:31:51AM +0530, Viresh Kumar wrote:
> Hi Dmitry,
> 
> This is an incremental patch over patch
> "Input: of_keymap: Introduce matrix_keypad_of_build_keymap()"
> 
> sent earlier by me. Please squash it to that patch while applying.
> 
> This contains last few changes suggested by Stephen on V4 of this patch.
> ---
>  drivers/input/keyboard/tegra-kbc.c  |    4 ++--
>  include/linux/input/matrix_keypad.h |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
> index d1cc006..6300cc7 100644
> --- a/drivers/input/keyboard/tegra-kbc.c
> +++ b/drivers/input/keyboard/tegra-kbc.c
> @@ -619,8 +619,8 @@ tegra_kbc_check_pin_cfg(const struct tegra_kbc_platform_data *pdata,
>  }
>  
>  #ifdef CONFIG_OF
> -static struct tegra_kbc_platform_data * __devinit
> -tegra_kbc_dt_parse_pdata(struct device_node *np)
> +static inline struct tegra_kbc_platform_data * tegra_kbc_dt_parse_pdata(
> +		struct device_node *np)
>  {

This is the full implementation and should stay __devinit. It's the stub
for !CONFIG_OF case that you want to mark "static inline". I'll fix it
up.

Thanks.

-- 
Dmitry
