From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/5] of/fdt: only store the device node basename in full_name
Date: Tue, 28 Nov 2017 07:26:13 -0600
Message-ID: <CAL_Jsq+kCA8QvdfU97TDcprfR3XuGj2WWO_mwiUSNr3D+WbU7g@mail.gmail.com>
References: <20170821151651.25096-1-robh@kernel.org> <20170821151651.25096-6-robh@kernel.org>
 <CAMuHMdU-qQWmDi=V-G=r=poQf-F9hqL2SmoKi+SZyUwEj5vBGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdU-qQWmDi=V-G=r=poQf-F9hqL2SmoKi+SZyUwEj5vBGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, David Laight <David.Laight-JxhZ9S5GRejQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 28, 2017 at 7:13 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Rob,
>
> On Mon, Aug 21, 2017 at 5:16 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> With dependencies on a statically allocated full path name converted to
>> use %pOF format specifier, we can store just the basename of node, and
>> the unflattening of the FDT can be simplified.
>>
>> This commit will affect the remaining users of full_name. After
>> analyzing these users, the remaining cases should only change some print
>> messages. The main users of full_name are providing a name for struct
>> resource. The resource names shouldn't be important other than providing
>> /proc/iomem names.
>
> I guess the plan is to get rid in a subsequent step of all calls to kbasename()
> on a full name, which is now futile?

No. Sparc (PDT) is still the full path and I don't plan to change that.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
