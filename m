From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] checkpatch: add DT compatible string documentation check
Date: Tue, 26 Nov 2013 11:11:26 -0600
Message-ID: <CAL_JsqKgUQZT4g3fgPe-h8G-zWb1gnfxgT20BDrL+zS5u4URzg@mail.gmail.com>
References: <1385481675-26675-1-git-send-email-robherring2@gmail.com>
	<1385484225.20100.58.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385484225.20100.58.camel@joe-AO722>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 26, 2013 at 10:43 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Tue, 2013-11-26 at 10:01 -0600, Rob Herring wrote:
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> Hi Rob.
>
>> This adds a simple check that any compatible strings in DeviceTree dts
>> files are present in Documentation/devicetree/bindings. This should be a
>> temporary check until we have more sophisticated binding schema checking.
> []
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -2034,6 +2034,21 @@ sub process {
>>                            "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
>>               }
>>
>> +# check for compatible documentation
>> +             if ($realfile =~ /\.dts/ && $rawline =~ /\+\s*compatible\s*=/) {
>> +                     my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,]+)\"/g;
>
> I believe there needs to be a \+\. in the brackets
> for lines like:
>
> arch/c6x/boot/dts/tms320c6678.dtsi: compatible = "ti,c64x+timer64";

I think we don't really want '+' (or '_') in compatible strings. That
would really a check against the documentation versus whether the dts
matches the documentation. So I probably should add a separate check
on use of documented, but deprecated compatible strings. Ideally, that
check would be on the binding doc, but since they are unstructured
currently, we'd have to do it on dts files.

> and
> arch/powerpc/boot/dts/mpc8313erdb.dts: compatible = "fsl,sec2.2", "fsl,sec2.1",

Yes, indeed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
