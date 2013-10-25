From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 1/1] of: add vendor prefix for ISEE 2007 S.L.
Date: Thu, 24 Oct 2013 22:19:44 -0500
Message-ID: <AD1CF90F-89BD-425F-A09E-A8599304C5EA@codeaurora.org>
References: <1382647219-6118-1-git-send-email-javier@dowhile0.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1382647219-6118-1-git-send-email-javier@dowhile0.org>
Sender: linux-doc-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Oct 24, 2013, at 3:40 PM, Javier Martinez Canillas wrote:

> This trivial patch adds ISEE 2007 S.L. to the list of
> devicetree vendor prefixes.
> 
> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
> ---
> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> 1 file changed, 1 insertion(+)

Acked-by: Kumar Gala <galak@codeaurora.org>

- k

> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2956800..becc6f9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -34,6 +34,7 @@ ibm	International Business Machines (IBM)
> idt	Integrated Device Technologies, Inc.
> img	Imagination Technologies Ltd.
> intercontrol	Inter Control Group
> +isee	ISEE 2007 S.L.
> linux	Linux-specific binding
> lsi	LSI Corp. (LSI Logic)
> marvell	Marvell Technology Group Ltd.
> -- 
> 1.8.4.rc3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

