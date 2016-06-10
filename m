From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v4 0/1] pstore/ram: add Device Tree bindings
Date: Fri, 10 Jun 2016 15:50:58 -0700
Message-ID: <1465599059-22665-1-git-send-email-keescook@chromium.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Greg Hackmann <ghackmann@google.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Olof Johansson <olof@lixom.net>, Brian Norris <computersforpeace@gmail.com>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Lee Campbell <leecam@google.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is a "v4" of Greg Hackmann's DT bindings for ramoops. This is
what I'm going to land in the pstore tree unless there are strong and
convincing arguments against it. :)

I made a number of changes based people's feedback, and I want to get
it unblocked. This patch is already carried by Android, and it doesn't
need to be out of tree.

To respond to Arnd's comment: I like this as the ramoops node, not the
pstore node, since it describes the ramoops backend, not the pstore
subsystem, which has different controls, and can only have one backend
at a time. So it doesn't make sense to me to have this have a redundant
extra pstore node, since the very presence of ramoops implies pstore.

Markus Pargmann's issues I think were well addressed by Rob Herring.

I simplified code by using Olof Johansson's suggestion to reduce the
parsing width to u32.

I added Brian Norris's crash fix.

Beyond that, I made whitespace changes, consolidated some code, fixed
some long lines, updated documentation, etc.

Hopefully this all looks good. Further testing would be appreciated. :)

Thanks!

-Kees

