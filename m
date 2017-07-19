From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dma: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 09:31:45 +0530
Message-ID: <20170719040144.GA3053@localhost>
References: <20170718214339.7774-18-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718214339.7774-18-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 04:42:58PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.

Applied after fixing the subsystem name, thanks

-- 
~Vinod
