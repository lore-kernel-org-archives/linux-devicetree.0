From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [v5 03/12] soc/fsl/qbman: Use shared-dma-pool for QMan private
 memory allocations
Date: Thu, 21 Sep 2017 15:30:30 +0100
Message-ID: <20170921143030.d6qafcrn4sy5bpap@localhost>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
 <1505767187-4596-4-git-send-email-roy.pledge@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505767187-4596-4-git-send-email-roy.pledge@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roy Pledge <roy.pledge@nxp.com>
Cc: leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, arnd@arndb.de, madalin.bucur@nxp.com, linux@armlinux.org.uk, oss@buserror.net
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 04:39:38PM -0400, Roy Pledge wrote:
> Use the shared-memory-pool mechanism for frame queue descriptor and
> packed frame descriptor record area allocations.
> 
> Signed-off-by: Roy Pledge <roy.pledge@nxp.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
