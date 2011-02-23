From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Question regarding usage of pdev->id and platform_data
Date: Wed, 23 Feb 2011 11:03:16 -0700
Message-ID: <20110223180316.GI14597@angua.secretlab.ca>
References: <AANLkTi=AoFEQ685Pup8i7EAs=hLHip0UnhMV+ZHxVAiD@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=AoFEQ685Pup8i7EAs=hLHip0UnhMV+ZHxVAiD-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Wed, Feb 23, 2011 at 10:48:37PM +0530, Thomas Abraham wrote:
> Hi,
> 
> I am adding support for device tree based probe for the s5pv310 serial
> driver for a platform that has 4 instances of the uart port. I have
> few questions on this and appreciate any help for the following
> questions.
> 
> 1. The driver is based on the usage of pdev->id in several parts of
> the driver. But the platform_device created using the
> of_platform_bus_probe function assigns -1 to pdev->id. Is the use of
> pdev->id not advisable or is it okay if the driver assigns a pdev->id
> value during the probe.

No, the driver should *not* write a value to pdev->id at probe time.
Doing so breaks the device model.  Instead, any enumeration that the
driver cares about should be stored in the driver's private data
structure.  I would recommend modifying the driver to copy pdev->id
into its private structure.  If it is -1, then dynamically assign an
id.

> 
> 2. The driver uses pdev->dev.platform_data even after the probe is
> complete. I read in one of the posts from Grant Likely that drivers
> should not assign pdev->dev.platfrom_data.

Correct.

> Is it okay if the driver
> parse the platform data related information from the device node and
> assign it to pdev->dev.platform_data.

No.  The driver *must not* modify or assign platform_data.  That
pointer provides information to the driver, but there are memory
allocation lifecycle issues if it tries to store something there.
(Okay, I it *can* be done if the driver very carefully cleaned up
after itself; but I strongly recommend against it; that isn't what
that pointer is for)  Modifying it also causes issues with drivers
that can accept either platform_data or device tree data.

Instead, the driver should store all data it needs in its private data
structure.  That's exactly why drivers have private data structures.

g.
