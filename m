From: Scott Wood <oss@buserror.net>
Subject: Re: [2/3] powerpc/dts/fsl: t4240rdb: use the Cortina PHY driver
 compatible
Date: Wed, 8 Aug 2018 17:47:34 -0500
Message-ID: <20180808224734.GA32575@home.buserror.net>
References: <6fa5aa04d257525c5703b7c8ca833ec0ae0047c7.1531903211.git.camelia.groza@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6fa5aa04d257525c5703b7c8ca833ec0ae0047c7.1531903211.git.camelia.groza@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Camelia Groza <camelia.groza@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2018 at 02:46:50PM +0300, Camelia Groza wrote:
> The Cortina PHY requires the use of the dedicated Cortina PHY driver
> instead of the generic one.
> 
> Signed-off-by: Camelia Groza <camelia.groza@nxp.com>
> ---
>  arch/powerpc/boot/dts/fsl/t4240rdb.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied with the changelog updated to talk about hardware compatibility
("The Cortina PHY is not compatible with IEEE 802.3 clause 45") rather
than driver choice.

-Scott
