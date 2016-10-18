From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/4] net: smsc91x: add u16 workaround for pxa platforms
Date: Tue, 18 Oct 2016 11:39:44 -0500
Message-ID: <20161018163944.jaqtthlka6t7pxhn@rob-hp-laptop>
References: <1476733532-29716-1-git-send-email-robert.jarzmik@free.fr>
 <1476733532-29716-5-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476733532-29716-5-git-send-email-robert.jarzmik@free.fr>
Sender: netdev-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Jonathan Cameron <jic23@cam.ac.uk>, David Howells <dhowells@redhat.com>, Nicolas Pitre <nico@fluxnic.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-am33-list@redhat.com, Jeremy Linton <jeremy.linton@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 17, 2016 at 09:45:32PM +0200, Robert Jarzmik wrote:
> Add a workaround for mainstone, idp and stargate2 boards, for u16 writes
> which must be aligned on 32 bits addresses.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Jeremy Linton <jeremy.linton@arm.com>
> ---
> Since v1: rename dt property to pxa-u16-align4
>       	  change the binding documentation file
> ---
>  Documentation/devicetree/bindings/net/smsc-lan91c111.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
