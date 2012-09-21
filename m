From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: Deprecating reserve-map in favor of properties
Date: Fri, 21 Sep 2012 12:13:27 +1000
Message-ID: <1348193607.1132.38.camel@pasglop>
References: <1348179051.1132.32.camel@pasglop>
 <8C5A5EB8-6CD7-4E35-AACF-A2CC04CDBE48@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8C5A5EB8-6CD7-4E35-AACF-A2CC04CDBE48-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2012-09-20 at 20:35 -0500, Kumar Gala wrote:
> If you do this, please update the code in dtc/libfdt to construct the
> new nodes.  We use this in u-boot to reserve kernel, dtb, initrd, etc
> regions.  So would be nice to have drop in replacement code that could
> use same APIs if possible.

The kernel would of course still understand the reserve map and I don't
intend to remove it from the header immediately, so I think that can
stay.... unless we make it a function of the version.

It's non-trivial to make the same (stateless) API in libfdt deal with
setting properties. I'd rather avoid that problem initially by not
changing the blob format, keeping the reserve map around for "legacy"
purposes and simply making the kernel capable of understanding the
properties.

Cheers,
Ben.
