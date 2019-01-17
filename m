Return-Path: <dinguyen@kernel.org>
Subject: Re: [PATCH 1/4] EDAC, altera: Fix S10 persistent register offset
References: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
 <1547680314-31045-2-git-send-email-thor.thayer@linux.intel.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <f9365fd8-284c-eab8-b22e-df803d4189a5@kernel.org>
Date: Thu, 17 Jan 2019 08:52:20 -0600
MIME-Version: 1.0
In-Reply-To: <1547680314-31045-2-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 1/16/19 5:11 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Correct the persistent register offset where address
> and status are stored.
> 
> Fixes: 08f08bfb7b4c ("EDAC, altera: Merge Stratix10 into the Arria10 SDRAM
> 		      probe routine")

The "Fixes" line should be all on one line. I recently got dinged for this.

>From Documentation/process/submitting-patches.rst"

"If your patch fixes a bug in a specific commit, e.g. you found an issue
using
``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
the SHA-1 ID, and the one line summary.  For example::

Fixes: e21d2170f366 ("video: remove unnecessary platform_set_drvdata()")"

Dinh
