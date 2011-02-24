From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Question regarding usage of pdev->id and platform_data
Date: Thu, 24 Feb 2011 17:43:31 +0530
Message-ID: <AANLkTikKLJn60_L2r-cyiFLtQVn=WCNBTzPg6vAVwZRV@mail.gmail.com>
References: <AANLkTi=AoFEQ685Pup8i7EAs=hLHip0UnhMV+ZHxVAiD@mail.gmail.com>
	<20110223180316.GI14597@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110223180316.GI14597-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 23 February 2011 23:33, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Hi Thomas,
>
> On Wed, Feb 23, 2011 at 10:48:37PM +0530, Thomas Abraham wrote:
>> Hi,
>>
>> I am adding support for device tree based probe for the s5pv310 serial
>> driver for a platform that has 4 instances of the uart port. I have
>> few questions on this and appreciate any help for the following
>> questions.
>>
>> 1. The driver is based on the usage of pdev->id in several parts of
>> the driver. But the platform_device created using the
>> of_platform_bus_probe function assigns -1 to pdev->id. Is the use of
>> pdev->id not advisable or is it okay if the driver assigns a pdev->id
>> value during the probe.
>
> No, the driver should *not* write a value to pdev->id at probe time.
> Doing so breaks the device model. =A0Instead, any enumeration that the
> driver cares about should be stored in the driver's private data
> structure. =A0I would recommend modifying the driver to copy pdev->id
> into its private structure. =A0If it is -1, then dynamically assign an
> id.
>
>>
>> 2. The driver uses pdev->dev.platform_data even after the probe is
>> complete. I read in one of the posts from Grant Likely that drivers
>> should not assign pdev->dev.platfrom_data.
>
> Correct.
>
>> Is it okay if the driver
>> parse the platform data related information from the device node and
>> assign it to pdev->dev.platform_data.
>
> No. =A0The driver *must not* modify or assign platform_data. =A0That
> pointer provides information to the driver, but there are memory
> allocation lifecycle issues if it tries to store something there.
> (Okay, I it *can* be done if the driver very carefully cleaned up
> after itself; but I strongly recommend against it; that isn't what
> that pointer is for) =A0Modifying it also causes issues with drivers
> that can accept either platform_data or device tree data.
>
> Instead, the driver should store all data it needs in its private data
> structure. =A0That's exactly why drivers have private data structures.
>
> g.
>

Thanks for your explanation. It was very helpful. I am now modifying
the uart driver to keep a copy of pdev->dev.platform_data and use it.
Also, trying to eliminate all uses of pdev->id.

Could you help me with another question. The clk_get api for s5pv310
uses the pdev->id to find the clock defined in platform code. Since
the instance of 'struct platform_device' that the driver gets when
probed using device tree will have pdev->id as -1, the clk_get fails.
Is it okay to assign a instance value to pdev->id in the probe
function.

Thanks,
Thomas.
