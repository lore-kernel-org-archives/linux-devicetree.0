From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3.1 1/4] dt-bindings: clock: amlogic,gxbb-aoclkc: Update
 bindings
Date: Wed, 9 Aug 2017 19:15:20 -0500
Message-ID: <20170810001520.bpu2jyfdvx2isu4w@rob-hp-laptop>
References: <1501588619-10991-1-git-send-email-narmstrong@baylibre.com>
 <1501588619-10991-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501588619-10991-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 01, 2017 at 01:56:56PM +0200, Neil Armstrong wrote:
> On the first revision of the bindings, only the gates + resets were known
> in the AO Clock HW, but more registers used to configures AO clock are known
> to be spread among the AO register space.
> This patch adds a parent node for the entire system control zone for the AO
> domain then moves the clock controller as a subnode of the system control
> node.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/clock/amlogic,gxbb-aoclkc.txt         | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
