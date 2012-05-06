From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH RESEND] Documentation: devicetree: Fix value format description
Date: Sun, 06 May 2012 10:02:06 +0200
Message-ID: <4FA62FFE.6090301@antcom.de>
References: <1336217886-27224-1-git-send-email-stigge@antcom.de> <4FA57504.2070308@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FA57504.2070308@landley.net>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, rdunlap@xenotime.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05/05/12 20:44, Rob Landley wrote:
> On 05/05/2012 06:38 AM, Roland Stigge wrote:
>> Numeric values in dts files can be specified in decimal and hex (the latter
>> prefixed 0x). The current documentation is updated with this patch to prevent
>> confusion about what is meant with values without "0x" (previously hex, now
>> dec).
> 
> This updates the documentation to consistently say 0x in front of hex
> values, but doesn't change the device tree _parser_. What did the parser
> previously do with this input?

I can add the following para to the patch description if you ack:

===========================================================================
Background:

Since 2011's update to scripts/dtc/dtc-lexer.l, we only support the
/dts-v1/ format which mandates "0x" for hex values. Practically,
literals (<V1>[0-9]+|0[xX][0-9a-fA-F]+ -> DT_LITERAL) are handled via
strtoull() with base==0 ("auto"), while we previously also had a
DT_LEGACYLITERAL (<INITIAL>[0-9a-fA-F]+), forcing base==16. Not anymore.
===========================================================================

Thanks in advance,

Roland
