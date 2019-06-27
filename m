From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] dt-bindings: arm: Limit cpus schema to only check Arm
 'cpu' nodes
Date: Wed, 26 Jun 2019 18:02:22 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906261759390.29311@viisi.sifive.com>
References: <20190627000044.12739-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627000044.12739-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Jun 2019, Rob Herring wrote:

> Matching on the 'cpus' node was a bad choice because the schema is
> incorrectly applied to non-Arm cpus nodes. As we now have a common cpus
> schema which checks the general structure, it is also redundant to do so
> in the Arm CPU schema.
> 
> The downside is one could conceivably mix different architecture's cpu
> nodes or have typos in the compatible string. The latter problem pretty
> much exists for every schema.

The RISC-V patch applies cleanly, but this one doesn't apply here on 
either master or next-20190626.  Is there a different base commit?


- Paul
