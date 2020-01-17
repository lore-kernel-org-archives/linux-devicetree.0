Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2571FC33CB6
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 13:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0735A2083E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 13:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgAQNa3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 08:30:29 -0500
Received: from mga04.intel.com ([192.55.52.120]:61396 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726861AbgAQNa3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Jan 2020 08:30:29 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 05:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; 
   d="scan'208";a="220727648"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jan 2020 05:30:26 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1isRhi-0004CW-Rj; Fri, 17 Jan 2020 15:30:26 +0200
Date:   Fri, 17 Jan 2020 15:30:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        lijiazi <lijiazi@xiaomi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] lib/vsprintf: introduce OF_DEVICE_NODE_FLAG_MAX for
 %pOF
Message-ID: <20200117133026.GS32742@smile.fi.intel.com>
References: <1579259719-16904-1-git-send-email-lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579259719-16904-1-git-send-email-lijiazi@xiaomi.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 17, 2020 at 07:15:19PM +0800, lijiazi wrote:
> Introduce OF_DEVICE_NODE_FLAG_MAX for device node printk, if add
> new device node flag, please add the corresponding flag abbreviation
> to tbuf in device_node_string.

Thank you for an update!
My comments below.

...

> +                                                        O - Overlay
> +                                                        F - Overlay free cset

Perhaps this would be a separate patch.

> +/* Add flag max for %pOF related printk, if add new flag, please
> + * increase following marco, and add abbreviations to tbuf in
> + * device_node_string function.
> + */

I'm not sure it's correct style for multi-line comments.

> +#define OF_DEVICE_NODE_FLAG_MAX 6 /* maximum available flags */

Altogether I think this would be done as a separate patch (with corresponding
Suggested-by tag).

> -	char tbuf[sizeof("xxxx") + 1];
> +	char tbuf[OF_DEVICE_NODE_FLAG_MAX + 1] = { "DdPBOF" };

This trick is interesting. Had you checked what code is being produced
out of it (additional memcpy()? or constants assignment on the stack?) ?

> -			tbuf[0] = of_node_check_flag(dn, OF_DYNAMIC) ? 'D' : '-';
> -			tbuf[1] = of_node_check_flag(dn, OF_DETACHED) ? 'd' : '-';
> -			tbuf[2] = of_node_check_flag(dn, OF_POPULATED) ? 'P' : '-';
> -			tbuf[3] = of_node_check_flag(dn, OF_POPULATED_BUS) ? 'B' : '-';
> -			tbuf[4] = 0;

> +			for (i = 0; i < OF_DEVICE_NODE_FLAG_MAX; i++) {
> +				if (!of_node_check_flag(dn, OF_DYNAMIC + i))
> +					tbuf[i] = '-';
> +			}

For my personal opinion the former is clearer than the latter since we have no
exported iterator over the OF device node flags. What if we decide not to use
one in the middle?

> +			tbuf[OF_DEVICE_NODE_FLAG_MAX] = 0;

This line completely depends on how we assign the initial array (see above).

-- 
With Best Regards,
Andy Shevchenko


