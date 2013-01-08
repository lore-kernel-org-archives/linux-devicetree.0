From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: Get HDMI version from device tree
Date: Tue, 8 Jan 2013 11:48:44 -0500
Message-ID: <CAOw6vbLYZgAj6Rco1qDQUhqVs1b10fBL9F0Vq0LBUBo14KJLrQ@mail.gmail.com>
References: <1357591415-17092-1-git-send-email-seanpaul@chromium.org>
 <50EB3604.60209@firmworks.com>
 <CAOw6vbJc2iV-u1v-Oc3_HUjyq4JukaOdWZ9+mA8RGeFbBpirpA@mail.gmail.com>
 <1357663554.2884.15.camel@astat>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357663554.2884.15.camel@astat>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 8, 2013 at 11:45 AM, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> Am Montag, den 07.01.2013, 16:12 -0500 schrieb Sean Paul:
>> On Mon, Jan 7, 2013 at 3:54 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
>> > On 1/7/2013 10:43 AM, Sean Paul wrote:
>> >> Add a property to the hdmi node so we can specify the HDMI version in
>> >> the device tree instead of just defaulting to v1.4 with the existence of
>> >> the dt node.
>> >>
>> >> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> ---
>> >>  .../devicetree/bindings/drm/exynos/hdmi.txt        |    3 +++
>> >>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   19 ++++++++++---------
>> >>  2 files changed, 13 insertions(+), 9 deletions(-)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>> >> index 589edee..d1c7d91 100644
>> >> --- a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>> >> +++ b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>> >> @@ -11,6 +11,8 @@ Required properties:
>> >>       c) pin function mode.
>> >>       d) optional flags and pull up/down.
>> >>       e) drive strength.
>> >> +- samsung,supports-hdmi-1.4: Define if device supports HDMI v1.4
>> >> +- samsung,supports-hdmi-1.3: Define if device supports HDMI v1.3
>> >
>> > a) This seems pretty generic, not at all samsung-specific, as the HDMI
>> > version numbering space is well-defined by the HDMI spec.
>> >
>> > b) It would be better to make it an integer property whose value
>> > encodes the version number, thus eliminating the need to add new
>> > properties as new HDMI versions appear.
>> >
>>
>> Thanks for the quick review, Mitch.
>>
>> How about:
>>
>> - hdmi-version: 0=v1.3, 1=v1.4
> Why bother obfuscating the real version number? Why not just 13=v1.3,
> 14=v1.4?
>

Sure, that sounds good to me.

Sean

> Regards,
> Lucas
>
>
