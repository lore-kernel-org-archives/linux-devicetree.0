From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] drm/exynos: Get HDMI version from device tree
Date: Thu, 31 Jan 2013 10:16:51 +0900
Message-ID: <CAAQKjZNR8EJ+UFRO3vgYLH9So_gHn0a8gAf1JKu250shGiJ4qQ@mail.gmail.com>
References: <50EC5EDE.3030208@firmworks.com>
 <1357676181-16728-1-git-send-email-seanpaul@chromium.org>
 <50ECA400.50007@wwwdotorg.org> <51082B6A.1010406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51082B6A.1010406-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013/1/30 Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi,
>
>
> On 01/08/2013 11:56 PM, Stephen Warren wrote:
>>
>> On 01/08/2013 01:16 PM, Sean Paul wrote:
>>>
>>> Add a property to the hdmi node so we can specify the HDMI version in
>>> the device tree instead of just defaulting to v1.4 with the existence of
>>> the dt node.
>>
>>
>> I guess this seems OK to me if required, although I'd certainly like to
>> see someone familiar with the Exynos HW confirm whether this should be
>> driven purely by DT compatible value for the HDMI IP block instead though.
>
>
> I think the supported HDMI standard is something that could well be derived
> from the compatible property. The IP supporting v1.3 and v1.4 will be
> significantly different, so this would anyway already need to be reflected
> in the compatible property. The only issue I see here is that people tend
> to make the compatible string overly generic, so it is hardly usable for
> anything but matching an IP with its driver. For instance for exynos5 we
> have now (Documentation/devicetree/bindings/drm/exynos/hdmi.txt):
>
>         compatible = "samsung,exynos5-hdmi";
>
> For Exynos4 series there were already some patches proposed [1], but I
> believe
> this isn't a clean solution. Instead of things like:
>
> compatible = "samsung,exynos4-hdmi13";
> compatible = "samsung,exynos4-hdmi14";
>
> I would much more like to see the SoC version embedded in the compatible
> string, e.g.
>

Hi Sylwester. long time no see.

I think that if we use the SoC version embedded in the compatible
string then each driver shoud aware of the ip version to the SoC to
use version specific feature so I think it's better to use it without
the SoC version embedded in the compatible string like this,
compatible = "samsung,exynos4-hdmi"
version = "0x104" or "0x103"

With this, all each driver to do  is to check version property and set
version specific feature properly. And we have some dtsi file to can
be used commonly.

For example,
exynos4.dtsi : have all Exynos4 series SoCs common properties and also
use common compatible string.
exynos4412.dtsi, exynos4212.dtsi and so on: have Exynos42xx specific
properties. So the hdmi version string could be used here as "version
= "0x104" or "0x103"
exynos4412-board.dts: have board specific properties.

compatible = "samsung,exynos5-hdmi" is reasonable to me.
any opinions?

> compatible = "samsung,exynos4210-hdmi"; /* among others it carries an
>                                           information this IP supports
>                                           HDMI v1.3 */
>
> compatible = "samsung,exynos4212-hdmi"; /* HDMI v1.4, IIRC */
>
> [1] http://www.spinics.net/lists/linux-samsung-soc/msg15289.html
>
> --
>
> Thanks,
> Sylwester
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
