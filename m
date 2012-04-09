From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Mon, 9 Apr 2012 22:27:48 +0100
Message-ID: <20120409212748.GJ24211@n2100.arm.linux.org.uk>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-2-git-send-email-jm@lentin.co.uk>
 <20120406234955.840F73E1323@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120406234955.840F73E1323@localhost>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 06, 2012 at 04:49:55PM -0700, Grant Likely wrote:
> On Tue, 27 Mar 2012 22:54:11 +0100, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org> wrote:
> > +config MACH_DNS320_DT
> > +	bool "D-Link DNS-320 (Flattened Device Tree)"
> > +	select ARCH_KIRKWOOD_DT
> > +	select MACH_DNSKW_DT
> > +	select CONFIG_MTD_OF_PARTS
> > +	select CONFIG_SERIAL_OF_PLATFORM
> 
> These two lines are dangerous.

No they aren't - at least not as the above patch is written.  There are
no configuration variables called CONFIG_CONFIG_MTD_OF_PARTS nor
CONFIG_CONFIG_SERIAL_OF_PLATFORM.

Kconfig won't warn about that, and if we assume that this patch has been
properly tested, it would appear that these two select statements just
aren't required (because they're effective no-ops as they currently stand).
