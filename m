From: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT
 binding document
Date: Tue, 1 Sep 2015 10:35:44 -0700
Message-ID: <CA+bK7J4x2vY-tzUFWjM9KFMtvE+qW6jzmz=ZxWU9L8Mpe8Lduw@mail.gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
	<1440739433-6799-3-git-send-email-mporter@konsulko.com>
	<CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 7:53 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
...
>> +example:
>> +  - dts: |
>> +      sk11@0 {
>> +              compatible = "skel,sk11";
>> +              reg = <0>;
>> +              spi-max-frequency = <1000000>;
>> +              spi-cs-high;
>> +      };
>
> At least in this example, we could generate it. Examples are nice, but
> we have dts files full of examples already. I get a fair number of
> "fix the example" patches, so maybe we should eliminate the simple
> ones.

I would hesitate to eliminate examples.  I've been saved by them on
a few occasions, when the dts files only had one or two instances
of a type of binding, somewhat different from each other, and the example helped
break the tie.  If there's something wrong with the example, it's a sign
of an out-of-date binding doc, just as much as if the text were wrong.
It ought to be possible to validate the example versus the binding doc
(as Pantelis says), so ultimately we should be able to catch errors here
as well.
 -- Tim
