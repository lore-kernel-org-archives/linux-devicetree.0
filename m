From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v11 0/6] Solve postboot supplier cleanup and optimize probe ordering
Date: Wed, 11 Sep 2019 03:34:08 -0700
Message-ID: <20190911103409.458512087E@mail.kernel.org>
References: <20190904211126.47518-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904211126.47518-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Quoting Saravana Kannan (2019-09-04 14:11:19)
> v10->v11:
> - Dropped 6/7 and 7/7 from previous series that tried to handle cycles in=
 DT
>   dependencies. We can solve it later when we actually hit a real world i=
ssue
>   in DT.
> - Added a new 1/7 that shifts the numbering for the rest of the patches
> - 1/7 adds a way to look up a device from a fwnode so that this series ca=
n work
>   across bus and firmware types
> - 3/7 removed references to platform_device from of/property.c
> - 4/7 Minor variable rename
> - 4/7 Defer sync_state() be default at driver core level and resume at
>   late_initcall_sync(). That way, we don't depend on any specific bus typ=
es
>   having to pause/resume sync_state() till late_initcall_sync()

Please reverse this list so that most recent series changes come first
and we don't have to scroll through all the history to get to what has
changed recently.

Also, please Cc me on future changes and I would suggest involving any
subsystem maintainers that this code is optimizing for. Looks like Mark
Brown and Georgi Djakov should be included in this series for awareness
(but it's at v11 already!)
