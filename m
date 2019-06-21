From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
Date: Fri, 21 Jun 2019 11:07:30 +0200
Message-ID: <1561108050.1777.0@crapouillou.net>
References: <20190603152331.23160-1-paul@crapouillou.net>
        <20190603152331.23160-2-paul@crapouillou.net>
        <20190619122622.GB29084@ravnborg.org> <1561040159.1978.0@crapouillou.net>
        <20190621090411.GY12905@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621090411.GY12905@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org



Le ven. 21 juin 2019 =E0 11:04, Daniel Vetter <daniel@ffwll.ch> a =E9crit=20
:
> On Thu, Jun 20, 2019 at 04:15:59PM +0200, Paul Cercueil wrote:
>>=20
>>=20
>>  Le mer. 19 juin 2019 =E0 14:26, Sam Ravnborg <sam@ravnborg.org> a=20
>> =E9crit :
>>  > Hi Paul.
>>  >
>>  > On Mon, Jun 03, 2019 at 05:23:31PM +0200, Paul Cercueil wrote:
>>  > >  Add a KMS driver for the Ingenic JZ47xx family of SoCs.
>>  > >  This driver is meant to replace the aging jz4740-fb driver.
>>  > >
>>  > >  This driver does not make use of the simple pipe helper, for=20
>> the
>>  > > reason
>>  > >  that it will soon be updated to support more advanced features=20
>> like
>>  > >  multiple planes, IPU integration for colorspace conversion and
>>  > > up/down
>>  > >  scaling, support for DSI displays, and TV-out and HDMI outputs.
>>  > >
>>  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  Tested-by: Artur Rojek <contact@artur-rojek.eu>
>>  > >  ---
>>  > >
>>  > >  Notes:
>>  > >      v2: - Remove custom handling of panel. The panel is now
>>  > > discovered using
>>  > >      	  the standard API.
>>  > >      	- Lots of small tweaks suggested by upstream
>>  > >
>>  > >      v3: - Use devm_drm_dev_init()
>>  > >      	- Update compatible strings to -lcd instead of -drm
>>  > >      	- Add destroy() callbacks to plane and crtc
>>  > >      	- The ingenic,lcd-mode is now read from the bridge's DT=20
>> node
>>  > >
>>  > >      v4: Remove ingenic,lcd-mode property completely. The=20
>> various
>>  > > modes are now
>>  > >      	deduced from the connector type, the pixel format or the=20
>> bus
>>  > > flags.
>>  > >
>>  > >      v5: - Fix framebuffer size incorrectly calculated for 24bpp
>>  > > framebuffers
>>  > >      	- Use 32bpp framebuffer instead of 16bpp, as it'll work=20
>> with
>>  > > both
>>  > >      	  16-bit and 24-bit panel
>>  > >      	- Get rid of drm_format_plane_cpp() which has been dropped
>>  > > upstream
>>  > >      	- Avoid using drm_format_info->depth, which is deprecated.
>>  > In the drm world we include the revision notes in the changelog.
>>  > So I did this when I applied it to drm-misc-next.
>>  >
>>  > Fixed a few trivial checkpatch warnings about indent too.
>>  > There was a few too-long-lines warnings that I ignored. Fixing=20
>> them
>>  > would have hurt readability.
>>=20
>>  Thanks.
>>=20
>>  > I assume you will maintain this driver onwards from now.
>>  > Please request drm-misc commit rights (see
>>  > https://www.freedesktop.org/wiki/AccountRequests/)
>>  > You will need a legacy SSH account.
>>=20
>>  I requested an account here:
>>  https://gitlab.freedesktop.org/freedesktop/freedesktop/issues/162
>=20
> This 404s for me. Did you set the issue to private by any chance? Or
> deleted already again?
> -Daniel

Sorry, yes, I set it to private. I thought I had to :(

-Paul


>>=20
>>  > And you should familiarize yourself with the maintainer-tools:
>>  > https://drm.pages.freedesktop.org/maintainer-tools/index.html
>>  >
>>  > For my use I use "dim update-branches; dim apply; dim push
>>  > So only a small subset i needed for simple use.
>>  >
>>  > 	Sam
>>=20
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

=
