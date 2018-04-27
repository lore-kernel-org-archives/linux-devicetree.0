Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 16:11:36 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: net: gmii2rgmii: Fix typos
Message-ID: <20180427211136.fbg4b4iignpfrhtg@rob-hp-laptop>
References: <20180422040132.1389-1-brandon.maier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180422040132.1389-1-brandon.maier@gmail.com>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Apr 21, 2018 at 11:01:31PM -0500, Brandon Maier wrote:
> The wording of 'provides the RGMII' is unclear, and should be 'is a
> converter' to be consistent with the rest of this Doc. Also fix up
> assorted spelling and capitalization typos.
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
