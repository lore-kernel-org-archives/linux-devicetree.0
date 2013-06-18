From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] Make non-linear GPIO ranges accesible from gpiolib
Date: Tue, 18 Jun 2013 10:09:47 +0200
Message-ID: <CACRpkdYZ6QXsh_7fG=B_Ci5hqm2LQe=Hbf5dyZK+tjdnVaHF4A@mail.gmail.com>
References: <20130617160324.GA15853@ab42.lan>
	<1371485086-16016-1-git-send-email-christian.ruppert@abilis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1371485086-16016-1-git-send-email-christian.ruppert@abilis.com>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2013 at 6:04 PM, Christian Ruppert
<christian.ruppert@abilis.com> wrote:

> This patch adds the infrastructure required to register non-linear gpio
> ranges through gpiolib and the standard GPIO device tree bindings.
>
> Signed-off-by: Christian Ruppert <christian.ruppert@abilis.com>

>  Documentation/devicetree/bindings/gpio/gpio.txt |   44 ++++++++++++++++++
>  arch/arc/boot/dts/abilis_tb100.dtsi             |   56 +++++++++++-----------
>  arch/arc/boot/dts/abilis_tb101.dtsi             |   56 +++++++++++-----------
>  arch/arc/boot/dts/abilis_tb10x.dtsi             |    3 +-
>  drivers/gpio/gpiolib-of.c                       |   31 +++++++++---
>  drivers/gpio/gpiolib.c                          |   47 +++++++++++++++++++
>  drivers/pinctrl/core.c                          |   23 +++++++++
>  include/asm-generic/gpio.h                      |   10 ++++
>  include/linux/gpio.h                            |    9 ++++
>  include/linux/pinctrl/pinctrl.h                 |    3 +
>  10 files changed, 216 insertions(+), 66 deletions(-)

Can you please split this patch in two?

One altering drivers/* include/* and the Documentation/*

And a separate patch to alter all the abilis trees?

I do not maintain bisectability across device trees
to the rest of the kernel, as these trees are supposed
to be moved out of the kernel at some point.

Yours,
Linus Walleij
