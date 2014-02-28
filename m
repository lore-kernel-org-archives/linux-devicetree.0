From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checkpatch: fix spurious vendor compatible warnings
Date: Thu, 27 Feb 2014 19:24:14 -0600
Message-ID: <CAL_JsqLnMyHGsv7L64FxooH0jaRjjF8uE=d=n6C84+hYB+ryVQ@mail.gmail.com>
References: <1393531019-25134-1-git-send-email-florian.vaussard@epfl.ch>
	<1393531808.24588.119.camel@joe-AO722>
	<530F9F03.40803@epfl.ch>
	<1393545229.24588.147.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393545229.24588.147.camel@joe-AO722>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 5:53 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Thu, 2014-02-27 at 21:24 +0100, Florian Vaussard wrote:
>> On 02/27/2014 09:10 PM, Joe Perches wrote:
>> > On Thu, 2014-02-27 at 20:56 +0100, Florian Vaussard wrote:
>> >> With a compatible string like
>> >> compatible = "foo";
>> >> checkpatch will currently try to find "foo" in  vendor-prefixes.txt,
>> >> which is wrong since the vendor prefix is empty in this specific case.
> []
>> > Some vendor names have dashes.
>> > I don't know if underscores are allowed.
>> >
>> > $ grep -rP --include=*.[ch] -oh "compatible\s*=\s*\"[^,]+,\w" * | \
>> >   sed -r -e 's/\s//g' -e 's/,.$//' | sort | uniq -c | grep "[_-]"
>> >       1 compatible="active-semi
>> >       8 compatible="asahi-kasei
> []
>> In ePAPR v1.1, I could not find any strict requirement. It
>> is just saying:
>>
>> The recommended format is "manufacturer,model", where manufacturer is a
>> string describing the name of the manufacturer (such as a stock ticker
>> symbol), and model specifies the model number.
>
> Should there also be a check in .c and .h files for
>         .compatible = "somestring"

Ideally, yes. I didn't do that because I figured there would be too
many variations in formatting compared to dts files.

> and
>         OF_DEV_AUXDATA("somestring",,,,)

Probably not. OF_DEV_AUXDATA is hopefully temporary. There are 156
instances now and it looks like they've been going down since 3.8.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
