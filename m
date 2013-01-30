From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] drm/exynos: Get HDMI version from device tree
Date: Wed, 30 Jan 2013 14:40:55 +0900
Message-ID: <CAAQKjZNqM392NqCAd0GodnVG=t44ZDWhoiwrvwsweG1A3JO22w@mail.gmail.com>
References: <50EC5EDE.3030208@firmworks.com>
 <1357676181-16728-1-git-send-email-seanpaul@chromium.org>
 <50ECA400.50007@wwwdotorg.org>
 <CAOw6vbK_wJupFt0CG6Bw5y0=Wq4qAJ0HvMSATgyOt+fK+tqR6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOw6vbK_wJupFt0CG6Bw5y0=Wq4qAJ0HvMSATgyOt+fK+tqR6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

2013/1/30 Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>:
> On Tue, Jan 8, 2013 at 5:56 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 01/08/2013 01:16 PM, Sean Paul wrote:
>>> Add a property to the hdmi node so we can specify the HDMI version in
>>> the device tree instead of just defaulting to v1.4 with the existence of
>>> the dt node.
>>
>> I guess this seems OK to me if required, although I'd certainly like to
>> see someone familiar with the Exynos HW confirm whether this should be
>> driven purely by DT compatible value for the HDMI IP block instead though.
>
> +inki
>
> Inki, does this seem reasonable to you?
>

Looks good to me. At least it's better than old one. I'll apply it if
there is no any opinion. And one more thing, Exynos hdmi controller
has no version info register so we need such thing. But in case of
Mixer controller, it has the version info register so we could support
all mixer controllers of Exynos SoC checking that register. So if you
are planning on such thing for Mixer also then I'd recommend you to
consider checking that register.

Thanks,
Inki Dae

>
> Sean
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
