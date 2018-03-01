From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 09/42] dt-bindings: clock: New bindings for TI Davinci
 PSC
Date: Thu, 1 Mar 2018 15:13:13 -0600
Message-ID: <20180301211313.tahm4kjpma6jsywz@rob-hp-laptop>
References: <1519071723-31790-1-git-send-email-david@lechnology.com>
 <1519071723-31790-10-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1519071723-31790-10-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 19, 2018 at 02:21:30PM -0600, David Lechner wrote:
> This adds a new binding for the Power Sleep Controller (PSC) for the
> mach-davinci family of processors.
> 
> Note: Although TI Keystone has a very similar PSC, we are not using the
> existing bindings. Keystone is using a legacy one-node-per-clock binding
> (actually two nodes if you count the separate reset binding for the same
> IP block). Also, some davinci LPSCs have quirks that aren't handled by
> the keystone bindings, so we would be adding one compatible string per
> clock with quirks instead of just a new compatible string for each
> controller.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v7 changes:
> - Fixed clock-names property typo
> - Added #power-domain-cells property
> 
> v6 changes:
> - added clocks and clock-names properties
> - expanded examples
> 
> 
>  .../devicetree/bindings/clock/ti/davinci/psc.txt   | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/davinci/psc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
