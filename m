From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/panel: panel-simple: Support panel-dpi
Date: Fri, 08 Mar 2019 15:05:51 -0800
Message-ID: <87mum59dbk.fsf@anholt.net>
References: <20190307101030.3822-1-maxime.ripard@bootlin.com>
 <20190308094457.GA22655@ulmo>
 <CAL_JsqLEuFG2TLvr+fJ3TU=ch1+VADc+x4+sSwrRofQOWM0Tgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0987966376=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqLEuFG2TLvr+fJ3TU=ch1+VADc+x4+sSwrRofQOWM0Tgw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Eben Upton <eben@raspberrypi.org>, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel <dri-devel@lists.freedesktop.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

--===============0987966376==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Herring <robh+dt@kernel.org> writes:

> On Fri, Mar 8, 2019 at 3:45 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> On Thu, Mar 07, 2019 at 11:10:30AM +0100, Maxime Ripard wrote:
>> > The kernel has a device tree binding for panel-dpi which allows for the
>> > panel timings to be described in the device-tree, however it wasn't
>> > supported so far except in a (small) number of KMS drivers that had an
>> > ad-hoc solution for this (omapdrm for example).
>>
>> I'm growing really tired of having to repeat these discussions...
>>
>> As far as I can tell, this binding was never reviewed by device tree
>> maintainers, so I'm not sure whether there's concensus that this should
>> be proliferated. Adding Rob and the device tree mailing list for a wider
>> audience.
>>
>> > Just like we've seen with panel-lvds, and even though the current dogma is
>> > to set the timings within the driver, having them in the device tree
>> > provides a number of benefits.
>>
>> I don't think there was concensus on that. But Rob acked it, so I guess
>> he thought it was acceptable.
>>
>> Rob, can we use this thread as an opportunity to write down some of the
>> rules regarding this? We've discussed this numerous times in the past
>> but there still doesn't seem to be concensus.
>>
>> I know you're very tired of this as well, but perhaps we can bite the
>> bullet now and produce clear documentation and guidelines that we can
>> point people at (or put in an obvious location so that people find it
>> themselves) in the future, so that we don't have to keep having this
>> discussion.
>>
>> Summarizing what our latest discussion on this was:
>>
>>   * Generic compatible strings should typically be used as a fallback
>>     only. Exceptions could be made if there's a specific standard that
>>     is sufficiently strict to not require any quirks, and hence avoid
>>     the need for panel-specific compatible strings.
>>
>>   * So in general device tree nodes for panels need to have a specific
>>     compatible string that uniquely identifies that panel. This is in
>>     line with existing practice for other devices and a good idea in
>>     general so that we can implement quirks if necessary.
>>
>>   * Panel nodes can optionally also list a generic compatible string, in
>>     addition to the specific compatible string, that drivers could match
>>     to support devices which are not specifically supported yet but that
>>     may already work anyway.
>>
>>     I'm not sure that's really practical. In the past we've seen that a
>>     panel can work fine on one board but break on another because the
>>     runtime execution timing is such that necessary delays in the power
>>     sequence are noticeable on one but not another. I also suspect that
>>     in some cases shortcuts were taken because things happened to work,
>>     even if perhaps there was intermittent garbage on the screen because
>>     the power sequence wasn't respected.
>
> If there's some problem with a panel working, then we just use the
> more specific compatible and deal with it in the driver. What's the
> issue here?
>
> A bigger issue is if later you need to tweak the timings, do you
> update the timings in DT or add timings to kernel?
>
>>   * Mechanisms that probe information from a panel at runtime (such as
>>     EDID) are to see preferential treatment. In other words, if a DDC
>>     channel exists to a panel, the driver should parse video timings
>>     from the EDID.
>
> That pretty well summarizes things.

I love how EDID keeps getting brought up in discussions how how to
handle non-EDID devices.  If anyone had EDIDs, we'd use them because
that's easy, but we don't.

