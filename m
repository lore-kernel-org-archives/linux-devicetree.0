From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC] Add of_path property for all devices with a node
Date: Mon, 10 Nov 2014 08:06:35 -0600
Message-ID: <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
References: <1415342031.4925.27.camel@kernel.crashing.org> <1415342117.4925.29.camel@kernel.crashing.org>
 <1415596626.5769.14.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415596626.5769.14.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Adding Grant.

On Sun, Nov 9, 2014 at 11:17 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2014-11-07 at 17:35 +1100, Benjamin Herrenschmidt wrote:
>> On Fri, 2014-11-07 at 17:33 +1100, Benjamin Herrenschmidt wrote:
>>
>> > So I came up with this patch,
>>
>> And here is the actual patch, which might help :-) It's pretty trivial
>> and small...
>
> So not much reactions here .. a bit more on IRC, where Olof suggested
> that rather than a file containing a path, we could use a symlink since
> the devtree is now in sysfs, so we can do relative links.

+1 on this. That was part of the motivation to move DT into sysfs.

Rob

> That means keeping the legacy "devspec" files in the few places where
> they exist, possibly behind a deprecated-default-y config option (though
> we might never be able to deprecate them...), but there aren't many.
>
> Any preference either way ?
>
> Cheers,
> Ben.
>
>
