From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Tue, 2 Jul 2013 12:54:41 -0600
Message-ID: <CAMLZHHSU1OVrQrtucTNn4AmTCiNER19njvQdomxTcXAzqxCi4A@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702184305.GB13924@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130702184305.GB13924-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
To: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: =?ISO-8859-1?Q?Jean=2DFran=E7ois_Moine?= <moinejf-GANU6spQydw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 2, 2013 at 12:43 PM, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> I will point out that relying on driver probing orders has already been
> stated by driver model people to be unsafe.  This is why I will not
> adopt such a solution for my driver; it is a bad design.

Just to clarify, what you're objecting to is effectively the
following? Because it is not guaranteed in the future that the probe
order will be the same as the platform_driver_register() calls?

static int __init exynos_drm_init(void)
{
ret = platform_driver_register(&hdmi_driver);
if (ret < 0)
goto out_hdmi;
ret = platform_driver_register(&mixer_driver);
if (ret < 0)
goto out_mixer;
ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
if (ret < 0)
goto out_common_hdmi;
ret = platform_driver_register(&exynos_drm_platform_driver);
if (ret < 0)
goto out_drm;

(exynos_drm_platform_driver is the driver that creates the drm_device)

Thanks
Daniel
