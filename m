From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2] dmaengine: xgene-dma: Fix the lock to allow client
 for further submission of requests
Date: Fri, 21 Aug 2015 15:49:27 +0530
Message-ID: <20150821101927.GQ13546@localhost>
References: <1440147814-22016-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440147814-22016-1-git-send-email-rsahu@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rameshwar Prasad Sahu <rsahu@apm.com>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 21, 2015 at 02:33:34PM +0530, Rameshwar Prasad Sahu wrote:
> This patch provides the fix in the cleanup routing such that client can perform
> further submission by releasing the lock before calling client's callback function.

Applied, thanks

-- 
~Vinod
