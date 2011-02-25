From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] olpc_battery: bind to device tree
Date: Fri, 25 Feb 2011 08:33:44 -0700
Message-ID: <AANLkTimpWxEvQ1wgQzZ2RRA=0s_hEmKFAyz1bVr8nKai@mail.gmail.com>
References: <20110219150644.681D59D401D@zog.reactivated.net>
	<AANLkTi=29myerzgH6WRCSOPKpaDnGgEtQacVHvxRoQT_@mail.gmail.com>
	<AANLkTi=2a=9=k+ZG46yqKOaHd9tCkJVm4QRxGmgbRzsv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=2a=9=k+ZG46yqKOaHd9tCkJVm4QRxGmgbRzsv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 25, 2011 at 7:19 AM, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org> wrote:
> On 23 February 2011 20:34, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> As mentioned in the other thread, matching by name is strongly
>> discouraged. =A0It isn't very accurate and compatible is the preferred
>> method for binding devices. =A0'battery' in particular is highly
>> non-specific.
>>
>> I do understand that you don't have a compatible property in the
>> current firmware, and to a certain extent we have to live with what
>> we're given by the kernel. =A0However, I think it would be better in the
>> OLPC case to find the battery node and add a compatible property
>> before registering a platform_device for it. =A0(or use a bus notifier
>> to tell you when it is registered, and add 'compatible' at that
>> point.) =A0That way we the uncertainty is taken care of in the board
>> support code without polluting the driver matching namespace.
>
> Thanks for the review. This and the rest of your feedback makes sense.
>
> Would you mind commenting on exactly how this should look?

Before calling of_platform_bus_probe(), search the device tree for the
battery node and use prom_add_property() to add a compatible prop.

>
> Here are the changes i'm planning to make, both to the firmware and
> with kernel code as you suggest to fixup device trees for systems with
> old firmware:
>
> /battery@0/compatible property added with value "olpc-battery" (XO-1 and =
XO-1.5)
> /pci/isa@f/rtc@i70/compatible property prepended with "olpc-xo1-rtc,"
> (XO-1 only)
> /pci/display@1,1/dcon device added, name=3Ddcon compatible=3Dolpc-dcon
> (XO-1 and XO-1.5)

Compatible properties should generally be in the form:
"<vendor>,<part>".  So these should probably be:

battery:  compatible =3D "olpc,xo1-battery";
rtc: compatible =3D "olpc,xo1-rtc";
dcon: compatible =3D "olpc,xo1-dcon";

I would explicitly specify the "xo1-" part in all three to protect
against the eventuality of a new xo revision that has does something
incompatible.  ie. "olpc-battery" doesn't help if, say, XO-1.75 has a
different battery.  Newer configurations can claim compatibility with
the old if they are truly compatible.

>
> In addition to the battery patch you reviewed, we plan to make the
> olpc-rtc and DCON drivers bind to device tree nodes, which is the
> reason behind the other changes.

okay.

g.