>> One thing that's not clear to me is whether or not we want to allow
>> video timings to be specified in DT. I used to think that we didn't,
>> because the video timings are implied by the specific compatible string
>> (which we already determined is mandatory anyway), but the panel-lvds
>> bindings suggest that from a device tree perspective this would be fine?
>> I also notice that the panel-lvds doesn't make any provisions for power
>> sequences. The same is true for panel-dpi. Are both LVDS and DPI panels
>> always guaranteed not to need any specific power sequences?
>
> As long as the specific compatible is there, I'd don't really care
> that much. I think we've found over time with the LVDS binding that
> the specific compatible ends up being needed.
>
> I'm fine with timings in DT, but I'm on the fence whether a
> 'panel-dpi' compatible is a good thing or not. At least with LVDS,
> that implies something about the interface. For DPI, there is no
> standard really (MIPI does define something, but following MIPI is
> pretty optional). There's lots of ways to wire up the data lines. It
> could be a continual addition of timing flags which I don't want to
> see. My controller has fine grained clock controls and I need to
> control the duty cycle or delay the pixel clock some number of ns, for
> example. I think most of that goes away with LVDS.

I think now that we have 85 struct panel_desc in panel-simple.c, we can
just go look at what's actually needed to drive panels.  Detailed power
timing requirements are infrequently needed, being specified for 23 of
those.  I keep hearing that more detailed timing is necessary, so I
looked at the other non-DSI, non-SPI panels in tree (since those should
always require a driver for their register writes) and found a total of:

- panel-arm-versatile: has register writes to a syscon
- olinuxino: reads modes from an eeprom.
- seiko-43wvf1g: has two power rails to manage
- panel-lvds: is basically doing the thing people are asking panel-dpi
  to do but for lvds.

If DT is supposed to "describe the hardware" as people keep telling me,
then I think we have strong evidence of commonality between hardware
that could be described in data instead of code, using panel-simple's
data structures as the model.

>> If ultimately we decide that video timings in DT are okay, then how are
>> we going to reconcile that with existing bindings? By definition the
>> video timings would have to be optional, otherwise we'd be breaking ABI
>> for existing device trees. But if they are optional, then we're back to
>> square one, because we need to rely on the specific compatible string
>> to get the bindings if they aren't present in DT. And then having them
>> in DT is really just redundant. Except perhaps in order to support the
>> cases that Maxime described where you want to do some really fine tuning
>> to meet EMI requirements or some such.
>
> For existing compatibles, they'd have to remain optional. For new
> compatibles, it would be by choice. I don't want to see a bunch of
> let's move the timing info to DT and remove from the driver patches.

Of course.  (and same for requiring a panel-specific compatible)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlyC9U8ACgkQtdYpNtH8
nug5yQ//dHFvsaY4ANH+X9V82XrIOlDyfOLB/zF5XO4FAsV6FFrvDTFw3qiKZkNV
v0LhQ/802O9y6ZTeYE/oe0jxxO8c/lVBhKv8QR/M7YU2poeNdItd3wIK0eep7Rzr
ABKsVoCo6DLSXSb6WJRLOaPbzwEAvjC46vxZoMAK8Z2LWJ2OEr7yA3vuvv7wMjPT
b+Mhlc1yeDGTKDXuGJotWUUZ67b3hh6iuFQqlDLaTirCeviUWSAFI0A/Lz1pxG5Q
b/SfqBMwhKu24Klo6IbL5uIK8khuwFG39MVhspCfI+0mGehsvlKUpwiW23r3JBal
XaMwkzZrwrP+PVouh88z+ZdTP+zsWQACEwDxgycF+TYXGGnYs69bgSVSa6JWjmIE
YqqfNdWmm6rtj6UC61y5OQJfsW3A98t7g53H6+KDzlThTJMyjloMWigft0eqdZ34
OKz87c6aZpXgI7zF15bZmm7mwZtJrcFETUjQlDdbl+gk4Yl34WM6peJFBAxEDwdc
khj/dM6onMtcb3S20Fo5YriYbx5edb+DnCJY23g/IjiYn2islDFPb/lfjLOlsJNl
B8E2QblauW7kVetKva9YotYP9fNzcYyzo17LC8SK2u3FG9dGksrCos1VVienJVQk
qlAe6dYpJi/d3gSFH7VEmoM7Z+HnVnHjOf2hVgdzpkuT+enw6i8=
=V5+7
-----END PGP SIGNATURE-----
--=-=-=--

--===============0987966376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0987966376==--
