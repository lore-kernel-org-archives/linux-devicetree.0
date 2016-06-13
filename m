From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: msm/mdp: Fix up clock related
 bindings
Date: Mon, 13 Jun 2016 14:03:31 -0500
Message-ID: <20160613190331.GA27237@rob-hp-laptop>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-4-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465555600-25742-4-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 04:16:33PM +0530, Archit Taneja wrote:
> MDP5:
> - Don't ask for source clock
> 
> MDP4:
> - Give a better name for MDP_TV_CLK
> - Remove TV_SRC
> - Add MDP_AXI_CLK

This could use the explanation in the commit msg why it is okay you are 
breaking compatibility.

With that,

Acked-by: Rob Herring <robh@kernel.org>
