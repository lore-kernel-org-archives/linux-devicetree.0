From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] dt-bindings: net: Correct the documentation of KSZ9021
 skew values
Date: Mon, 16 Sep 2019 16:14:55 +0200 (CEST)
Message-ID: <20190916.161455.1015414751228915954.davem@davemloft.net>
References: <0102016d2b84f180-bd396cb9-16cf-4472-b718-7a4d2d8d8017-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0102016d2b84f180-bd396cb9-16cf-4472-b718-7a4d2d8d8017-000000@eu-west-1.amazonses.com>
Sender: netdev-owner@vger.kernel.org
To: james.byrne@origamienergy.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: James Byrne <james.byrne@origamienergy.com>
Date: Fri, 13 Sep 2019 16:46:35 +0000

> The documentation of skew values for the KSZ9021 PHY was misleading
> because the driver implementation followed the erroneous information
> given in the original KSZ9021 datasheet before it was corrected in
> revision 1.2 (Feb 2014). It is probably too late to correct the driver
> now because of the many existing device trees, so instead this just
> corrects the documentation to explain that what you actually get is not
> what you might think when looking at the device tree.
> 
> Signed-off-by: James Byrne <james.byrne@origamienergy.com>

What tree should this go into?
