From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0: Clean up CPU
 compatibles
Date: Wed, 22 May 2019 14:03:18 +0200
Message-ID: <20190522120318.mwcp7a6wr3lq6kcm@verge.net.au>
References: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2019 at 05:44:26PM +0100, Robin Murphy wrote:
> Apparently this DTS crossed over with commit 31af04cd60d3 ("arm64: dts:
> Remove inconsistent use of 'arm,armv8' compatible string") and missed
> out on the cleanup, so put it right.
> 
> CC: Simon Horman <horms@verge.net.au>
> CC: Magnus Damm <magnus.damm@gmail.com>
> CC: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks Robin,

applied for inclusion in v5.3.
