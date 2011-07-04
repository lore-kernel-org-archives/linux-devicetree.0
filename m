From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: x86 FDT and bootloader
Date: Mon, 4 Jul 2011 00:51:29 -0600
Message-ID: <20110704065129.GN15152@ponder.secretlab.ca>
References: <BANLkTi=481j5L7tc1nBdC5qQsYwTzSSGEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi=481j5L7tc1nBdC5qQsYwTzSSGEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 01, 2011 at 01:59:51PM +0200, Christian Gmeiner wrote:
> Hi list,
> 
> I am very new to device trees and have some questions. I am working on an
> embedded x86 device, which has some extra chips connected to an i2c bus.
> As it is not possible to probe for these devices - no ID register etc
> - I am looking
> into DT/FDT.
> How is it possible to pass the FDT to the linux kernel via grub? How far is FDT
> support for x86?

I don't think any work has been done to pass DT using grub.  Right now
(IIRC) the DT is passed via the x86 boot protocol
(Documentation/x86/boot.txt), but I don't see the device tree bits in
the current mainline version of that document.

g.
