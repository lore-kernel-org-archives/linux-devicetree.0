From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v5 4/4] fpga pr ip: Platform driver for Altera Partial
 Reconfiguration IP.
Date: Sat, 18 Mar 2017 19:27:50 +0100
Message-ID: <20170318192750.716e9b28@crub>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com>
        <1489174827-6033-5-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489174827-6033-5-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: atull@kernel.org, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Hi Matthew,

On Fri, 10 Mar 2017 11:40:27 -0800
matthew.gerlach@linux.intel.com matthew.gerlach@linux.intel.com wrote:

...
>+#include "altera-pr-ip-core.h"

Shouldn't we put this header to include/linux? Compiling the
out-of-tree modules using alt_pr_register/alt_pr_unregister
will not work if this header is in drivers/fpga.

...
>+
>+module_platform_driver(alt_pr_platform_driver);

Please add MODULE_LICENSE("GPL v2") here. Otherwise, when built as
a module it cannot be loaded because the alt_pr register/unregister
functions are exported as GPL only. Also please add module author
and description.

Thanks,

Anatolij
