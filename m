From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: imx8mq: Number clocks consecutively
Date: Wed, 16 Jan 2019 21:27:42 +0800
Message-ID: <20190116132741.GC17702@dragon>
References: <20190116084122.GA19712@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116084122.GA19712@bogon.m.sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 09:41:22AM +0100, Guido Günther wrote:
> This fixes a duplicate use of 232 and numbers the clocks without holes.
> 
> Fixes: 1cf3817bf1f5 ("dt-bindings: Add binding for i.MX8MQ CCM")
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Applied, thanks.
