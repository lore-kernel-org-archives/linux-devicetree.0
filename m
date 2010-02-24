From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC] driver-core: Add device node pointer to struct device
Date: Wed, 24 Feb 2010 14:36:45 -0800
Message-ID: <20100224223645.GA18883@suse.de>
References: <20100224210514.16289.86611.stgit@angua>
	<20100224214442.GB18437@suse.de>
	<fa686aa41002241409x4bcdabfet43e410eb8c480166@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41002241409x4bcdabfet43e410eb8c480166-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kay.sievers-tD+1rO4QERM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2010 at 03:09:24PM -0700, Grant Likely wrote:
> On Wed, Feb 24, 2010 at 2:44 PM, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org> wrote:
> > On Wed, Feb 24, 2010 at 02:10:30PM -0700, Grant Likely wrote:
> >> Greg and Kay,
> >>
> >> This is a patch from a larger series of OF related cleanup patches. =
=A0This
> >> one adds a new 'of_node' member to struct device, conditional upon
> >> CONFIG_OF. =A0The goal is to move of_node out of archdata because all
> >> arches using CONFIG_OF need it.
> >>
> >> Before I commit too much effort down this path, I want to get your
> >> feedback. =A0Do you have any objections to this change to struct devic=
e?
> >>
> >> @@ -414,6 +415,9 @@ struct device {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0override */
> >> =A0 =A0 =A0 /* arch specific additions */
> >> =A0 =A0 =A0 struct dev_archdata =A0 =A0 archdata;
> >> +#ifdef CONFIG_OF
> >> + =A0 =A0 struct device_node =A0 =A0 =A0*of_node;
> >> +#endif
> >
> > No objection from me, but do we really need the #ifdef here?
> =

> I added the #ifdef because it is complete dead weight when CONFIG_OF
> is not set.  However, I'll defer to your preference here on what looks
> cleaner w.r.t. maintenance.

Ok, you can leave it as-is, that's not a problem.  As long as we don't
have to #ifdef the core code, it should be fine.

thanks,

greg k-h
