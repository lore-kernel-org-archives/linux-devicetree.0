From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm: Clean up CPU binding examples
Date: Wed, 22 May 2019 08:57:16 -0500
Message-ID: <20190522135716.GA4030@bogus>
References: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
 <fe070f591d5e07042062b6b07a701feab324ee2c.1558456785.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <fe070f591d5e07042062b6b07a701feab324ee2c.1558456785.git.robin.murphy@arm.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 May 2019 17:44:27 +0100, Robin Murphy wrote:
> Following commit 31af04cd60d3 ("arm64: dts: Remove inconsistent use of
> 'arm,armv8' compatible string"), clean up these binding examples in case
> anyone is tempted to copy them.
> 
> CC: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/arm-boards     |  4 ++--
>  .../devicetree/bindings/arm/cpu-capacity.txt         | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 

Applied, thanks.

Rob
