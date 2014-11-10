From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC] Add of_path property for all devices with a node
Date: Tue, 11 Nov 2014 09:48:42 +1100
Message-ID: <1415659722.5769.32.camel@kernel.crashing.org>
References: <1415342031.4925.27.camel@kernel.crashing.org>
	 <1415342117.4925.29.camel@kernel.crashing.org>
	 <1415596626.5769.14.camel@kernel.crashing.org>
	 <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-11-10 at 08:06 -0600, Rob Herring wrote:
> Adding Grant.

Oh, I forgot him ? oops...

> > So not much reactions here .. a bit more on IRC, where Olof suggested
> > that rather than a file containing a path, we could use a symlink since
> > the devtree is now in sysfs, so we can do relative links.
> 
> +1 on this. That was part of the motivation to move DT into sysfs.

Yes, I like this too. I'll give it a go some time this week (I'm off for
a day or two) unless somebody beats me to it.

Cheers,
Ben.

> Rob
> 
> > That means keeping the legacy "devspec" files in the few places where
> > they exist, possibly behind a deprecated-default-y config option (though
> > we might never be able to deprecate them...), but there aren't many.
> >
> > Any preference either way ?
> >
> > Cheers,
> > Ben.
> >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
