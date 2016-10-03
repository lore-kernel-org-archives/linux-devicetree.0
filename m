From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V4 05/10] dmaengine: qcom_hidma: make pending_tre_count
 atomic
Date: Mon, 3 Oct 2016 09:09:24 +0530
Message-ID: <20161003033923.GQ2467@localhost>
References: <1475115167-5898-1-git-send-email-okaya@codeaurora.org>
 <1475115167-5898-6-git-send-email-okaya@codeaurora.org>
 <20161001061906.GG2467@localhost>
 <e5782331-0dc6-9e0e-777c-372dc88f38e3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e5782331-0dc6-9e0e-777c-372dc88f38e3@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 01, 2016 at 11:19:43AM -0400, Sinan Kaya wrote:
> On 10/1/2016 2:19 AM, Vinod Koul wrote:
> >> Making it atomic so that it can be updated from multiple contexts.
> > How is it multiple contexts? It's either existing context of MSI, not both!
> > 
> 
> I was trying to mean multiple processor contexts here. The driver allocates 11
> MSI interrupts. Each MSI interrupt can be assigned to a different CPU. Then, 
> we have a race condition for common variables as they share the same interrupt
> handler with a different cause bit. 
> 
> I will put the above description into the commit text.

Sounds better :)

-- 
~Vinod
