From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: Get HDMI version from device tree
Date: Tue, 08 Jan 2013 09:38:39 -0700
Message-ID: <50EC4B8F.1050802@wwwdotorg.org>
References: <1357591415-17092-1-git-send-email-seanpaul@chromium.org>
 <50EB4D11.7000407@wwwdotorg.org>
 <CAOw6vbKqVnDt7PH1JTtG1cujnfzNOeK-eHhebpX9WSytnhwmBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOw6vbKqVnDt7PH1JTtG1cujnfzNOeK-eHhebpX9WSytnhwmBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/07/2013 04:12 PM, Sean Paul wrote:
> 
> On Jan 7, 2013 5:32 PM, "Stephen Warren" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
> <mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> wrote:
>>
>> On 01/07/2013 01:43 PM, Sean Paul wrote:
>> > Add a property to the hdmi node so we can specify the HDMI version in
>> > the device tree instead of just defaulting to v1.4 with the existence of
>> > the dt node.
>>
>> > diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>>
>> > @@ -11,6 +11,8 @@ Required properties:
>> >       c) pin function mode.
>> >       d) optional flags and pull up/down.
>> >       e) drive strength.
>> > +- samsung,supports-hdmi-1.4: Define if device supports HDMI v1.4
>> > +- samsung,supports-hdmi-1.3: Define if device supports HDMI v1.3
>>
>> Which device; the HDMI controller in the SoC, or the HDMI sink?
>>
> 
> It's the controller.

Ah OK. Is it different versions of the controller HW IP block that
support the different HDMI versions, or is it some kind of
fusing/configuration with the same HW block? If different versions of
HW, wouldn't this difference usually be represented by different
compatible values, that indicate the exact HW version? I guess if the
only difference really is just the HDMI support and there are no other
bugs/quirks/enhancements, a separate property might make sense.
