From: Sethi Varun-B16395 <B16395-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Two different interrupt-parents
Date: Mon, 16 Apr 2012 03:40:37 +0000
Message-ID: <C5ECD7A89D1DC44195F34B25E172658D0CE077@039-SN2MPN1-013.039d.mgd.msft.net>
References: <CAKON4OwAix9D61kp9mDq0WVvthDKzm=FFz2AoFQWe1yqJJgf6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKON4OwAix9D61kp9mDq0WVvthDKzm=FFz2AoFQWe1yqJJgf6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jon,
Does the cascaded PIC have an interrupt line to the system interrupt controller?

Regards
Varun

> -----Original Message-----
> From: devicetree-discuss-
> bounces+varun.sethi=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org [mailto:devicetree-
> discuss-bounces+varun.sethi=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of
> jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Sent: Sunday, April 15, 2012 8:27 AM
> To: devicetree-discuss
> Subject: Two different interrupt-parents
> 
> How do you define a device with two different interrupt parents?
> 
> I have a OTG USB controller where the main usb interrupt is on the system
> interrupt controller and the OTG power interrupts are on a cascaded PIC.
> 
> --
> Jon Smirl
> jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
