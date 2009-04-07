From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 3/4 v2] mtd/powerpc: Remove unused "device-width" property
Date: Tue, 7 Apr 2009 18:54:16 +0200
Message-ID: <200904071854.16818.sr@denx.de>
References: <1239093575-12147-1-git-send-email-sr@denx.de>
	<49DB8271.8050501@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49DB8271.8050501-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 07 April 2009, Scott Wood wrote:
> Stefan Roese wrote:
> > This property is unused. It's not handled as all by the physmap_of
> > driver. So let's remove it from the documentation.
> >
> > Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
> > CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> The device tree describes the hardware, not what Linux happens to do
> with it at the moment.
>
> I'd rather keep it.

I find it rather confusing to "see" such bindings that are not supported. One 
could expect something to happen/change after defining this property. So in 
general I think adding unsupported properties to the Documentation is a bad 
idea. But that's just my 2 cents. If the general opinion is to keep this 
property, I'll keep it in of course.

Best regards,
Stefan
