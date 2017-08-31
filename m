From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] mfd: max77693: Add muic of_compatible in mfd_cell
Date: Thu, 31 Aug 2017 10:27:53 -0500
Message-ID: <20170831152753.5wghbtlp6qzqef7t@rob-hp-laptop>
References: <CGME20170823063057eucas1p18045ff589bef62e656594d0bcf6ec5b3@eucas1p1.samsung.com>
 <1503469812-3668-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503469812-3668-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, cw00.choi@samsung.com, krzk@kernel.org, lee.jones@linaro.org, b.zolnierkie@samsung.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 23, 2017 at 08:30:12AM +0200, Maciej Purski wrote:
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

Acked-by: Rob Herring <robh@kernel.org>
