From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] drivercore: Output common devicetree information in uevent
Date: Wed, 1 Feb 2012 14:26:14 -0700
Message-ID: <CACxGe6semcPXkGfEN76DezbC-sAgkczjofbjvbexM8g_8gPdBw@mail.gmail.com>
References: <1328121545-21955-1-git-send-email-grant.likely@secretlab.ca>
 <20120201190940.GC20358@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120201190940.GC20358-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Greg Kroah-Hartman <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Frederic Lambert <frdrc66-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 1, 2012 at 12:09 PM, Greg Kroah-Hartman <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Feb 01, 2012 at 11:39:04AM -0700, Grant Likely wrote:
>> When userspace needs to find a specific device, it currently isn't easy =
to
>> resolve a /sys/devices/ path from a specific device tree node. =A0Nor is=
 it
>> easy to obtain the compatible list for devices.
>>
>> This patch generalizes the code that inserts OF_* values into the uevent
>> device attribute so that any device that is attached to an OF node will
>> have that information exported to userspace. =A0Without this patch only
>> platform devices and some powerpc-specific busses have access to this
>> data.
>>
>> The original function also creates a MODALIAS property for the compatible
>> list, but that code has not been generalized into the common case because
>> it has the potential to break module loading on a lot of bus types. =A0B=
us
>> types are still responsible for their own MODALIAS properties.
>
> So you are only adding new properties to be exported, not removing any
> from any existing devices, right?
>
> If so, I have no objection to this at all, if you want to take this
> through your tree for 3.4, please feel free to add:
>
> =A0 =A0 =A0 =A0Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>
> Or I can take it through my driver-core tree, which ever is easiest for
> you.

I'll take it via the devicetree branch.  Thanks.

g.
