From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH] dt-bindings: net: Correct the documentation of KSZ9021
 skew values
Date: Thu, 19 Sep 2019 18:30:15 -0700
Message-ID: <20190919183015.0ea6fb89@cakuba.netronome.com>
References: <0102016d2b84f180-bd396cb9-16cf-4472-b718-7a4d2d8d8017-000000@eu-west-1.amazonses.com>
        <20190916.161455.1015414751228915954.davem@davemloft.net>
        <0102016d3b297538-fcca5199-6ad1-4625-b11c-3ad3919a0c48-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0102016d3b297538-fcca5199-6ad1-4625-b11c-3ad3919a0c48-000000@eu-west-1.amazonses.com>
Sender: netdev-owner@vger.kernel.org
To: James Byrne <james.byrne@origamienergy.com>
Cc: David Miller <davem@davemloft.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 16 Sep 2019 17:40:35 +0000, James Byrne wrote:
> On 16/09/2019 15:14, David Miller wrote:
> > From: James Byrne <james.byrne@origamienergy.com>
> > Date: Fri, 13 Sep 2019 16:46:35 +0000
> >   
> >> The documentation of skew values for the KSZ9021 PHY was misleading
> >> because the driver implementation followed the erroneous information
> >> given in the original KSZ9021 datasheet before it was corrected in
> >> revision 1.2 (Feb 2014). It is probably too late to correct the driver
> >> now because of the many existing device trees, so instead this just
> >> corrects the documentation to explain that what you actually get is not
> >> what you might think when looking at the device tree.
> >>
> >> Signed-off-by: James Byrne <james.byrne@origamienergy.com>  
> > 
> > What tree should this go into?  
> 
> I believe this should go into the 'net' tree, but please let me know if 
> I have submitted this patch incorrectly in some way.

Okay, applied, thanks.
