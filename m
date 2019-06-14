Return-Path: <robherring2@gmail.com>
Date: Fri, 14 Jun 2019 13:55:52 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: input: touchscreen: stmpe: add XY mode
Message-ID: <20190614195552.GA5316@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
To: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Mon, 27 May 2019 18:19:33 +0200, Leif Middelschulte wrote:
> This change documents the support of another input data
> acquisition mode (XY). This mode is mostly relevant in
> the context of/combination with the tracking index.
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
