From: Kristoffer Glembo <kristoffer-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Mon, 23 May 2011 11:37:04 +0200
Message-ID: <4DDA2AC0.1060406@gaisler.com>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>	<20110519233958.GB18181@ponder.secretlab.ca>	<4DD66B8A.5040404@gmail.com>	<201105201621.03801.arnd@arndb.de>
	<4DD68614.6090209@gmail.com>	<a42f0c27-2811-4b68-bedf-7dfaa7bff6ff@VA3EHSMHS025.ehs.local>
	<BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Grant Likely wrote:
> In the case we're talking about the bus really is an AMBA bus, and all
> the devices on it are in some sense real amba devices.  The problem is
> that not all of the devices on the bus implement peripheral ID
> registers or other mechanisms that good upstanding AMBA devices are
> expected to have.  


Before we go hardware bashing of non primecell AMBA devices I would just
want to point out that the primecell stuff is not part of the AMBA specification.

So the "amba bus" should really have a way of marking which devices are primecell
devices instead of assuming this.

We (Aeroflex Gaisler) use an AMBA bus on our LEON SPARC chips but don't have any primecells 
devices. We went the of_platform_driver route after concluding that the AMBA bus in Linux is 
really not an AMBA bus at all. Our bus is fully probable though as all information about the 
present devices are memory mapped in a "plug and play" area.

On the other hand, there is not much point of an AMBA bus driver which does nothing more than
the platform driver. But AMBA is really a misnomer in this case.

/Kristoffer
