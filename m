From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 2/2 v4] sata highbank: add bit-banged SGPIO driver support
Date: Thu, 6 Jun 2013 14:06:20 -0700
Message-ID: <20130606210620.GE5045@htj.dyndns.org>
References: <1369945051-2582-2-git-send-email-mark.langsdorf@calxeda.com>
 <1370523161-32449-1-git-send-email-mark.langsdorf@calxeda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-ide-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370523161-32449-1-git-send-email-mark.langsdorf@calxeda.com>
Sender: linux-ide-owner@vger.kernel.org
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2013 at 07:52:41AM -0500, Mark Langsdorf wrote:
> Highbank supports SGPIO by bit-banging out the SGPIO signals over
> three GPIO pins defined in the DTB. Add support for this SGPIO
> functionality.
> 
> Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>

Applied to libata/for-3.11.  Thanks!

-- 
tejun
