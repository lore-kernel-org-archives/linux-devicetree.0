From: Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] devicetree: add Sigma Designs vendor prefix
Date: Mon, 2 Nov 2015 10:42:33 +0100
Message-ID: <56373009.3050306@free.fr>
References: <1443806507-12061-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443806507-12061-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mans Rullgard <mans@mansr.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 02/10/2015 19:21, Mans Rullgard wrote:

> Add the "sigma" vendor prefix for Sigma Designs, Inc.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 82d2ac9..ea77ee5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -192,6 +192,7 @@ schindler	Schindler
>  seagate	Seagate Technology PLC
>  semtech	Semtech Corporation
>  sharp	Sharp Corporation
> +sigma	Sigma Designs, Inc.
>  sil	Silicon Image
>  silabs	Silicon Laboratories
>  siliconmitus	Silicon Mitus, Inc.

Hello,

How can I determine whether this patch has been applied?

(I examined a few branches in Rob's tree.)

Regards.
