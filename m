From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: palmas: model SMPS10 as two regulators
Date: Fri, 21 Jun 2013 19:30:26 +0530
Message-ID: <51C45C7A.5000509@ti.com>
References: <1371717458-10307-1-git-send-email-kishon@ti.com>
 <1371717458-10307-3-git-send-email-kishon@ti.com>
 <51C2DEEB.9090600@nvidia.com> <51C3089F.5030003@ti.com>
 <51C30B95.4010406@nvidia.com> <51C30F60.3060100@ti.com>
 <51C31537.9030705@nvidia.com> <51C31F30.5000307@ti.com>
 <51C45448.4080201@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C45448.4080201-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 21 June 2013 06:55 PM, Laxman Dewangan wrote:
> On Thursday 20 June 2013 08:56 PM, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Thursday 20 June 2013 08:14 PM, Laxman Dewangan wrote:
>>>
>>> Have you added the regulator supply entries?
>>> Are you testing on mainline linux-next?
>> Not in linux-next :-( Tested only with mainline.
>> Does inverting the order helps?
>>
>
> I think because you do not have entry of supply in your dt node, it gets
> ignored by regulator_dev_lookup() and continue.
>
> I made the entry like (added entry form smps10-out2-supply and smps10-in-supply
> in dt node) and then it failed.
> /***
>
> +                           smps10-out2-supply = <&palmas_smps10_out2_reg>;
> +                           smps10-in-supply = <&tps65090_dcdc3_reg>;
>                              ldo3-in-supply = <&palmas_smps3_reg>;
> @@ -903,6 +905,20 @@
>                                          regulator-always-on;
>                                  };
>
> +                               palmas_smps10_out1_reg: smps10_out1 {
> +                                       regulator-name = "smps10_out1";
> +                                       regulator-min-microvolt = <5000000>;
> +                                       regulator-max-microvolt = <5000000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               palmas_smps10_out2_reg: smps10_out2 {
> +                                       regulator-name = "smps10_out2";
> +                                       regulator-min-microvolt = <5000000>;
> +                                       regulator-max-microvolt = <5000000>;
> +                                       regulator-always-on;
> +                               };
> +
> **/
>
>
> After reversing the sequence, it worked fine.

You mean, changing the order in dt node helped?

Thanks
Kishon
