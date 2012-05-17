From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH RESEND] Documentation: devicetree: Fix value format description
Date: Wed, 16 May 2012 20:09:17 -0500
Message-ID: <4FB44FBD.1000408@landley.net>
References: <1337200436-26528-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1337200436-26528-1-git-send-email-stigge@antcom.de>
Sender: linux-doc-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, rdunlap@xenotime.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/16/2012 03:33 PM, Roland Stigge wrote:
> Numeric values in dts files can be specified in decimal and hex (the latter
> prefixed 0x). The current documentation is updated with this patch to prevent
> confusion about what is meant with values without "0x" (previously hex, now
> dec).
> 
> Signed-off-by: Roland Stigge <stigge@antcom.de>
> Acked-by: Rob Landley <rob@landley.net>

This should go in through the device tree tree. (There's policy
involved, not just documenting the status quo.)

Rob
-- 
GNU/Linux isn't: Linux=GPLv2, GNU=GPLv3+, they can't share code.
Either it's "mere aggregation", or a license violation.  Pick one.
