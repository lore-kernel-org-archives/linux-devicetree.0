From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] regulator: bindings: Add properties for coupled
 regulators
Date: Thu, 7 Dec 2017 17:30:32 -0600
Message-ID: <20171207233032.7fki5vr5is4vzrmo@rob-hp-laptop>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
 <CGME20171207094752eucas1p2ca38d1197d8057cb92b33a81a9942915@eucas1p2.samsung.com>
 <1512639975-22241-3-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512639975-22241-3-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 10:46:13AM +0100, Maciej Purski wrote:
> Some regulators require keeping their voltage spread below defined
> max_spread.
> 
> Add properties to provide information on regulators' coupling.
> 
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
