Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1037DC33CB8
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 14:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D88FB20678
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 14:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgATOTz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 09:19:55 -0500
Received: from mga18.intel.com ([134.134.136.126]:25347 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728826AbgATOTy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Jan 2020 09:19:54 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 06:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
   d="scan'208";a="219662143"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 20 Jan 2020 06:19:50 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1itXuB-0002Zq-8K; Mon, 20 Jan 2020 16:19:51 +0200
Date:   Mon, 20 Jan 2020 16:19:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        lijiazi <lijiazi@xiaomi.com>
Subject: Re: [PATCH v3 3/3] lib/vsprintf: add two device node flags
Message-ID: <20200120141951.GO32742@smile.fi.intel.com>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
 <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
 <49e5a1c51283b3ea829dc7a04028121764cf5961.1579423564.git.lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49e5a1c51283b3ea829dc7a04028121764cf5961.1579423564.git.lijiazi@xiaomi.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 20, 2020 at 07:38:29PM +0800, lijiazi wrote:
> Add two device node flags, and use OF_DEVICE_NODE_FLAG_MAX instead
> of sizeof("xxxx").

...

>  			tbuf[1] = of_node_check_flag(dn, OF_DETACHED) ? 'd' : '-';
>  			tbuf[2] = of_node_check_flag(dn, OF_POPULATED) ? 'P' : '-';
>  			tbuf[3] = of_node_check_flag(dn, OF_POPULATED_BUS) ? 'B' : '-';

> -			tbuf[4] = 0;

This is fine to leave untouched. See below.

> +			tbuf[4] = of_node_check_flag(dn, OF_OVERLAY) ? 'O' : '-';
> +			tbuf[5] = of_node_check_flag(dn, OF_OVERLAY_FREE_CSET) ? 'F' : '-';

These two should be part of patch 1, which in turn should be last in the series.

> +			tbuf[OF_DEVICE_NODE_FLAG_MAX] = 0;

This one also, but in a form of explicit number, if you afraid of problems
here, we may add something like

	BUILD_BUG_ON(OF_DEVICE_NODE_FLAG_MAX < ...);

where ... depends on amount of flags we print here.

-- 
With Best Regards,
Andy Shevchenko


