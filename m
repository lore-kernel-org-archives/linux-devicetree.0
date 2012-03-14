From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] dtc: Add -i option to support search paths
Date: Wed, 14 Mar 2012 09:16:26 -0700
Message-ID: <CAPnjgZ3mXBwRmoS==kUXdeNL6p-eFfg9+pU=JmGvpZdRQSqusQ@mail.gmail.com>
References: <1331082612-10612-1-git-send-email-sjg@chromium.org>
 <20120312235332.GD24916@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120312235332.GD24916-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Mon, Mar 12, 2012 at 4:53 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Mar 06, 2012 at 05:10:12PM -0800, Simon Glass wrote:
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
>
> Looks pretty nice. =A0Include paths is a feature we've been kind of
> wanting for a bit, and this implementation looks reasonable. Obviously
> the fact that it's -i not -I like gcc isn't great, but as you say -I
> is already used, and I can't see a better option.

OK thanks.

>
> The only potential problem I can see is that it uses the same search
> path for /include/ and /incbin/. =A0I'm not sure if that's what we want
> or not.

Me neither, although it shouldn't hurt I think. I should at least
update the log message.

I will tidy up a few things and resend.

Regards,
Simon

>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
