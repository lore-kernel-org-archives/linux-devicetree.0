From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device Trees
Date: Sun, 3 Jul 2011 15:01:26 -0600
Message-ID: <CACxGe6tjWYX6RERcnufZxYnznHZKiSe+A3_ThPLN53OxwYtQog@mail.gmail.com>
References: <20110703222042.19386c7wy7zfn4g8@webmail.huji.ac.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110703222042.19386c7wy7zfn4g8-2RFepEojUI0+8gVPFGsyePqBs+8SCbDb@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Omair Eshkenazi <stimpson-GM2B4lVtXfaYZoqfULhbRA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[cc'ing device tree discuss mailing list]

On Sun, Jul 3, 2011 at 1:20 PM, Omair Eshkenazi
<stimpson-GM2B4lVtXfaYZoqfULhbRA@public.gmane.org> wrote:
> G'day,
>
> The recent Device Trees article on LWN contained the following paragraph:
> "Drivers expecting platform data should check the dev.platform_data pointer
> in the usual way. If there is a non-null value there, the driver has been
> instantiated in the traditional way and device tree does not enter into the
> picture; the platform data should be used in the usual way. If, however, the
> driver has been instantiated from the device tree code, the platform_data
> pointer will be null, indicating that the information must be acquired from
> the device tree directly."
>
> I read that as saying that the in-kernel platform_data takes precedent over
> the device-tree.
>
> Is that correct? Shouldn't it be the other way 'round? After all, the point
> of device trees is to avoid the hard-coded kernel board config.

No, it probably shouldn't be the other way around.  If the kernel has
gone to the trouble of setting the platform_data pointer when it
happens to have a device_node reference, then it probably has a
*really good* reason for doing so and the platform_data pointer
shouldn't be ignored.  It's not desirable, but sometimes it is
unavoidable.

In actual fact, there is more subtlety here than the LWN article
suggests.  It is entirely possible for a device to have both a
platform_data pointer and a device_node reference, and the driver may
very well have to take into account both.  The most common situation
where this will happen is if a driver requires a board specific
callback pointer which cannot be encoded into a device tree.  In which
case, the driver can get most of its configuration from the device
node, but refer to the platform_data to obtain the callback pointers
it requires.  *most of the time* this is not an issue and a driver
only needs to worry about platform_data OR device_node, not both.
However, it is important to be aware of the possibility that a driver
might indeed use both.

g.
