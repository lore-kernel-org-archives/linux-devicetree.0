From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH][v2] arm64: dts: remove big-endian filed from IFC
 controller
Date: Mon, 3 Sep 2018 09:01:59 +0800
Message-ID: <20180903010157.GX3850@dragon>
References: <20180829032749.9309-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180829032749.9309-1-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, leoyang.li@nxp.com, linux-arm-kernel@lists.infradead.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2018 at 08:57:49AM +0530, Prabhakar Kushwaha wrote:
> As per IFC binding, Absence of "little-endian" field causes registers
> access in big-endian mode.
> So no need to set explicit big-endian field IFC node for LS1043A and
> LS1046A.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>

s/filed/flied in subject, and having 'fsl' in subject prefix might be
better, so that it's clear this is a fsl specific changes.

I fixed them up and applied the patch.

Shawn
