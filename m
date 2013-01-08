From: Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH] drm/exynos: Get HDMI version from device tree
Date: Tue, 08 Jan 2013 17:45:54 +0100
Message-ID: <1357663554.2884.15.camel@astat>
References: <1357591415-17092-1-git-send-email-seanpaul@chromium.org>
	<50EB3604.60209@firmworks.com>
	<CAOw6vbJc2iV-u1v-Oc3_HUjyq4JukaOdWZ9+mA8RGeFbBpirpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAOw6vbJc2iV-u1v-Oc3_HUjyq4JukaOdWZ9+mA8RGeFbBpirpA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mitch Bradley <wmb@firmworks.com>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 07.01.2013, 16:12 -0500 schrieb Sean Paul:
> On Mon, Jan 7, 2013 at 3:54 PM, Mitch Bradley <wmb@firmworks.com> wrote:
> > On 1/7/2013 10:43 AM, Sean Paul wrote:
> >> Add a property to the hdmi node so we can specify the HDMI version in
> >> the device tree instead of just defaulting to v1.4 with the existence of
> >> the dt node.
> >>
> >> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >> ---
> >>  .../devicetree/bindings/drm/exynos/hdmi.txt        |    3 +++
> >>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   19 ++++++++++---------
> >>  2 files changed, 13 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> >> index 589edee..d1c7d91 100644
> >> --- a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> >> +++ b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> >> @@ -11,6 +11,8 @@ Required properties:
> >>       c) pin function mode.
> >>       d) optional flags and pull up/down.
> >>       e) drive strength.
> >> +- samsung,supports-hdmi-1.4: Define if device supports HDMI v1.4
> >> +- samsung,supports-hdmi-1.3: Define if device supports HDMI v1.3
> >
> > a) This seems pretty generic, not at all samsung-specific, as the HDMI
> > version numbering space is well-defined by the HDMI spec.
> >
> > b) It would be better to make it an integer property whose value
> > encodes the version number, thus eliminating the need to add new
> > properties as new HDMI versions appear.
> >
> 
> Thanks for the quick review, Mitch.
> 
> How about:
> 
> - hdmi-version: 0=v1.3, 1=v1.4
Why bother obfuscating the real version number? Why not just 13=v1.3,
14=v1.4?

Regards,
Lucas
