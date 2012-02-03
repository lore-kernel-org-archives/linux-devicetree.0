From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 08/18] tegra: fdt: Add additional USB binding
Date: Fri, 3 Feb 2012 08:58:32 -0800
Message-ID: <CAPnjgZ19iT1O=TCsgQC5z9bM8rmVcex3PtsjhtJTguRL4ccQrA@mail.gmail.com>
References: <1327447272-30182-1-git-send-email-sjg@chromium.org>
 <1327447272-30182-9-git-send-email-sjg@chromium.org>
 <4F2B063B.2020403@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F2B063B.2020403-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, Feb 2, 2012 at 1:55 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 01/24/2012 04:21 PM, Simon Glass wrote:
>> This adds a property to indicate a port which can switch between host an=
d device
>> mode.
> ...
>> diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tre=
e-bindings/usb/tegra-usb.txt
> ...
>> +Optional properties:
> ...
>> + =A0- nvidia,has-legacy-mode : boolean indicates whether this controlle=
r can
>> + =A0 =A0operate in legacy mode (as APX 2500 / 2600). In legacy mode some
>> + =A0 =A0registers are accessed through the APB_MISC base address instea=
d of
>> + =A0 =A0the USB controller.
>
> I was hoping to represent this as a different compatible value, in the
> same way as one of Tegra's I2C controllers is, eg. nvidia,tegra20-ehci
> and nvidia,tegra20-ehci-legacy.
>
> However, I suppose representing this using a property is OK too.

I prefer this because this is a legacy issue, and I feel that creating
a different compatible node when no one actually uses legacy mode is
an unnecessary complexity.

>
> Either way, can you please also push this patch to the Linux kernel (and
> the associated changes to tegra*.dtsi) in order to run it past the other
> Tegra maintainers before committing to it within U-Boot.

OK I have done this.

>
> Thanks.
>
> --
> nvpublic

Regards,
Simon
