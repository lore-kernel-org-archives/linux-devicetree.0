From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] regulator: fixed: dt: Allow an optional over
 current pin
Date: Mon, 14 Nov 2016 09:54:01 -0600
Message-ID: <20161114155401.djjzwbe2dtg7dhnc@rob-hp-laptop>
References: <20161104213536.28496-1-ahaslam@baylibre.com>
 <20161104213536.28496-2-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161104213536.28496-2-ahaslam@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Haslam <ahaslam@baylibre.com>
Cc: broonie@kernel.org, girdwood@gmail.com, khilman@baylibre.com, nsekhar@ti.com, david@lechnology.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 04, 2016 at 10:35:35PM +0100, Axel Haslam wrote:
> Add support for an optional over current input pin which
> can be used to send an over current event to the regulator
> consumer.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
> ---
>  Documentation/devicetree/bindings/regulator/fixed-regulator.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
