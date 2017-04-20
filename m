From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] Add R8A7743/SK-RZG1M PFC support
Date: Thu, 20 Apr 2017 17:52:24 +0900
Message-ID: <20170420085223.GG3760@verge.net.au>
References: <20170414210941.143838720@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170414210941.143838720@cogentembedded.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 15, 2017 at 12:09:41AM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20170410-v4.11-rc6' tag.  We're adding the R8A7743 PFC node and
> then describe the pins for SCIF0 and Ether devices described eralier. These
> patches depend on the R8A7743 PFC suport in order to work properly.
> 
> [1/3] ARM: dts: r8a7743: add PFC support
> [2/3] ARM: dts: sk-rzg1m: add SCIF0 pins
> [3/3] ARM: dts: sk-rzg1m: add Ether pins

These look good to me. Please repost me or ping me once the prerequisites
have been accepted. Likewise for the similar patchset for the R8A7745/SK-RZG1E.
