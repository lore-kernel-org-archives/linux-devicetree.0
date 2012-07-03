From: Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Tue, 3 Jul 2012 15:42:42 +0100
Message-ID: <20120703144242.GE25995@sirena.org.uk>
References: <4FF1C567.4060809@wwwdotorg.org> <4FF1D8F9.9040005@firmworks.com>
 <4FF1DDBD.9050106@wwwdotorg.org> <4FF1EA1A.9030307@firmworks.com>
 <4FF1F955.6030204@wwwdotorg.org>
 <6BC22F77-77D7-45DF-821A-6CA2DBADEA59@kernel.crashing.org>
 <4FF22031.3060206@wwwdotorg.org>
 <FE3C6687-727E-4191-9D37-9E71EBFEF0AE@kernel.crashing.org>
 <20120703104720.GB25995@sirena.org.uk>
 <F928AF0B-65CF-48D1-8DB5-4C27FD6AB82F@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <F928AF0B-65CF-48D1-8DB5-4C27FD6AB82F-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
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
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 03, 2012 at 04:00:37PM +0200, Segher Boessenkool wrote:

> So you *can* address the device, you just don't want to show that
> in the device tree (I don't blame you, it's quite impossible to
> design a sane addressing scheme for this, all this stuff is so
> ad-hoc).  I see.  You could make it the kid of a GPIO controller
> node, but then what if it is controlled by two (or more!) GPIO
> controllers?

Yes, exactly - there's a bunch of random incoming signals which aren't
reliably going to fit in with the tree structure (and of course we do
already have a GPIO binding which isn't anything like the bus you're
suggesting above).

> There is still no reason for the fake bus node to have a "compatible"
> property though.  What could it possibly mean?  "This bus does not
> exist at all but you access it in bla bla bla way"?  That just doesn't
> make sense.  It doesn't exist, you do not access it, it has no
> programming model, it has no "compatible" property.

Well, as everyone keeps saying this seems to be a limitation of the
current device tree rather than something that's actually sensible in
and of itself.
