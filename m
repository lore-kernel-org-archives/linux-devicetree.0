From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] drivercore: Output common devicetree information in uevent
Date: Wed, 1 Feb 2012 16:20:57 -0700
Message-ID: <CACxGe6vU=jL7tqXQKdzqksEmDNgvN5U+HdypgC3bUcQaqxSuRQ@mail.gmail.com>
References: <1328121082-21802-1-git-send-email-grant.likely@secretlab.ca>
 <1328130989.28487.83.camel@pasglop>
 <CACxGe6uafURnPOGRNpKKXXMM06JHFoqDVqHojQdv_aeCAd_Sfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6uafURnPOGRNpKKXXMM06JHFoqDVqHojQdv_aeCAd_Sfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Greg Kroah-Hartman <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Frederic Lambert <frdrc66-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 1, 2012 at 2:29 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wr=
ote:
> On Wed, Feb 1, 2012 at 2:16 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> On Wed, 2012-02-01 at 11:31 -0700, Grant Likely wrote:
>>> The original function also creates a MODALIAS property for the
>>> compatible
>>> list, but that code has not been generalized into the common case
>>> because
>>> it has the potential to break module loading on a lot of bus types.
>>> Bus
>>> types are still responsible for their own MODALIAS properties.
>>>
>>> Boot tested on ARM and compile tested on PowerPC and SPARC.
>>>
>>>
>> We also want to generalize adding the devspec property that we have on
>> PCI to all devices no ?
>
> The pci_show_devspec() function? =A0Yeah, that can be generalized, but
> haven't researched where the best place to hook it in should be.

Is there any point in generalizing that attribute though when the data
is in uevent?

g.
