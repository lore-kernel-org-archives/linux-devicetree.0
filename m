From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 0/2] Add support for Qualcomm's PRNG
Date: Fri, 25 Oct 2013 15:57:53 +0100
Message-ID: <526A86F1.6030907@zytor.com>
References: <1381846278-9529-1-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381846278-9529-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-doc-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/15/2013 03:11 PM, Stanimir Varbanov wrote:
> This patch set adds hardware RNG driver wich is used to control the
> Qualcomm's PRNG hardware block.

I still haven't seen anyone address the "P" bit of the "PRNG"... what is
the (guaranteed) entropic level of the output?

	-hpa


