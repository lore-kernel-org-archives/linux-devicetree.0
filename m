From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Modifying binding or duplicating compatible string
Date: Wed, 10 May 2017 14:46:43 +0200
Message-ID: <CACna6rwH3ZB-82MuE6-J+iqDCJq-B3=yePaiTcJroUtAAFtO-g@mail.gmail.com>
References: <591fbd1e-bee4-268f-045b-395d39228a3d@gmail.com> <CAL_JsqKx0KxJSMLPMr=c9yPuwTYaoOQ-acE4OntSXx=Q7BSjXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKx0KxJSMLPMr=c9yPuwTYaoOQ-acE4OntSXx=Q7BSjXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10 May 2017 at 14:32, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> I mean to clean up this situation. My question is: is this acceptable to
>> support the same compatible string in two contexts?
>
> Depends on the context. ;) I think here it would be fine because you
> have differing buses.
>
>> 1) For backward compatibility the first one would require specifying bot=
h:
>>    ccb-mii / MDIO register and DMP register.
>
> You don't need both in the DT. New DT and old OS is not a combination
> we worry about. You either have the old binding or new one in the DT.
> It's the driver that would need to probe the old way (presumably as a
> platform device) and the new way as an mdio device.
>
> You can decide whether you need to support the old way or not. Depends
> on who it would affect for your platform.

Thank you for the help! I'll proceed with that.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
