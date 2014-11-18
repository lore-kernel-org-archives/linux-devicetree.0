From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC] Add of_path property for all devices with a node
Date: Tue, 18 Nov 2014 15:18:29 +0000
Message-ID: <CACxGe6vg8SxwCHZ8HxzLzimQOAf8Q81wd5eO=x2LavD4dv81Rw@mail.gmail.com>
References: <1415342031.4925.27.camel@kernel.crashing.org> <1415342117.4925.29.camel@kernel.crashing.org>
 <1415596626.5769.14.camel@kernel.crashing.org> <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 10, 2014 at 2:06 PM, Rob Herring <robherring2@gmail.com> wrote:
> Adding Grant.
>
> On Sun, Nov 9, 2014 at 11:17 PM, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
>> On Fri, 2014-11-07 at 17:35 +1100, Benjamin Herrenschmidt wrote:
>>> On Fri, 2014-11-07 at 17:33 +1100, Benjamin Herrenschmidt wrote:
>>>
>>> > So I came up with this patch,
>>>
>>> And here is the actual patch, which might help :-) It's pretty trivial
>>> and small...
>>
>> So not much reactions here .. a bit more on IRC, where Olof suggested
>> that rather than a file containing a path, we could use a symlink since
>> the devtree is now in sysfs, so we can do relative links.
>
> +1 on this. That was part of the motivation to move DT into sysfs.
>
> Rob

I had a patch that did exactly that. I wonder what happened to it...

But regardless, as Frank said in his reply, this data is already in
the uevent file for every device.

g.
