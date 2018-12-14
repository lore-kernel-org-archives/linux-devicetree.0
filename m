From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: Use of_node_name_eq for node name comparisons
Date: Fri, 14 Dec 2018 12:19:48 +0000
Message-ID: <20181214121948.GS4497@dell>
References: <20181205195050.4759-15-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181205195050.4759-15-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 05 Dec 2018, Rob Herring wrote:

> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/mfd/max77620.c |  2 +-
>  drivers/mfd/stmpe.c    | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
