From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-binding: regulator: anatop: make regulator
 name property required
Date: Thu, 20 Apr 2017 08:50:47 -0500
Message-ID: <20170420135047.c4vjx6wpeauznsqs@rob-hp-laptop>
References: <1492180234-2496-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492180234-2496-1-git-send-email-aisheng.dong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 14, 2017 at 10:30:33PM +0800, Dong Aisheng wrote:
> We actually can't allow the missing of the regualor name, thus update
> the binding doc to make regulator-name property to be required.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  Documentation/devicetree/bindings/regulator/anatop-regulator.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
