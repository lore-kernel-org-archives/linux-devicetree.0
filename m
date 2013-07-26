From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] pinctrl: pinconf_generic: add utility functions for
 add map/configs
Date: Fri, 26 Jul 2013 11:36:04 -0600
Message-ID: <51F2B384.9050706@wwwdotorg.org>
References: <1374833754-19659-1-git-send-email-ldewangan@nvidia.com> <1374833754-19659-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1374833754-19659-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: grant.likely@linaro.org, linus.walleij@linaro.org, rob.herring@calxeda.com, rob@landley.net, sameo@linux.intel.com, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com, swarren@nvidia.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/26/2013 04:15 AM, Laxman Dewangan wrote:
> Some of pincontrol driver needs the utility function to create map
> list. The utility function needed for adding mux, configs etc.

Which other drivers already contain this code? Are you planning on
converting them over to use these new functions? The code looks
familiar, so I assume it's just cut/paste from Tegra with some renames,
so I didn't read it through in detail.

>  drivers/pinctrl/pinconf-generic.c       |  105 +++++++++++++++++++++++++++++++
>  include/linux/pinctrl/pinconf-generic.h |   52 +++++++++++++++

I don't think those are the correct files for this code. Presumably
there's no reason at all why a pinctrl driver that doesn't require
CONFIG_GENERIC_PINCONF can't use these basic utility functions. Perhaps
add a new pinctrl-utils file?
