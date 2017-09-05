From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4] mfd: max77693: Add muic of_compatible in mfd_cell
Date: Tue, 5 Sep 2017 08:27:42 +0100
Message-ID: <20170905072742.7zownkamnasp7vv5@dell>
References: <CGME20170823063057eucas1p18045ff589bef62e656594d0bcf6ec5b3@eucas1p1.samsung.com>
 <1503469812-3668-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503469812-3668-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, cw00.choi@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com
List-Id: devicetree@vger.kernel.org

On Wed, 23 Aug 2017, Maciej Purski wrote:

> This patch adds muic of_compatible in order to use the muic device
> driver in device tree.
> 
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
> v2:
> - added muic to documentation
> v3:
> - removed duplication
> v4:
> - fixed commit message
> 
>  Documentation/devicetree/bindings/mfd/max77693.txt | 6 ++++++
>  drivers/mfd/max77693.c                             | 5 ++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Please collect the Acks you have and submit a [RESEND].

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
