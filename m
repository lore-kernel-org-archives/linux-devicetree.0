From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/2] Add R8A77970/Eagle I2C support
Date: Mon, 5 Mar 2018 10:10:12 +0100
Message-ID: <20180305091009.fj4f6riash7ibklw@verge.net.au>
References: <23c5b1f4-d92b-455f-7288-5aabd002183a@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <23c5b1f4-d92b-455f-7288-5aabd002183a@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 03, 2018 at 10:02:41PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180301-v4.16-rc3' tag. We're adding the R8A77970 I2C nodes
> and then describing the PCA9654 I/O expander connected to the I2C0 bus.
> 
> [1/2] arm64: dts: renesas: r8a77970: add I2C support
> [2/2] arm64: dts: renesas: eagle: add I2C0 support

Thanks, applied.
