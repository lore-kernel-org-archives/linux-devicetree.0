From: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] Kbuild: Use dtc's -d (dependency) option
Date: Tue, 17 Jan 2012 13:26:06 -0500
Message-ID: <1326824773.20239.12.camel@deneb.redhat.com>
References: <1326134295-15547-1-git-send-email-swarren@nvidia.com>
 <1326134295-15547-2-git-send-email-swarren@nvidia.com>
 <1326310587.2535.291.camel@deneb.redhat.com> <4F1206F1.5090405@suse.cz>
 <74CDBE0F657A3D45AFBB94109FB122FF17801D2255@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17801D2255-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org" <linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, "linux-73nT9ZVIoz3k1uMJSBkQmQ@public.gmane.org" <linux-73nT9ZVIoz3k1uMJSBkQmQ@public.gmane.org>, "linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org" <microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2012-01-17 at 09:20 -0800, Stephen Warren wrote:
> Michal Marek wrote at Saturday, January 14, 2012 3:51 PM:
> > On 11.1.2012 20:36, Mark Salter wrote:
> > > On Mon, 2012-01-09 at 11:38 -0700, Stephen Warren wrote:
> > >> This hooks dtc into Kbuild's dependency system.
> > >>
> > >> Thus, for example, "make dtbs" will rebuild tegra-harmony.dtb if only
> > >> tegra20.dtsi has changed yet tegra-harmony.dts has not. The previous
> > >> lack of this feature recently caused me to have very confusing "git
> > >> bisect" results.
> > >>
> > >> For ARM, it's obvious what to add to $(targets). I'm not familiar enough
> > >> with other architectures to know what to add there. Powerpc appears to
> > >> already add various .dtb files into $(targets), but the other archs may
> > >> need something added to $(targets) to work.
> > >>
> > >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >>
> > >
> > > Acked-by: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > For the arch/c6x bit.
> > 
> > As the C6X port has been merged in this merge window, I can't easily
> > apply this patch to my kbuild branch and at the same time please Linus
> > by basing the pull request on a tagged release. So I'm going to drop the
> > arch/c6x part to keep the kbuild branch "pretty" and let either Mark or
> > Stephen send the patch to Linus directly, once he has merged the kbuild
> > branch. Would that work?
> 
> I was assuming my patches were for 3.4 rather than 3.3, since it's pretty
> late for new features in 3.3. In that case, there wouldn't be an issue,
> right?
> 
> If you do want to go ahead and push my patches into 3.3, your proposal
> looks fine to me. Mark, do you want me to push the patch to Linus, or
> do you want to pick it up?

It would probably be best to keep it all together, but if there's a need
to break out c6x individually, I don't mind picking it up.

--Mark
