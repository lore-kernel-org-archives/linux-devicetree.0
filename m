From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] of: overlay: Pick up label symbols from overlays.
Date: Tue, 10 May 2016 09:23:43 -0500
Message-ID: <CAL_JsqJkX9fs0a_Xcqm6He04_43UBDjVevnYEDrgJ2hBis_g=A@mail.gmail.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462817488-8370-4-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqLVnQ12AS-2CNfsf5PsyGvELrMjDDGfRcv7opijgJkGdw@mail.gmail.com> <2B34FBA8-A9DB-4DB5-BF95-4FE752EAF128@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2B34FBA8-A9DB-4DB5-BF95-4FE752EAF128-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2016 at 8:56 AM, Pantelis Antoniou
<panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> Hi Rob,
>
>> On May 10, 2016, at 00:47 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>
>> On Mon, May 9, 2016 at 1:11 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Insert overlay symbols to the base tree when applied.
>>> This makes it possible to apply an overlay that references a label
>>> that a previously inserted overlay had.

[...]

>>> +       /* locate the symbols & fixups nodes on resolve */
>>> +       for_each_child_of_node(tree, child) {
>>> +               if (of_node_cmp(child->name, "__symbols__") =3D=3D =
0)
>>> +                       goto found;
>>
>> Doesn't of_get_child_by_name work here?
>>
>
> No, we=E2=80=99re holding of_mutex.

So. Go look at the function.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
