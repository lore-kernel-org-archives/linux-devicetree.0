From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Tue, 2 Jan 2018 09:38:46 -0600
Message-ID: <20180102153846.luphqiy7zn5nl4x6@rob-hp-laptop>
References: <1514385475-23921-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1514385475-23921-2-git-send-email-aleksandar.markovic@rt-rk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1514385475-23921-2-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Miodrag Dinic <miodrag.dinic@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 27, 2017 at 03:37:51PM +0100, Aleksandar Markovic wrote:
> From: Paul Burton <paul.burton@mips.com>
> 
> Document a binding for the MIPS Cluster Power Controller (CPC) that
> allows the device tree to specify where the CPC registers are located.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> ---
>  Documentation/devicetree/bindings/power/mti,mips-cpc.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
