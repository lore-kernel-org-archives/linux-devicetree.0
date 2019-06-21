From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
Date: Fri, 21 Jun 2019 11:17:34 +0200
Message-ID: <1561108654.1777.1@crapouillou.net>
References: <20190603152331.23160-1-paul@crapouillou.net>
        <20190603152331.23160-2-paul@crapouillou.net>
        <20190619122622.GB29084@ravnborg.org> <1561040159.1978.0@crapouillou.net>
        <20190621090411.GY12905@phenom.ffwll.local>
        <1561108050.1777.0@crapouillou.net>
        <20190621091343.GA12905@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621091343.GA12905@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org



Le ven. 21 juin 2019 =E0 11:13, Daniel Vetter <daniel@ffwll.ch> a =E9crit=20
:
> On Fri, Jun 21, 2019 at 11:07:30AM +0200, Paul Cercueil wrote:
>>=20
>>=20
>>  Le ven. 21 juin 2019 =E0 11:04, Daniel Vetter <daniel@ffwll.ch> a=20
>> =E9crit :
>>  > On Thu, Jun 20, 2019 at 04:15:59PM +0200, Paul Cercueil wrote:
>>  > >
>>  > >
>>  > >  Le mer. 19 juin 2019 =E0 14:26, Sam Ravnborg <sam@ravnborg.org>=20
>> a
>>  > > =E9crit :
>>  > >  > Hi Paul.
>>  > >  >
>>  > >  > On Mon, Jun 03, 2019 at 05:23:31PM +0200, Paul Cercueil=20
>> wrote:
>>  > >  > >  Add a KMS driver for the Ingenic JZ47xx family of SoCs.
>>  > >  > >  This driver is meant to replace the aging jz4740-fb=20
>> driver.
>>  > >  > >
>>  > >  > >  This driver does not make use of the simple pipe helper,=20
>> for
>>  > > the
>>  > >  > > reason
>>  > >  > >  that it will soon be updated to support more advanced=20
>> features
>>  > > like
>>  > >  > >  multiple planes, IPU integration for colorspace=20
>> conversion and
>>  > >  > > up/down
>>  > >  > >  scaling, support for DSI displays, and TV-out and HDMI=20
>> outputs.
>>  > >  > >
>>  > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  > >  Tested-by: Artur Rojek <contact@artur-rojek.eu>
>>  > >  > >  ---
>>  > >  > >
>>  > >  > >  Notes:
>>  > >  > >      v2: - Remove custom handling of panel. The panel is=20
>> now
>>  > >  > > discovered using
>>  > >  > >      	  the standard API.
>>  > >  > >      	- Lots of small tweaks suggested by upstream
>>  > >  > >
>>  > >  > >      v3: - Use devm_drm_dev_init()
>>  > >  > >      	- Update compatible strings to -lcd instead of -drm
>>  > >  > >      	- Add destroy() callbacks to plane and crtc
>>  > >  > >      	- The ingenic,lcd-mode is now read from the bridge's=20
>> DT
>>  > > node
>>  > >  > >
>>  > >  > >      v4: Remove ingenic,lcd-mode property completely. The
>>  > > various
>>  > >  > > modes are now
>>  > >  > >      	deduced from the connector type, the pixel format or=20
>> the
>>  > > bus
>>  > >  > > flags.
>>  > >  > >
>>  > >  > >      v5: - Fix framebuffer size incorrectly calculated for=20
>> 24bpp
>>  > >  > > framebuffers
>>  > >  > >      	- Use 32bpp framebuffer instead of 16bpp, as it'll=20
>> work
>>  > > with
>>  > >  > > both
>>  > >  > >      	  16-bit and 24-bit panel
>>  > >  > >      	- Get rid of drm_format_plane_cpp() which has been=20
>> dropped
>>  > >  > > upstream
>>  > >  > >      	- Avoid using drm_format_info->depth, which is=20
>> deprecated.
>>  > >  > In the drm world we include the revision notes in the=20
>> changelog.
>>  > >  > So I did this when I applied it to drm-misc-next.
>>  > >  >
>>  > >  > Fixed a few trivial checkpatch warnings about indent too.
>>  > >  > There was a few too-long-lines warnings that I ignored.=20
>> Fixing
>>  > > them
>>  > >  > would have hurt readability.
>>  > >
>>  > >  Thanks.
>>  > >
>>  > >  > I assume you will maintain this driver onwards from now.
>>  > >  > Please request drm-misc commit rights (see
>>  > >  > https://www.freedesktop.org/wiki/AccountRequests/)
>>  > >  > You will need a legacy SSH account.
>>  > >
>>  > >  I requested an account here:
>>  > > =20
>> https://gitlab.freedesktop.org/freedesktop/freedesktop/issues/162
>>  >
>>  > This 404s for me. Did you set the issue to private by any chance?=20
>> Or
>>  > deleted already again?
>>  > -Daniel
>>=20
>>  Sorry, yes, I set it to private. I thought I had to :(
>=20
> Well I can't ack it if its private, so please change that. Also,
> everything is public around here, or almost everything ...
> -Daniel

I closed the old one and created a new, public one:
https://gitlab.freedesktop.org/freedesktop/freedesktop/issues/165


>>=20
>>  > >
>>  > >  > And you should familiarize yourself with the=20
>> maintainer-tools:
>>  > >  > https://drm.pages.freedesktop.org/maintainer-tools/index.html
>>  > >  >
>>  > >  > For my use I use "dim update-branches; dim apply; dim push
>>  > >  > So only a small subset i needed for simple use.
>>  > >  >
>>  > >  > 	Sam
>>  > >
>>  > >
>>  >
>>  > --
>>  > Daniel Vetter
>>  > Software Engineer, Intel Corporation
>>  > http://blog.ffwll.ch
>>=20
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

=
