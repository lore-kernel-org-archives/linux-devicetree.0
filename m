From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mfd: syscon: Make it possible to mark syscon as read only
Date: Fri, 20 Jun 2014 14:17:58 +0200
Message-ID: <8049148.CC5WjPCMxf@wuerfel>
References: <1403210626-4845-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1403210626-4845-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 19 June 2014 13:43:46 Bjorn Andersson wrote:
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
> index fe8150b..163325af0 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
> @@ -13,6 +13,9 @@ Required properties:
>  - compatible: Should contain "syscon".
>  - reg: the register region can be accessed from syscon
>  
> +Optional properties:
> +- read-only: the register region is read only
> +

We've been discussing devices that are simultaneously a
syscon and a more specific device. I'd suggest naming the
new property "syscon,read-only" here, so it becomes clearer
that this is a generic syscon property in that case.

	Arnd
