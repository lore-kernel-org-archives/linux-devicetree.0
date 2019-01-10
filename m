From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: gnss: add lna-supply property
Date: Thu, 10 Jan 2019 13:27:57 +0100
Message-ID: <20190110122757.GB9725@localhost>
References: <20181209195150.5192-1-andreas@kemnade.info>
 <20181209195150.5192-6-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209195150.5192-6-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 09, 2018 at 08:51:50PM +0100, Andreas Kemnade wrote:
> Add lna-supply property.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v2:
>  - reordering
> Original order had a
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
>  Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
>  1 file changed, 1 insertion(+)

Ah, missed this one at first.

But shouldn't this go into the generic binding since it isn't specific
for sirf-star based receivers?

Johan
