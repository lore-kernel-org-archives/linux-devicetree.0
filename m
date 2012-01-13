From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v2 3/7] tegra: fdt: Add extra I2C bindings for
 U-Boot
Date: Fri, 13 Jan 2012 07:02:44 -0800
Message-ID: <CAPnjgZ0OsvqNJdxCCJLyrqfnO1ruCZo1d=0M38UumwW2FiUk1A@mail.gmail.com>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
 <1326394818-32227-4-git-send-email-sjg@chromium.org>
 <4F0FCFBB.3070407@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F0FCFBB.3070407-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: hs-ynQEQJNshbs@public.gmane.org
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Thu, Jan 12, 2012 at 10:31 PM, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org> wrote:
> Hello Simon,
>
> Simon Glass wrote:
>> Add U-Boot's peripheral clock information to the Tegra20 device tree fil=
e.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes in v2:
>> - Adjust definitions to fit new peripheral clock bindings
>> - Change 'speed' to 'clock-frequency'
>> - Remove u-boot,pinmux binding (sadly)
>>
>> =A0arch/arm/dts/tegra20.dtsi | =A0 10 +++++++++-
>
> Hmm.. we have no such a directory in the u-boot source tree ... ?
> I think, this patch is for the linux tree?

No, it's for a future U-Boot :-) It builds on USB series (which brings
in the basic device tree file).

Regards,
Simon

>
> [...]
>
> bye,
> Heiko
> --
> DENX Software Engineering GmbH, =A0 =A0 MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
