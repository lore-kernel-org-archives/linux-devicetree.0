From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH-RFC 6/7] drivers: of: ifdef out cmdline section
Date: Wed, 14 Oct 2015 12:57:16 -0500
Message-ID: <CAL_JsqJ97Utif+bZj39pi95qyc1kqdWX9r_cs7HO=y6mERQ5kw@mail.gmail.com>
References: <1444146434-12776-6-git-send-email-danielwa@cisco.com>
 <CAL_JsqLmVRdWZqxFRAZ-pgd225PGW8MNv4A47bcfD+cD_+K7rg@mail.gmail.com>
 <20151007162755.GA23283@fifo99.com> <CAL_JsqJwFeDGJ0cTYwikX7DAvR7SK=CL6Qxyp9oKFWeFMgZNiA@mail.gmail.com>
 <561D6603.4060006@cisco.com> <CAL_JsqK5qymGdMaayK61WKPw1-Ws9K+Lxi5w6rO2CEg08Aq60A@mail.gmail.com>
 <561E6B22.1030204@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <561E6B22.1030204@cisco.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Walker <danielwa@cisco.com>
Cc: Rob Herring <robh@kernel.org>, Daniel Walker <dwalker@fifo99.com>, xe-kernel@external.cisco.com, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 14, 2015 at 9:48 AM, Daniel Walker <danielwa@cisco.com> wrote:
>
>
> There's one last little wrinkle .. In the current setup the defconfig
> CONFIG_CMDLINE="" is used as a default in case the device tree has nothing
> in it. In my changes, there is no identical functionality. The only similar
> thing I have is the the CONFIG_CMDLINE_APPEND="" . The main difference is
> that in the current implementation CONFIG_CMDLINE="" doesn't get added at
> all if there is a device tree bootargs, but with my implementation this line
> would be added unconditionally. It would represent a subtle change where
> people would have to add into the DT bootargs something to override what
> might be in the default command line.

So CMDLINE_EXTEND would be equivalent to your version, but it looks
like CMDLINE_EXTEND is not used in the DT case. Perhaps you can add
the option? You already have OVERRIDE which is equivalent to FORCE.


> For example,
>
> if a config has CONFIG_CMDLINE_APPEND="debug" then they would have to add a
> "loglevel=7" into the DT bootargs to get back to normal. I wouldn't think
> people would want "debug" as the default, but oddly enough some of the
> configs do have this. Some of them also have default ip address setting,
> nfsroot= settings, and loglevel= settings.

Or they would have to remove the kernel default from their config.
That might be acceptable. You could have a case where you have 1
kernel binary and 2 different bootloaders where you expect the
bootloader's cmdline used in one case and the kernel's in the other.
Seems unlikely, but it would be an ABI break.

I would not judge people's choices of defaults making sense...

> What are your thoughts on this ? I think using the append type default makes
> more sense because it's actually setting up global defaults. The current
> complete replacement scheme seems to set the stage for people to make an
> entirely custom default for a single development machine, which IMO doesn't
> make sense. However, I'm not sure what the intent is with the current setup.

People will want a path to support up to the current 3 options (use
bootloader's cmdline, append bootloader cmdline to default, and force
kernel default) and you have to assume changing bootloader is not an
option.

Rob

>
> Daniel
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
