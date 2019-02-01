From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] dt-bindings: mfd: rn5t618: Document optional property
 system-power-controller
Date: Fri, 1 Feb 2019 09:24:11 +0000
Message-ID: <20190201092411.GG783@dell>
References: <20190129135917.29521-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129135917.29521-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Jan 2019, Jonathan Neuschäfer wrote:

> The RN5T618 family of PMICs can be used as system management
> controllers, in which case they handle poweroff and restart. Document
> this capability by referring to the corresponding generic DT binding.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/mfd/rn5t618.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
