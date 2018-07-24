Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Jul 2018 17:23:18 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 1/2] dt-bindings: mux: add adi,adgs1408
Message-ID: <20180724232318.GA20421@rob-hp-laptop>
References: <20180720150355.2871-1-mircea.caprioru@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180720150355.2871-1-mircea.caprioru@analog.com>
To: Mircea Caprioru <mircea.caprioru@analog.com>
Cc: peda@axentia.se, davem@davemloft.net, mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 20, 2018 at 06:03:55PM +0300, Mircea Caprioru wrote:
> Adding documentation for adgs1408/1409 multiplexer. The bindings
> follow the standard SPI and mux bindings and do not require any
> additional custom properties.
> 
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> ---
> Changelog V4 -> V5
> - no modifications here
> 
>  .../devicetree/bindings/mux/adi,adgs1408.txt  | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mux/adi,adgs1408.txt

Reviewed-by: Rob Herring <robh@kernel.org>
