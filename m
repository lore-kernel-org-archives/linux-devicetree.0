Return-Path: <robherring2@gmail.com>
Date: Wed, 30 May 2018 22:37:36 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dts: clk: add devicetree bindings for MAX9485
Message-ID: <20180531033736.GA29286@rob-hp-laptop>
References: <20180525182058.25969-1-daniel@zonque.org>
 <20180525182058.25969-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525182058.25969-2-daniel@zonque.org>
To: Daniel Mack <daniel@zonque.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, May 25, 2018 at 08:20:57PM +0200, Daniel Mack wrote:
> This patch adds the devicetree bindings for MAX9485, a programmable audio
> clock generator.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/clock/maxim,max9485.txt    | 59 ++++++++++++++++++++++
>  include/dt-bindings/clock/maxim,max9485.h          | 18 +++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
>  create mode 100644 include/dt-bindings/clock/maxim,max9485.h

Reviewed-by: Rob Herring <robh@kernel.org>
