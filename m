From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFCv2 0/2] Representing interrupt affinity in devicetree
Date: Sat, 13 Apr 2013 22:33:22 +0100
Message-ID: <20130413213322.7C6193E2249@localhost>
References: <1355417368-6861-1-git-send-email-mark.rutland@arm.com>
 <20130304025115.05D413E17F8@localhost>
 <20130305092849.GA15661@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130305092849.GA15661-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 5 Mar 2013 09:28:49 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Mar 04, 2013 at 02:51:14AM +0000, Grant Likely wrote:
> > I could use some more context for how this will be used. Do device
> > drivers need to be aware of which CPU can handle an interrupt for a
> > device, or is it the sort of thing that can be done in the background
> > when an irq is requested? What are some examples of device drivers using
> > this interface.
> 
> The main users I can think of for this would be PMUs in multi-cluster systems,
> where we may have differing PMUs in each cluster. The driver for each needs to
> know the set of CPUs it's handling, and which CPU each interrupt is affine to.
> 
> With the above binding scheme, we'd describe the A15x2 A7x3 CoreTile's PMUs
> something like:
> 
> pmu_a15s {
> 	compatible = "arm,cortex-a15-pmu";
> 	interrupts = <0 68 4>,
> 	             <0 69 4>;
> 	interrupts-affinity = <0 0x0>,
> 	                      <0 0x1>;
> };
> 
> pmu_a7s {
> 	compatible = arm,cortex-a7-pmu";
> 	interrupts = <0 128 4>,
> 	             <0 129 4>,
> 	             <0 130 4>;
> 	interrupts-affinity = <0 0x100>,
> 	                      <0 0x101>,
> 	                      <0 0x102>;
> };

That does sound an awful lot like what Lorenzo has been trying to solve.
I really do think that you need to coordinate with him.

g.
