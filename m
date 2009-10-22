From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: dtc: Empty ranges property: #cells-size warning
Date: Thu, 22 Oct 2009 11:56:48 +0200
Message-ID: <200910221156.48866.sr@denx.de>
References: <200910211713.12503.sr@denx.de>
	<54889.84.105.60.153.1256143282.squirrel@gate.crashing.org>
	<20091021220413.GA12560@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091021220413.GA12560-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 22 October 2009 00:04:13 David Gibson wrote:
> > No, the warning is correct, and your device tree is in error.
> >
> > An empty "ranges" property means that the child address space is
> > identical to the parent address space, which isn't the case here.
> >
> > You should resolve this by using a non-empty "ranges" property,
> > instead.  If e.g. the address space is 1GB, and located at 0, you
> > would do
> >
> >    < 0    0 0    0x40000000 >
> > (child) (parent)    (size)
> 
> Exactly.  An empty ranges property makes no sense if the parent and
> child address spaces aren't identical.  You need an explicit ranges
> property to show how the child address space is embedded in the
> parent's.

OK, thanks for making this clear.

Cheers,
Stefan
