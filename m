From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] scripts/dtc: update dtx_diff cpp and dts include paths to
 match build
Date: Fri, 15 Sep 2017 17:42:48 -0500
Message-ID: <CAL_JsqJDvhH7+4mHfvUhOnc9tsHw49P=+FjVtWCErNnKrH9-zA@mail.gmail.com>
References: <1505513779-11315-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505513779-11315-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 5:16 PM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>

I feel like we just had the same subject. Can you make it more specific.

> Update dtx_diff include paths in the same manner as:
> commit b12869a8d519 ("of: remove drivers/of/testcase-data from
> include search path for CPP"), commit 5ffa2aed389c ("of: remove
> arch/$(SRCARCH)/boot/dts from include search path for CPP"), and
> commit 50f9ddaf64e1 ("of: search scripts/dtc/include-prefixes path
> for both CPP and DTC").

We need a better way for this to stop happening besides me remembering
in reviews...

Perhaps a separate file of include paths that all tools can use?

>
> Remove proposed include path kernel/dts/, which was never implemented
> for the dtb build.
>
> For the diff case, each source file is compiled separately.  For
> each of those compiles, provide the location of the source file
> as an include path, not the location of both source files.
>
> ---
>
> The referenced commits b12869a8d519, 5ffa2aed389c, 50f9ddaf64e1
> are in v4.14-rc1.  No stable kernels need this patch.
>
>  scripts/dtc/dtx_diff |   22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>

This is going to get dropped.

Rob
