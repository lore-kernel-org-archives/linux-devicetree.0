From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: i3c: Make 'assigned-address' valid
 if static address == 0
Date: Tue, 3 Sep 2019 18:40:24 +0100
Message-ID: <20190903174024.GA1480@bogus>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
 <c0505ef73add4512ce1ee2a71b1c8bc8f771151b.1567437955.git.vitor.soares@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c0505ef73add4512ce1ee2a71b1c8bc8f771151b.1567437955.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pgaj@cadence.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Tue,  3 Sep 2019 12:35:52 +0200, Vitor Soares wrote:
> The I3C devices without a static address can require a specific dynamic
> address for priority reasons.
> 
> Let's update the binding document to make the 'assigned-address' property
> valid if static address == 0 and add an example with this use case.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
