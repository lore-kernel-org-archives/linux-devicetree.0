From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/overlay: Directly include idr.h
Date: Fri, 13 Mar 2015 10:25:37 -0500
Message-ID: <CAL_JsqJMrkqFpKAEJ3zdiSJQFupGE44OE=bALAMJyq5FL3L3hA@mail.gmail.com>
References: <1424140618-22987-1-git-send-email-broonie@kernel.org>
 <56CDBF0A-4E66-406D-9086-7C0128FEC6C7@konsulko.com> <20150217093351.GT9110@finisterre.sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150217093351.GT9110-bheZrs9scGb3/WHNxyQH9YN0K6Il/+VY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 17, 2015 at 3:33 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Feb 17, 2015 at 11:15:28AM +0200, Pantelis Antoniou wrote:
>> > providing the interface, instead relying on an implicit inclusion. Make
>> > the dependency implict to avoid potential future build issues if the
>
> s/implicit/explicit/

Applied with fixup for 4.0. Thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
