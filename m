From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/5] Documentation: dt-bindings: document the Armada 375
 USB cluster binding
Date: Fri, 23 May 2014 15:24:28 +0200
Message-ID: <537F4C0C.1080901@free-electrons.com>
References: <1400257376-13251-1-git-send-email-gregory.clement@free-electrons.com> <1400257376-13251-2-git-send-email-gregory.clement@free-electrons.com> <537F13B2.6070500@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537F13B2.6070500-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On 23/05/2014 11:24, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Friday 16 May 2014 09:52 PM, Gregory CLEMENT wrote:
>> Armada 375 comes with an USB2 host and device controller and an USB3
>> controller. The USB cluster control register allows to manage common
>> features of both USB controllers. This commit adds the Device Tree
>> binding documentation for this piece of hardware.
> 
> Pls re-order so that the Documentation patch comes before the driver patch..

OK I will do it

>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  .../bindings/phy/armada-375-usb-phy-cluster.txt      | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/armada-375-usb-phy-cluster.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/armada-375-usb-phy-cluster.txt b/Documentation/devicetree/bindings/phy/armada-375-usb-phy-cluster.txt
> 
> simpler file name? armada-phy?

I can remove the "cluster" part but not the 375, there are many SoCs
from Marvell called Armada, and some of then have nearly nothing in
common, so I prefer keep this name. If your intent is to have a file
with all the PHY binding related to an SoC family, then we should call it
mvebu-phy.


Thanks for your review,

Gregory



-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
