From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] Add documentation for tca6507 devicetree bindings.
Date: Wed, 14 Nov 2012 14:50:07 -0800
Message-ID: <CAK5ve-KbZJJHSrL8vuAwU2C1DQ4tTD8DwC2=4N830iALv-a9EA@mail.gmail.com>
References: <1352755511-28436-1-git-send-email-marek.belisko@open-nandra.com>
 <1352755511-28436-2-git-send-email-marek.belisko@open-nandra.com>
 <CAK5ve-L=SBFEfoY8oKYYb-dFCWf=-Eb-qMFdWdiBO3wfaR3tDA@mail.gmail.com>
 <50A3F06F.20809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50A3F06F.20809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marek Belisko <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2012 at 11:26 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 11/13/2012 06:05 PM, Bryan Wu wrote:
>> It looks fine to me, but I need a DT maintainer's ack. Stephen, could
>> you help on this. I will merge this patch via my tree.
>
> I'm not actually a DT maintainer; I CC'd Grant and Rob.

Sure, thanks for this.

> Marek probably wants to repost the whole patch to them. Comments below.
>
>>> diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Documentation/devicetree/bindings/leds/tca6507.txt
> ...
>>> +LED sub-node properties:
> ...
>>> +  string defining the trigger assigned to the LED.  Current triggers are:
>>> +    "backlight" - LED will act as a back-light, controlled by the framebuffer
>>> +                 system
>>> +    "default-on" - LED will turn on
>>> +    "heartbeat" - LED "double" flashes at a load average based rate
>>> +    "ide-disk" - LED indicates disk activity
>>> +    "timer" - LED flashes at a fixed, configurable rate
>
> It would be useful to point at a single canonical document that
> describes the triggers, rather than duplicating the list into every binding.
>

Yeah, actually I saw several leds related DT binding txt are similar
and probably based on Documentation/devicetree/bindings/gpio/led.txt.
It's good to have a common one. Marek, are you going to do this? Thanks.

> Aside from that, I think this looks reasonable.
>
> Oh, looking at Documentation/devicetree/bindings/gpio/led.txt, should a
> default-state property be supported?

I'm not sure about this for ti,tca6507 and it really depends on the
driver implementation. But we can add this later.

-Bryan
