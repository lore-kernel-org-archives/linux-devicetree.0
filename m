From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2 3/3] dt-bindings: reset: oxnas: Update for OX820
Date: Mon, 10 Oct 2016 07:59:46 -0500
Message-ID: <20161010125946.GA31343@rob-hp-laptop>
References: <20161005152710.2898-1-narmstrong@baylibre.com>
 <20161005152710.2898-4-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161005152710.2898-4-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 05, 2016 at 05:27:10PM +0200, Neil Armstrong wrote:
> Add new compatible string for reset and sys-ctrl for the Oxford
> Semiconductor OX820 Support.
> Drop the OX810SE indices since they moved in a dedicated include file.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/reset/oxnas,reset.txt      | 44 +++++-----------------
>  1 file changed, 9 insertions(+), 35 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
