From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: gnss: add w2sg0004 compatible string
Date: Tue, 4 Dec 2018 16:57:52 -0600
Message-ID: <20181204225752.GA23361@bogus>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <20181118215801.12280-4-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181118215801.12280-4-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

On Sun, 18 Nov 2018 22:57:59 +0100, Andreas Kemnade wrote:
> Add w2sg0004 compatible string since devices without wakeup
> pins are now supported.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
