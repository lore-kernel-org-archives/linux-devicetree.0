From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH 1/3] dt/bindings: arm-pl330: add description of
 arm,pl330-periph-burst
Date: Fri, 5 Aug 2016 15:25:47 +0800
Message-ID: <ea3572fa-4bff-87db-d5ad-f406809f8296@rock-chips.com>
References: <1470365602-32586-1-git-send-email-shawn.lin@rock-chips.com>
 <1470365602-32586-2-git-send-email-shawn.lin@rock-chips.com>
 <20160805033410.GJ9681@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160805033410.GJ9681@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: shawn.lin@rock-chips.com, Rob Herring <robh+dt@kernel.org>, Huibin Hong <huibin.hong@rock-chips.com>, Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org, dianders@chromium.org, briannorris@chromium.org, Caesar Wang <wxt@rock-chips.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Vinod,

在 2016/8/5 11:34, Vinod Koul 写道:
> On Fri, Aug 05, 2016 at 10:53:20AM +0800, Shawn Lin wrote:
>> This patch adds the "arm,pl330-periph-burst" for arm-pl330 to
>> support busrt mode.
>
> why should this be DT property. Only reason I can think of if some hw
> versions support this and some won't.

yes, if we want to support burst mode, both of the master(pl330) and
client(several peripherals) should implement it, otherwise it will
be broken when enabling.

So I mentioned it on my cover letter as the reason to introduce this
optional property. If people add this property and find it's ok for
their platform, they could land new dt-patch to add it. But we could
*not* presume that we could get all users involved in testing this
patchet. I don't wanna to break any other platforms, so it's needed.


Thanks.

>
> If all are supporting, please enable it everywhere for obvious reasons.
>


-- 
Best Regards
Shawn Lin
