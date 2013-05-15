From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] usb: omap2430: fix memleak in err case
Date: Wed, 15 May 2013 15:55:48 +0400
Message-ID: <519377C4.1040800@cogentembedded.com>
References: <5192E650.3070303@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5192E650.3070303@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Libo Chen <clbchenlibo.chen@huawei.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 15-05-2013 5:35, Libo Chen wrote:

> when omap_get_control_dev fail, we should release relational platform_device

    s/fail/fails/, s/relational/related/?

> Signed-off-by: Libo Chen <libo.chen@huawei.com>

    You've posted this to the wrong mailing list, linux-mips; 
devicetree-discuss also seems hardly related.

WBR, Sergei
