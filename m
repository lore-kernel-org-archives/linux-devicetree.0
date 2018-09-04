Return-Path: <robherring2@gmail.com>
Message-ID: <5b8e8a6d.1c69fb81.cdb61.0b30@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] thermal: qoriq: add i.mx8mq support
References: <1535595286-18371-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535595286-18371-1-git-send-email-Anson.Huang@nxp.com>
Date: Mon, 3 Sep 2018 20:18:14 -0500
To: Anson Huang <Anson.Huang@nxp.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Thu, 30 Aug 2018 10:14:46 +0800, Anson Huang wrote:
> Add i.mx8mq specific compatible string.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/thermal/qoriq-thermal.txt | 6 +++---
>  drivers/thermal/qoriq_thermal.c                             | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
