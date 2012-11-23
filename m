From: Qing Xu <qingx@marvell.com>
Subject: Re: [PATCH 2/7] mfd: max8925: fix mfd device register failure
Date: Fri, 23 Nov 2012 15:14:21 +0800
Message-ID: <50AF224D.4070209@marvell.com>
References: <1352187498-9754-1-git-send-email-qingx@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352187498-9754-1-git-send-email-qingx@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qing Xu <qingx@marvell.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Chao Xie <cxie4@marvell.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 11/06/2012 03:38 PM, Qing Xu wrote:
> From: Qing Xu <qingx@marvell.com>
>
> we encounter rtc/power/touch driver registry failure, root cause
> it is resources confilict in insert_resouce, solved by changing
> mfd_add_devices 5th parameter to NULL
>
> Signed-off-by: Qing Xu <qingx@marvell.com>
> ---
>   drivers/mfd/max8925-core.c |   22 ++++++++++------------
>   1 files changed, 10 insertions(+), 12 deletions(-)
Hi Haojian, Sameo,

Could you help to review my patches? Can it be merged?

Thanks a lot!
-Qing
