From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4 0/1] pstore/ram: add Device Tree bindings
Date: Tue, 14 Jun 2016 21:40:47 -0700
Message-ID: <CAGXu5jJG6-QS9Z75Px-0ZF8A222OPtHq8Hc8QYFu6vZGAoOeVA@mail.gmail.com>
References: <1465599059-22665-1-git-send-email-keescook@chromium.org> <20160614215914.GA16454@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160614215914.GA16454@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Arnd Bergmann <arnd@arndb.de>, Markus Pargmann <mpa@pengutronix.de>, Olof Johansson <olof@lixom.net>, Brian Norris <computersforpeace@gmail.com>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Lee Campbell <leecam@google.com>, Tony Luck <tony.luck@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2016 at 2:59 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jun 10, 2016 at 03:50:58PM -0700, Kees Cook wrote:
>> This is a "v4" of Greg Hackmann's DT bindings for ramoops. This is
>> what I'm going to land in the pstore tree unless there are strong and
>> convincing arguments against it. :)
>>
>> I made a number of changes based people's feedback, and I want to get
>> it unblocked. This patch is already carried by Android, and it doesn't
>> need to be out of tree.
>>
>> To respond to Arnd's comment: I like this as the ramoops node, not the
>> pstore node, since it describes the ramoops backend, not the pstore
>> subsystem, which has different controls, and can only have one backend
>> at a time. So it doesn't make sense to me to have this have a redundant
>> extra pstore node, since the very presence of ramoops implies pstore.
>
> Either I don't follow or you don't get Arnd's comment...
>
> IIRC, his suggestion which I agree with was to remove the memory-region
> phandle and just move all the properties into the reserved memory node
> directly. This simplifies things such that we are just describing
> properties of a chunk of memory rather than a Linux specific node for
> virtual driver.

Ah! Okay, I'm a DT newbie, so I think I misunderstood Arnd. :) If it's
easy, can you create a patch for that against the v4 I sent of Greg's
patch? I'm not sure how to do what you're suggesting. :)

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
