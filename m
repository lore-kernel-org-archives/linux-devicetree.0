From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: media: sun6i: Add A31 and H3 compatibles
Date: Wed, 7 Mar 2018 15:59:20 -0600
Message-ID: <20180307215920.wwfhj2yaf7qbssyx@rob-hp-laptop>
References: <20180305100432.15009-1-maxime.ripard@bootlin.com>
 <20180305100432.15009-2-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180305100432.15009-2-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mylene Josserand <mylene.josserand@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Hans Verkuil <hans.verkuil@cisco.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 05, 2018 at 11:04:29AM +0100, Maxime Ripard wrote:
> The H3 has a slightly different CSI controller (no BT656, no CCI) which
> looks a lot like the original A31 controller. Add a compatible for the A31,
> and more specific compatible the for the H3 to be used in combination for
> the A31.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/sun6i-csi.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
