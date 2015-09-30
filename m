From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: xgene-dma: Fix overwritting DMA tx ring
Date: Wed, 30 Sep 2015 13:35:24 +0530
Message-ID: <20150930080524.GG21690@vkoul-mobl.iind.intel.com>
References: <1442390603-21129-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442390603-21129-1-git-send-email-rsahu@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rameshwar Prasad Sahu <rsahu@apm.com>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 01:33:23PM +0530, Rameshwar Prasad Sahu wrote:
> This patch fixes an over flow issue with the TX ring descriptor. Each
> descriptor is 32B in size and an operation requires 2 of these
> descriptors.

Applied, thanks

-- 
~Vinod
