From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] media: adv7604: fix bindings inconsistency for
 default-input
Date: Fri, 23 Sep 2016 15:03:53 -0500
Message-ID: <20160923200353.GA16845@rob-hp-laptop>
References: <1474550340-31455-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1474550340-31455-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474550340-31455-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: hans.verkuil@cisco.com, niklas.soderlund@ragnatech.se, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, william.towle@codethink.co.uk, devicetree@vger.kernel.org, radhey.shyam.pandey@xilinx.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2016 at 03:18:59PM +0200, Ulrich Hecht wrote:
> The text states that default-input is an endpoint property, but in the
> example it is a device property.
> 
> The default input is a property of the chip, not of a particular port, so
> the example makes more sense.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/adv7604.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
