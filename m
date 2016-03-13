From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V14 5/9] dma: qcom_hidma: implement lower level hardware
 interface
Date: Sun, 13 Mar 2016 21:30:34 +0530
Message-ID: <20160313160034.GE13211@localhost>
References: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
 <1454646882-24369-6-git-send-email-okaya@codeaurora.org>
 <20160311020650.GG11154@localhost>
 <56E2EC1C.6040107@codeaurora.org>
 <20160311163221.GC13211@localhost>
 <56E2F5EA.10207@codeaurora.org>
 <56E31CA5.6040106@codeaurora.org>
 <56E33FBB.2000401@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56E33FBB.2000401@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 04:59:23PM -0500, Sinan Kaya wrote:
> Vinod,
> 
> On 3/11/2016 2:29 PM, Sinan Kaya wrote:
> > I have done the renaming. This is all left for me to post a follow up.
> 
> I just posted v15 (forgot to put v15 on 4/4).

Don't do that manually!

git formt-patch --subject-prefix is for that

> 
> http://www.spinics.net/lists/arm-kernel/msg490282.html
> 
> I wanted to get v15 out before the end of the week with the macro renames. 
> Let me know which lines need corrections.
> 
> There is also a single line change for the object hierarchy patch. The code 
> was looking up DMA attributes (OF:dma-coherent) from the wrong place.

-- 
~Vinod
