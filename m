Return-Path: <robherring2@gmail.com>
Date: Sun, 1 Sep 2019 14:18:36 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add docs for EL15203000
Message-ID: <20190901191836.GA21686@bogus>
References: <20190830224619.15728-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830224619.15728-1-oleg@kaa.org.ua>
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, 31 Aug 2019 01:46:18 +0300, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
