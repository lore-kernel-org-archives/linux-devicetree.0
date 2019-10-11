From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] clk: sunxi-ng: h3: Export MBUS clock
Date: Fri, 11 Oct 2019 09:34:39 -0500
Message-ID: <20191011143439.GA24106@bogus>
References: <20190929161653.160158-1-jernej.skrabec@siol.net>
 <20190929161653.160158-3-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190929161653.160158-3-jernej.skrabec@siol.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, mripard@kernel.org, hverkuil@xs4all.nl, wens@csie.org, robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 29 Sep 2019 18:16:49 +0200, Jernej Skrabec wrote:
> MBUS clock will be referenced in MBUS controller node.
>
> Export it.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.h      | 4 ----
>  include/dt-bindings/clock/sun8i-h3-ccu.h | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
>

Acked-by: Rob Herring <robh@kernel.org>
