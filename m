From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Fri, 4 Oct 2019 17:38:12 -0400
Message-ID: <20191004213812.GA24644@mit.edu>
References: <20190923090249.127984-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190923090249.127984-1-brendanhiggins@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>
Cc: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, yamada.masahiro@socionext.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 02:02:30AM -0700, Brendan Higgins wrote:
> ## TL;DR
> 
> This revision addresses comments from Linus[1] and Randy[2], by moving
> top level `kunit/` directory to `lib/kunit/` and likewise moves top
> level Kconfig entry under lib/Kconfig.debug, so the KUnit submenu now
> shows up under the "Kernel Hacking" menu.

This question is primarily directed at Shuah and Linus....

What's the current status of the kunit series now that Brendan has
moved it out of the top-level kunit directory as Linus has requested?

There doesn't appear to have been many comments or changes since since
September 23rd, and I was very much hoping they could land before
-rc2, since I've been hoping to add unit tests for ext4.

Is kunit likely to be able to be landed in Linus's tree during this
development cycle?

Many thanks!

					- Ted
