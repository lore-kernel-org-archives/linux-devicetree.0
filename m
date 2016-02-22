From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/1] of/overlay: of overlay callbacks
Date: Mon, 22 Feb 2016 17:38:19 +0200
Message-ID: <6F671B0F-4F94-47F0-9CA2-04E6F905F20A@konsulko.com>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com> <1455730885-1514-2-git-send-email-atull@opensource.altera.com> <20160222025517.GS15973@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160222025517.GS15973@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Feb 22, 2016, at 04:55 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>=20
> On Wed, Feb 17, 2016 at 11:41:25AM -0600, Alan Tull wrote:
>> Add overlay callback functionality.
>>=20
>> When DT overlays are being added, some drivers/subsystems
>> will want to know about the changes before they go into the
>> live tree.  Similarly there is a need for post-remove
>> callbacks.
>>=20
>> Each handler is registered with a of_device_id.  When
>> an overlay target matches a handler's id, the handler
>> gets called.
>>=20
>> The following 4 cases are handled: pre-apply, post-apply,
>> pre-remove, and post-remove.
>=20
> So I know I suggested maybe not using notifiers, but this ends up jus=
t=20
> looking like notifiers, so we might as well use them unless we someho=
w=20
> change the flow. You would just need to add pre-apply and pre-remove=20
> in of_attach_node and of_detach_node, right?
>=20


I agree those look just like notifiers. We could just update the notifi=
er
logic to handle this case.

Am I missing something else?


> Rob

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
