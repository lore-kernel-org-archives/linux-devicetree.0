From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6] pstore/ram: Add ramoops support for the Flattened
 Device Tree.
Date: Tue, 5 Jan 2016 17:06:17 -0800
Message-ID: <CAGXu5jKpfN5VycKgGJhxC1DuRkC8D1D2putTGz4MaB9MLpaiNg@mail.gmail.com>
References: <1347042576-17675-1-git-send-email-bfreed@chromium.org>
	<20120908052907.GA4724@lizard>
	<20120917062302.GA768@lizard>
	<CAL_JsqK_L9nN6+oxUQzNwFjbFf3+3NroeEwzbMdPS4T6=Mnemg@mail.gmail.com>
	<20130407174313.GA7168@lizard>
	<CAEYUcX0rQKDGD3_pbc7JnDO6WJ_QMd8AWW+X1giNVL313wODyA@mail.gmail.com>
	<20130414142441.GA3619@teo>
	<CAGXu5jJVmz+tZWEAqEezPDEA7i4Tcp7OfZtux9rs0bpQCCxDfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jJVmz+tZWEAqEezPDEA7i4Tcp7OfZtux9rs0bpQCCxDfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Cc: Bryan Freed <bfreed-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Marco Stornelli <marco.stornelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[fixing devicetree mailing list]

On Tue, Jan 5, 2016 at 5:04 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> [thread necromancy, if you don't have the thread locally, it's here:
> https://patchwork.kernel.org/patch/1426261/]
>
> We still need to solve this, and John pinged me about it today. Where
> does this stand?
>
> -Kees
>
>
> On Sun, Apr 14, 2013 at 7:24 AM, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, Apr 08, 2013 at 12:54:01PM -0700, Bryan Freed wrote:
>> [...]
>>> And as a more general question, why should we try not to put
>>> configuration in the device tree?  It seems like a great (and
>>> portable) place to put this stuff.
>>> It certainly seems better to have it there than hardwired in the
>>> kernel or tacked onto the kernel command line.
>>
>> But then we have two in-kernel APIs to pass kernel parameters? So we'll
>> have to maintain two ways of passing the options for each driver. That is
>> hardly a good solution.
>>
>> If you would like to see a convenient way to pass kernel/module options
>> via the device tree, I would suggest implementing something like this:
>>
>> chosen {
>>         kernel-options {
>>                 linux,pstore.record-size = 123;
>>                 linux,foo = "bar";
>>         };
>> };
>>
>> And then let the kernel translate all these to module_param_*().
>>
>> I am still not sure about placing the options along with devices layout,
>> but if we go this route, then that is also viable:
>>
>> pstore-node {
>>         linux,pstore.record-size = 123;
>> };
>>
>> And translate "linux,*" this to module_param_*().
>>
>> How does that sound?
>>
>> Thanks,
>> Anton
>
>
>
> --
> Kees Cook
> Chrome OS & Brillo Security



-- 
Kees Cook
Chrome OS & Brillo Security
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
