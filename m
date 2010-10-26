From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Wrapping proprietary nodes
Date: Tue, 26 Oct 2010 12:25:14 +0100
Message-ID: <20101026112514.GC24714@angua.secretlab.ca>
References: <20101022214454.GB24896@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101022214454.GB24896-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Mailing-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tree-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org, List-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org, Device-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 22, 2010 at 02:44:54PM -0700, David VomLehn wrote:
> I expect my device tree will have some proprietary, one-off devices in
> it. Is it better to wrap these all up in one node:
> 
> 	cisco {
> 		device1 {
> 			...
> 		};
> 		device2 {
> 			...
> 		};
> 	};
> 
> Or should they be specified one node at a time:
> 
> 	cisco-device1 {
> 		...
> 	};
> 	cisco-device2 {
> 		...
> 	};
> 
> My inclination is for the former, but I'd prefer to follow existing usage,
> if any.

Neither.  The layout should reflect the actual hardware layout, and
the devices should follow the Generic Names recommended practice[1][2].

[1] http://playground.sun.com/1275/practice/gnames/gnamv14a.html
[2] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf
	section 2.2.2

The correct way to differentiate between devices (regardless of
whether or not the driver is proprietary, or if it is a custom device
for the system) is to use the 'compatible' property.  Therefore your
tree might look something like this:

	input@<address> {
		compatible = "cisco,<part/device>";
		...
	};
	dma-controller@<address> {
		compatible = "cisco,<part/device>";
		...
	};

g.


> -- 
> David VL
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
