Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Apr 2018 09:28:41 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: update register
 size in example
Message-ID: <20180424142841.ausmjp3k5tjwyi6g@rob-hp-laptop>
References: <20180417204958.14723-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180417204958.14723-1-niklas.soderlund@ragnatech.se>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 10:49:58PM +0200, Niklas S�derlund wrote:
> From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> The datasheet have been expanded with more registers and the DT files
> have been updated with the new size. This change updates the example so
> writing new DT files can use the enchanted driver which uses the new
> registers.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../devicetree/bindings/thermal/rcar-gen3-thermal.txt       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied with Simon's comments addressed.

Rob
