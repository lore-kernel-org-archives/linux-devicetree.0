From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] dtc: Add -i option to support search paths
Date: Mon, 12 Mar 2012 10:13:36 -0700
Message-ID: <CAPnjgZ25BdFBdr4sH8CeFgC3Oyd+hhJ+DNk9yY6E42c1WWGnfA@mail.gmail.com>
References: <1331082612-10612-1-git-send-email-sjg@chromium.org>
 <E1S75hq-0005Wi-Jb@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1S75hq-0005Wi-Jb-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jon,

On Mon, Mar 12, 2012 at 6:54 AM, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>> It is often inconvenient to place device tree files in the same directory
>> as their includes, or to specify the full path to include files.
>>
>> An example of this is in U-Boot where we have a .dtsi file for each SOC
>> type, and this is included by the board .dts file. We need to either use
>> a mechanism like:
>>
>> /include/ ARCH_CPU_DTS
>>
>> with sed or cpp to perform the replacement with the correct path, or
>> we must specify the full path in the file:
>>
>> /include/ "../../arch/arm/dts/tegra20.dtsi"
>>
>> The first option is not desirable since it requires anyone compiling the
>> file to first pre-process it. The second is not desirable since it
>> introduces a path which is project-specific into a file which is supposed
>> to be a hardware description. For example Linux and U-Boot are unlikely =
to
>> put these include files in the same place.
>>
>> It is much more convenient to specify the search patch on the command li=
ne
>> as is done with C pre-processors, for example.
>>
>> Introduce a -i option to add to the list of search paths used to find
>> source and include files.
>>
>> We cannot use -I as it is already in use. Other suggestions welcome.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Any comments here? =A0I'm inclined to aply it as is.

My main concern is to make sure that -i is the best choice for this.
So it would be good to have thoughts on that at least.

Apart from that, I will send a new patch which adds one more test and
fixes a typo.

Regards,
Simon

>
> Thanks,
> jdl
