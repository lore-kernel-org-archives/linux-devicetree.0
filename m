Return-Path: <robherring2@gmail.com>
Date: Mon, 22 Jul 2019 12:18:54 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: cdce925: Add regulator
 documentation
Message-ID: <20190722181854.GA24510@bogus>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
 <1561691950-42154-2-git-send-email-preid@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561691950-42154-2-git-send-email-preid@electromag.com.au>
To: Phil Reid <preid@electromag.com.au>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 28 Jun 2019 11:19:09 +0800, Phil Reid wrote:
> The cdce925 has two separate supply pins. Document the bindings
> for them.
> 
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>  Documentation/devicetree/bindings/clock/ti,cdce925.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
