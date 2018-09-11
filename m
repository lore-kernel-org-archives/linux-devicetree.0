From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 6/8] regulator/mfd: bd718xx: rename bd71837/bd71847
 common instances
Date: Tue, 11 Sep 2018 14:51:21 +0100
Message-ID: <20180911135121.GR4185@dell>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <1f979c0abdea658dbd4b3760fd7c50d1c6bc6da1.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f979c0abdea658dbd4b3760fd7c50d1c6bc6da1.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Wed, 29 Aug 2018, Matti Vaittinen wrote:

> Rename parts of code that support both BD71837 and BD71847 to BD718XX.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/rohm-bd718x7.c            | 112 +++++++++++++++++-----------------
>  drivers/regulator/bd71837-regulator.c |  24 ++++----
>  include/linux/mfd/rohm-bd718x7.h      |  62 +++++++++----------
>  3 files changed, 99 insertions(+), 99 deletions(-)

The premise of XXing things out seems fine.

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
