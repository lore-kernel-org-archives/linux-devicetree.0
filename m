From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/18] ARM64: dts: meson-gxbb: Reorder nodes
Date: Mon, 23 Jan 2017 10:52:08 -0600
Message-ID: <20170123165208.4ujwm6rjz2b3dom5@rob-hp-laptop>
References: <20170120222118.21476-1-afaerber@suse.de>
 <20170120222118.21476-11-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170120222118.21476-11-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 11:21:10PM +0100, Andreas Färber wrote:
> Sort nodes referenced by label alphabetically.

Seems to be pointless churn.

> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 76 ++++++++++++++---------------
>  1 file changed, 38 insertions(+), 38 deletions(-)
